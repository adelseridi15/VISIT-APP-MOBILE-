import React, { useEffect, useState } from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  Image,
  TouchableOpacity,
  Dimensions,
  RefreshControl,
} from 'react-native';
import { LinearGradient } from 'expo-linear-gradient';
import { MapPin, Star } from 'lucide-react-native';
import { supabase, Region } from '@/lib/supabase';
import { router } from 'expo-router';

const { width } = Dimensions.get('window');

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

const wilayaRank = (regionName?: string) => {
  const key = getWilayaKey(regionName);
  const rank = key ? wilayaOrderMap.get(key) : undefined;
  return typeof rank === 'number' ? rank : Number.MAX_SAFE_INTEGER;
};

const sortByWilaya = (list: Region[]) =>
  [...list].sort((a, b) => {
    const aRank = wilayaRank(a.name);
    const bRank = wilayaRank(b.name);
    if (aRank !== bRank) return aRank - bRank;
    return (a.name ?? '').localeCompare(b.name ?? '');
  });

export default function HomeScreen() {
  const [regions, setRegions] = useState<Region[]>([]);
  const [loading, setLoading] = useState(true);
  const [refreshing, setRefreshing] = useState(false);

  useEffect(() => {
    loadRegions();
  }, []);

  const openRegionOnMap = (region: Region) => {
    router.push({
      pathname: '/(drawer)/(tabs)/explore',
      params: {
        focusLat: String(region.latitude),
        focusLng: String(region.longitude),
        focusType: 'heritage',
      },
    });
  };

  const onRefresh = React.useCallback(() => {
    setRefreshing(true);
    loadRegions().then(() => setRefreshing(false));
  }, []);

  async function loadRegions() {
    try {
      const { data, error } = await supabase
        .from('regions')
        .select('*')
        .order('created_at', { ascending: true });

      if (error) throw error;

      console.log(
        'Loaded regions count:',
        data?.length ?? 0,
        'using SUPABASE_URL=',
        process.env.EXPO_PUBLIC_SUPABASE_URL
      );
      setRegions(data ? sortByWilaya(data) : []);
    } catch (error) {
      console.error('Error loading regions:', error);
    } finally {
      setLoading(false);
    }
  }

  return (
    <ScrollView
      style={styles.container}
      showsVerticalScrollIndicator={false}
      refreshControl={
        <RefreshControl refreshing={refreshing} onRefresh={onRefresh} />
      }>
      <LinearGradient
        colors={['#16a34a', '#15803d', '#14532d']}
        style={styles.header}>
        <View style={styles.headerContent}>
          <Text style={styles.greeting}>Decouvrez</Text>
          <Text style={styles.title}>L'Algerie</Text>
          <Text style={styles.subtitle}>Patrimoine · Gastronomie · Culture</Text>
        </View>
      </LinearGradient>

      <View style={styles.content}>
        <View style={styles.sectionHeader}>
          <Text style={styles.sectionTitle}>Regions a explorer</Text>
          <Star size={20} color="#16a34a" fill="#16a34a" />
        </View>

        {loading ? (
          <Text style={styles.loadingText}>Chargement...</Text>
        ) : (
          regions.map((region) => (
            <TouchableOpacity
              key={region.id}
              style={styles.regionCard}
              activeOpacity={0.8}
              onPress={() => openRegionOnMap(region)}>
              <Image
                source={{ uri: region.image_url }}
                style={styles.regionImage}
                resizeMode="cover"
              />
              <LinearGradient
                colors={['transparent', 'rgba(0,0,0,0.8)']}
                style={styles.regionGradient}>
                <View style={styles.regionInfo}>
                  <Text style={styles.regionName}>{region.name}</Text>
                  <Text style={styles.regionNameAr}>{region.name_ar}</Text>
                  <Text style={styles.regionDescription} numberOfLines={2}>
                    {region.description}
                  </Text>
                  <View style={styles.locationBadge}>
                    <MapPin size={14} color="#fff" />
                    <Text style={styles.locationText}>Algerie</Text>
                  </View>
                  <TouchableOpacity
                    style={styles.detailChip}
                    activeOpacity={0.85}
                    onPress={() =>
                      router.push({
                        pathname: '/region/[id]',
                        params: { id: region.id },
                      })
                    }>
                    <Text style={styles.detailChipText}>Voir la fiche</Text>
                  </TouchableOpacity>
                </View>
              </LinearGradient>
            </TouchableOpacity>
          ))
        )}
      </View>
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f9fafb',
  },
  header: {
    paddingTop: 60,
    paddingBottom: 40,
    paddingHorizontal: 24,
  },
  headerContent: {
    gap: 4,
  },
  greeting: {
    fontSize: 18,
    color: '#ffffff',
    opacity: 0.9,
    fontWeight: '500',
  },
  title: {
    fontSize: 48,
    fontWeight: '800',
    color: '#ffffff',
    letterSpacing: -1,
  },
  subtitle: {
    fontSize: 16,
    color: '#ffffff',
    opacity: 0.9,
    marginTop: 8,
    fontWeight: '500',
  },
  content: {
    padding: 24,
  },
  sectionHeader: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    marginBottom: 20,
  },
  sectionTitle: {
    fontSize: 24,
    fontWeight: '700',
    color: '#111827',
  },
  loadingText: {
    textAlign: 'center',
    color: '#6b7280',
    fontSize: 16,
    marginTop: 40,
  },
  regionCard: {
    marginBottom: 20,
    borderRadius: 24,
    overflow: 'hidden',
    backgroundColor: '#ffffff',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.1,
    shadowRadius: 12,
    elevation: 5,
  },
  regionImage: {
    width: '100%',
    height: 280,
  },
  regionGradient: {
    position: 'absolute',
    bottom: 0,
    left: 0,
    right: 0,
    height: '70%',
    justifyContent: 'flex-end',
  },
  regionInfo: {
    padding: 20,
  },
  regionName: {
    fontSize: 28,
    fontWeight: '800',
    color: '#ffffff',
    marginBottom: 4,
  },
  regionNameAr: {
    fontSize: 20,
    color: '#ffffff',
    opacity: 0.9,
    marginBottom: 12,
    fontWeight: '600',
  },
  regionDescription: {
    fontSize: 14,
    color: '#ffffff',
    opacity: 0.85,
    lineHeight: 20,
    marginBottom: 12,
  },
  locationBadge: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 6,
    backgroundColor: 'rgba(255,255,255,0.2)',
    alignSelf: 'flex-start',
    paddingHorizontal: 12,
    paddingVertical: 6,
    borderRadius: 12,
  },
  locationText: {
    color: '#ffffff',
    fontSize: 12,
    fontWeight: '600',
  },
  detailChip: {
    marginTop: 10,
    alignSelf: 'flex-start',
    paddingHorizontal: 12,
    paddingVertical: 8,
    borderRadius: 10,
    backgroundColor: 'rgba(255,255,255,0.18)',
  },
  detailChipText: {
    color: '#ffffff',
    fontSize: 12,
    fontWeight: '700',
    letterSpacing: 0.2,
  },
});
