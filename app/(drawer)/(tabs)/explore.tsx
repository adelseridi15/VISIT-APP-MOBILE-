import { useEffect, useMemo, useRef, useState } from 'react';
import {
  View,
  Text,
  StyleSheet,
  FlatList,
  TouchableOpacity,
  Image,
  Dimensions,
  Platform,
  ListRenderItem,
} from 'react-native';
import { useLocalSearchParams } from 'expo-router';
import { Landmark, UtensilsCrossed } from 'lucide-react-native';
import { supabase, HeritageSite, Gastronomy } from '@/lib/supabase';
import { LinearGradient } from 'expo-linear-gradient';

import type MapViewType from 'react-native-maps';
import type { Region } from 'react-native-maps';
import { GooglePlacesAutocomplete } from 'react-native-google-places-autocomplete';
import Constants from 'expo-constants';

type Tab = 'heritage' | 'gastronomy';

const GOOGLE_KEY = Constants.expoConfig?.extra?.GOOGLE_MAPS_API_KEY as
  | string
  | undefined;

const DEFAULT_REGION: Region = {
  latitude: 36.7538,
  longitude: 3.0588,
  latitudeDelta: 0.25,
  longitudeDelta: 0.25,
};

const WILAYA_ORDER = [
  'Adrar',
  'Chlef',
  'Laghouat',
  'Oum El Bouaghi',
  'Batna',
  'Béjaïa',
  'Biskra',
  'Béchar',
  'Blida',
  'Bouira',
  'Tamanrasset',
  'Tébessa',
  'Tlemcen',
  'Tiaret',
  'Tizi Ouzou',
  'Alger',
  'Djelfa',
  'Jijel',
  'Sétif',
  'Saïda',
  'Skikda',
  'Sidi Bel Abbès',
  'Annaba',
  'Guelma',
  'Constantine',
  'Médéa',
  'Mostaganem',
  "M'Sila",
  'Mascara',
  'Ouargla',
  'Oran',
  'El Bayadh',
  'Illizi',
  'Bordj Bou Arreridj',
  'Boumerdès',
  'El Tarf',
  'Tindouf',
  'Tissemsilt',
  'El Oued',
  'Khenchela',
  'Souk Ahras',
  'Tipaza',
  'Mila',
  'Aïn Defla',
  'Naâma',
  'Aïn Témouchent',
  'Ghardaïa',
  'Relizane',
  'Timimoun',
  'Bordj Badji Mokhtar',
  'Ouled Djellal',
  'Béni Abbès',
  'In Salah',
  'In Guezzam',
  'Touggourt',
  'Djanet',
  "El M'Ghair",
  'El Meniaa',
];

type HeritageWithRegionName = HeritageSite & { regionName?: string };
type GastronomyWithRegionName = Gastronomy & { regionName?: string };

const normalize = (value?: string) =>
  (value ?? '')
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/[^a-zA-Z0-9 ]+/g, ' ')
    .toLowerCase()
    .replace(/\s+/g, ' ')
    .trim();

const normalizedWilayaList = WILAYA_ORDER.map((name) => normalize(name));
const wilayaOrderMap = new Map(normalizedWilayaList.map((name, index) => [name, index]));
const wilayaAliases = new Map<string, string>([
  ['ghardacia', 'ghardaia'],
  ['ghardaia', 'ghardaia'],
  ['ghardaya', 'ghardaia'],
  ['msila', "m sila"],
]);

const levenshtein = (a: string, b: string) => {
  if (a === b) return 0;
  if (!a.length) return b.length;
  if (!b.length) return a.length;
  const matrix = Array.from({ length: a.length + 1 }, (_, i) => [i, ...new Array(b.length).fill(0)]);
  for (let j = 0; j <= b.length; j++) matrix[0][j] = j;
  for (let i = 1; i <= a.length; i++) {
    for (let j = 1; j <= b.length; j++) {
      const cost = a[i - 1] === b[j - 1] ? 0 : 1;
      matrix[i][j] = Math.min(
        matrix[i - 1][j] + 1,
        matrix[i][j - 1] + 1,
        matrix[i - 1][j - 1] + cost
      );
    }
  }
  return matrix[a.length][b.length];
};

const getWilayaKey = (regionName?: string) => {
  const norm = normalize(regionName);
  if (!norm) return null;
  if (wilayaOrderMap.has(norm)) return norm;
  const alias = wilayaAliases.get(norm);
  if (alias && wilayaOrderMap.has(alias)) return alias;

  // Fuzzy match by prefix first, then by distance
  for (const candidate of normalizedWilayaList) {
    if (norm.startsWith(candidate.slice(0, 5)) || candidate.startsWith(norm.slice(0, 5))) {
      return candidate;
    }
  }

  let best: { key: string | null; dist: number } = { key: null, dist: Number.MAX_SAFE_INTEGER };
  for (const candidate of normalizedWilayaList) {
    const dist = levenshtein(norm, candidate);
    if (dist < best.dist) best = { key: candidate, dist };
  }
  return best.dist <= 2 ? best.key : null;
};

export default function ExploreScreen() {
  const params = useLocalSearchParams<{
    focusLat?: string;
    focusLng?: string;
    focusType?: 'heritage' | 'gastronomy';
  }>();

  const [activeTab, setActiveTab] = useState<Tab>('heritage');
  const [heritageSites, setHeritageSites] = useState<HeritageWithRegionName[]>([]);
  const [gastronomy, setGastronomy] = useState<GastronomyWithRegionName[]>([]);
  const [loading, setLoading] = useState(true);

  const mapRef = useRef<MapViewType | null>(null);
  const listRef = useRef<FlatList>(null);
  const hasAppliedInitialFocus = useRef(false);

  const [searchText, setSearchText] = useState('');

  const mapsModule = useMemo(
    () => (Platform.OS === 'web' ? null : (require('react-native-maps') as typeof import('react-native-maps'))),
    []
  );

  const MapComponent = mapsModule?.default;
  const MarkerComponent = mapsModule?.Marker;
  const mapProvider = Platform.OS === 'android' ? 'google' : undefined;

  useEffect(() => {
    loadData();
  }, []);

  const wilayaRank = (regionName?: string) => {
    const key = getWilayaKey(regionName);
    const rank = key ? wilayaOrderMap.get(key) : undefined;
    return typeof rank === 'number' ? rank : Number.MAX_SAFE_INTEGER;
  };

  const sortByWilaya = <T extends { regionName?: string; name?: string }>(list: T[]) =>
    [...list].sort((a, b) => {
      const aRank = wilayaRank(a.regionName);
      const bRank = wilayaRank(b.regionName);
      if (aRank !== bRank) return aRank - bRank;
      return (a.name ?? '').localeCompare(b.name ?? '');
    });

  async function loadData() {
    setLoading(true);
    try {
      const [regionsResult, heritageResult, gastronomyResult] = await Promise.all([
        supabase.from('regions').select('id, name'),
        supabase.from('heritage_sites').select('*'),
        supabase.from('gastronomy').select('*'),
      ]);

      const regionNameById = new Map<string, string>(
        (regionsResult.data ?? []).map((r: any) => [String(r.id ?? ''), String(r.name ?? '')])
      );

      const withRegionName = <T extends { region_id?: string }>(rows: T[]) =>
        rows.map((row) => ({
          ...(row as any),
          regionName: regionNameById.get(String(row.region_id ?? '')) ?? '',
        }));

      if (heritageResult.data)
        setHeritageSites(sortByWilaya(withRegionName(heritageResult.data as HeritageSite[])));
      if (gastronomyResult.data)
        setGastronomy(sortByWilaya(withRegionName(gastronomyResult.data as Gastronomy[])));
    } catch (error) {
      console.error('Error loading data:', error);
    } finally {
      setLoading(false);
    }
  }

  function hasCoords(x: any) {
    return typeof x.latitude === 'number' && typeof x.longitude === 'number';
  }

  const items = useMemo(() => {
    const base = activeTab === 'heritage' ? heritageSites : gastronomy;
    const filtered = !searchText.trim()
      ? base
      : (base as any[]).filter((x) => {
          const name = (x.name ?? '').toLowerCase();
          const category = (x.category ?? '').toLowerCase();
          const desc = (x.description ?? '').toLowerCase();
          const q = searchText.toLowerCase();
          return name.includes(q) || category.includes(q) || desc.includes(q);
        });
    return sortByWilaya(filtered as any[]);
  }, [activeTab, heritageSites, gastronomy, searchText]);

  const handlePlaceSelect = (_: any, details: any) => {
    const loc = details?.geometry?.location;
    if (!loc) return;

    const next: Region = {
      latitude: loc.lat,
      longitude: loc.lng,
      latitudeDelta: 0.12,
      longitudeDelta: 0.12,
    };

    scrollToMap();
    mapRef.current?.animateToRegion(next, 800);
  };

  const scrollToMap = () => {
    listRef.current?.scrollToOffset({ offset: 0, animated: true });
  };

  const focusItemOnMap = (item: any) => {
    if (!hasCoords(item)) return;

    scrollToMap();
    mapRef.current?.animateToRegion(
      {
        latitude: item.latitude,
        longitude: item.longitude,
        latitudeDelta: 0.08,
        longitudeDelta: 0.08,
      },
      700
    );
  };

  const renderItem: ListRenderItem<HeritageWithRegionName | GastronomyWithRegionName> = ({ item }) => {
    const isHeritage = activeTab === 'heritage';
    const dish = item as Gastronomy;

    return (
      <TouchableOpacity
        style={styles.card}
        activeOpacity={0.8}
        onPress={() => focusItemOnMap(item)}
      >
        <Image source={{ uri: item.image_url }} style={styles.cardImage} resizeMode="cover" />
        <View style={styles.cardContent}>
          <View style={styles.categoryBadge}>
            <Text style={styles.categoryText}>{item.category}</Text>
          </View>
          <Text style={styles.cardTitle}>{item.name}</Text>
          <Text style={styles.cardTitleAr}>{item.name_ar}</Text>
          <Text style={styles.cardDescription} numberOfLines={isHeritage ? 3 : 2}>
            {item.description}
          </Text>
          {!isHeritage && dish.ingredients?.length > 0 && (
            <View style={styles.ingredientsContainer}>
              <Text style={styles.ingredientsLabel}>Ingrédients:</Text>
              <Text style={styles.ingredientsText} numberOfLines={2}>
                {dish.ingredients.join(', ')}
              </Text>
            </View>
          )}
        </View>
      </TouchableOpacity>
    );
  };

  const listData = (items as (HeritageWithRegionName | GastronomyWithRegionName)[]) ?? [];

  useEffect(() => {
    if (hasAppliedInitialFocus.current) return;
    const lat = Number(params.focusLat);
    const lng = Number(params.focusLng);
    if (!Number.isFinite(lat) || !Number.isFinite(lng)) return;

    if (params.focusType === 'gastronomy') setActiveTab('gastronomy');
    scrollToMap();
    mapRef.current?.animateToRegion(
      {
        latitude: lat,
        longitude: lng,
        latitudeDelta: 0.08,
        longitudeDelta: 0.08,
      },
      700
    );
    hasAppliedInitialFocus.current = true;
  }, [params.focusLat, params.focusLng, params.focusType]);

  return (
    <FlatList
      ref={listRef}
      style={styles.container}
      contentContainerStyle={styles.listContent}
      data={loading ? [] : listData}
      keyExtractor={(item) => item.id}
      renderItem={renderItem}
      ListHeaderComponent={
        <View style={styles.headerBlock}>
          <LinearGradient colors={['#16a34a', '#15803d']} style={styles.header}>
            <Text style={styles.headerTitle}>Explorer</Text>
            <Text style={styles.headerSubtitle}>
              Découvrez le patrimoine et la gastronomie algérienne
            </Text>
          </LinearGradient>

          <View style={styles.mapWrap}>
            <View style={styles.searchWrap}>
              <GooglePlacesAutocomplete
                placeholder="Rechercher une région (ex: Alger, Oran...)"
                enablePoweredByContainer={false}
                fetchDetails
                query={{
                  key: GOOGLE_KEY ?? '',
                  language: 'fr',
                  components: 'country:dz',
                }}
                textInputProps={{
                  value: searchText,
                  onChangeText: setSearchText,
                  placeholderTextColor: '#6b7280',
                }}
                onPress={handlePlaceSelect}
                styles={{
                  container: { flex: 0 },
                  textInput: styles.searchInput,
                  listView: styles.searchList,
                }}
              />
            </View>

            {MapComponent ? (
              <MapComponent ref={mapRef} provider={mapProvider} style={styles.map} initialRegion={DEFAULT_REGION}>
                {items.filter(hasCoords).map((x: any) =>
                  MarkerComponent ? (
                    <MarkerComponent
                      key={x.id}
                      coordinate={{ latitude: x.latitude, longitude: x.longitude }}
                      title={x.name}
                      description={x.category}
                    />
                  ) : null
                )}
              </MapComponent>
            ) : (
              <View style={[styles.map, styles.webMapFallback]}>
                <Text style={styles.webMapText}>
                  Map unavailable on web preview. Open the app on a device to view the interactive map.
                </Text>
              </View>
            )}

            {!GOOGLE_KEY ? (
              <Text style={styles.keyWarning}>
                GOOGLE_MAPS_API_KEY missing. Add it in app.json - expo.extra
              </Text>
            ) : null}
          </View>

          <View style={styles.tabContainer}>
            <TouchableOpacity
              style={[styles.tab, activeTab === 'heritage' && styles.activeTab]}
              onPress={() => setActiveTab('heritage')}
              activeOpacity={0.7}
            >
              <Landmark
                size={20}
                color={activeTab === 'heritage' ? '#16a34a' : '#6b7280'}
                strokeWidth={2.5}
              />
              <Text style={[styles.tabText, activeTab === 'heritage' && styles.activeTabText]}>
                Patrimoine
              </Text>
            </TouchableOpacity>

            <TouchableOpacity
              style={[styles.tab, activeTab === 'gastronomy' && styles.activeTab]}
              onPress={() => setActiveTab('gastronomy')}
              activeOpacity={0.7}
            >
              <UtensilsCrossed
                size={20}
                color={activeTab === 'gastronomy' ? '#16a34a' : '#6b7280'}
                strokeWidth={2.5}
              />
              <Text style={[styles.tabText, activeTab === 'gastronomy' && styles.activeTabText]}>
                Gastronomie
              </Text>
            </TouchableOpacity>
          </View>
        </View>
      }
      ListEmptyComponent={
        loading ? (
          <Text style={styles.loadingText}>Chargement...</Text>
        ) : (
          <Text style={styles.loadingText}>Rien à afficher pour cette recherche.</Text>
        )
      }
      refreshing={loading}
      onRefresh={loadData}
      showsVerticalScrollIndicator={false}
      removeClippedSubviews
      initialNumToRender={3}
      maxToRenderPerBatch={5}
      windowSize={7}
    />
  );
}

const { height } = Dimensions.get('window');

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: '#f9fafb' },
  headerBlock: { marginHorizontal: -24 },
  header: { paddingTop: 60, paddingBottom: 30, paddingHorizontal: 24 },
  headerTitle: { fontSize: 36, fontWeight: '800', color: '#ffffff', marginBottom: 8 },
  headerSubtitle: { fontSize: 15, color: '#ffffff', opacity: 0.9, fontWeight: '500' },

  mapWrap: {
    backgroundColor: '#fff',
    paddingHorizontal: 16,
    paddingTop: 12,
    paddingBottom: 12,
    borderBottomWidth: 1,
    borderBottomColor: '#f3f4f6',
  },
  searchWrap: { zIndex: 10 },
  searchInput: {
    height: 46,
    borderRadius: 12,
    backgroundColor: '#f3f4f6',
    paddingHorizontal: 14,
    fontSize: 14,
    color: '#111827',
  },
  searchList: { marginTop: 8, borderRadius: 12, overflow: 'hidden' },
  map: {
    marginTop: 12,
    height: Math.min(260, height * 0.28),
    borderRadius: 16,
    overflow: 'hidden',
  },
  webMapFallback: {
    backgroundColor: '#e5e7eb',
    alignItems: 'center',
    justifyContent: 'center',
    paddingHorizontal: 16,
  },
  webMapText: { color: '#4b5563', textAlign: 'center', fontSize: 13, lineHeight: 18 },
  keyWarning: { marginTop: 10, color: '#b91c1c', fontWeight: '700', fontSize: 12 },
  note: { marginTop: 8, color: '#6b7280', fontSize: 12 },

  tabContainer: {
    flexDirection: 'row',
    paddingHorizontal: 24,
    paddingVertical: 16,
    gap: 12,
    backgroundColor: '#ffffff',
    borderBottomWidth: 1,
    borderBottomColor: '#f3f4f6',
  },
  tab: {
    flex: 1,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    paddingVertical: 12,
    paddingHorizontal: 16,
    borderRadius: 12,
    backgroundColor: '#f3f4f6',
    gap: 8,
  },
  activeTab: { backgroundColor: '#dcfce7' },
  tabText: { fontSize: 15, fontWeight: '600', color: '#6b7280' },
  activeTabText: { color: '#16a34a' },

  listContent: { paddingHorizontal: 24, paddingBottom: 32 },
  loadingText: { textAlign: 'center', color: '#6b7280', fontSize: 16, marginTop: 40 },

  card: {
    marginBottom: 20,
    borderRadius: 20,
    overflow: 'hidden',
    backgroundColor: '#ffffff',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.08,
    shadowRadius: 8,
    elevation: 3,
  },
  cardImage: { width: '100%', height: 200 },
  cardContent: { padding: 16 },
  categoryBadge: {
    alignSelf: 'flex-start',
    backgroundColor: '#16a34a',
    paddingHorizontal: 12,
    paddingVertical: 6,
    borderRadius: 8,
    marginBottom: 12,
  },
  categoryText: { color: '#ffffff', fontSize: 12, fontWeight: '700', textTransform: 'uppercase' },
  cardTitle: { fontSize: 22, fontWeight: '700', color: '#111827', marginBottom: 4 },
  cardTitleAr: { fontSize: 16, color: '#6b7280', marginBottom: 8, fontWeight: '600' },
  cardDescription: { fontSize: 14, color: '#4b5563', lineHeight: 20 },
  ingredientsContainer: { marginTop: 12, paddingTop: 12, borderTopWidth: 1, borderTopColor: '#f3f4f6' },
  ingredientsLabel: { fontSize: 13, fontWeight: '700', color: '#16a34a', marginBottom: 4 },
  ingredientsText: { fontSize: 13, color: '#6b7280', fontStyle: 'italic' },
});
