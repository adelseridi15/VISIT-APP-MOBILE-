import { useEffect, useState } from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  Image,
  TouchableOpacity,
} from 'react-native';
import { useLocalSearchParams, router } from 'expo-router';
import { LinearGradient } from 'expo-linear-gradient';
import {
  ArrowLeft,
  Heart,
  MapPin,
  Landmark,
  UtensilsCrossed,
} from 'lucide-react-native';
import { supabase, Region, HeritageSite, Gastronomy } from '@/lib/supabase';

export default function RegionDetailScreen() {
  const { id } = useLocalSearchParams<{ id: string }>();
  const [region, setRegion] = useState<Region | null>(null);
  const [heritage, setHeritage] = useState<HeritageSite[]>([]);
  const [gastronomy, setGastronomy] = useState<Gastronomy[]>([]);
  const [isFavorite, setIsFavorite] = useState(false);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (id) {
      loadRegionData();
      checkFavorite();
    }
  }, [id]);

  async function loadRegionData() {
    try {
      const [regionResult, heritageResult, gastronomyResult] =
        await Promise.all([
          supabase.from('regions').select('*').eq('id', id).maybeSingle(),
          supabase.from('heritage_sites').select('*').eq('region_id', id),
          supabase.from('gastronomy').select('*').eq('region_id', id),
        ]);

      if (regionResult.data) setRegion(regionResult.data);
      if (heritageResult.data) setHeritage(heritageResult.data);
      if (gastronomyResult.data) setGastronomy(gastronomyResult.data);
    } catch (error) {
      console.error('Error loading region data:', error);
    } finally {
      setLoading(false);
    }
  }

  async function checkFavorite() {
    try {
      const { data } = await supabase
        .from('favorites')
        .select('id')
        .eq('item_type', 'region')
        .eq('item_id', id)
        .maybeSingle();

      setIsFavorite(!!data);
    } catch (error) {
      console.error('Error checking favorite:', error);
    }
  }

  async function toggleFavorite() {
    try {
      if (isFavorite) {
        const { error } = await supabase
          .from('favorites')
          .delete()
          .eq('item_type', 'region')
          .eq('item_id', id);

        if (error) throw error;
        setIsFavorite(false);
      } else {
        const { error } = await supabase.from('favorites').insert({
          item_type: 'region',
          item_id: id,
        });

        if (error) throw error;
        setIsFavorite(true);
      }
    } catch (error) {
      console.error('Error toggling favorite:', error);
    }
  }

  const openOnMap = (latitude: number, longitude: number, type: 'heritage' | 'gastronomy') => {
    router.push({
      pathname: '/(drawer)/(tabs)/explore',
      params: {
        focusLat: String(latitude),
        focusLng: String(longitude),
        focusType: type,
      },
    });
  };

  if (loading || !region) {
    return (
      <View style={styles.loadingContainer}>
        <Text style={styles.loadingText}>Chargement...</Text>
      </View>
    );
  }

  return (
    <ScrollView style={styles.container} showsVerticalScrollIndicator={false}>
      <View style={styles.heroContainer}>
        <Image
          source={{ uri: region.image_url }}
          style={styles.heroImage}
          resizeMode="cover"
        />
        <LinearGradient
          colors={['rgba(0,0,0,0.3)', 'rgba(0,0,0,0.7)']}
          style={styles.heroGradient}>
          <TouchableOpacity
            style={styles.backButton}
            onPress={() => router.back()}
            activeOpacity={0.8}>
            <ArrowLeft size={24} color="#ffffff" strokeWidth={2.5} />
          </TouchableOpacity>

          <TouchableOpacity
            style={styles.favoriteButton}
            onPress={toggleFavorite}
            activeOpacity={0.8}>
            <Heart
              size={24}
              color="#ffffff"
              fill={isFavorite ? '#ffffff' : 'transparent'}
              strokeWidth={2.5}
            />
          </TouchableOpacity>

          <View style={styles.heroContent}>
            <Text style={styles.heroTitle}>{region.name}</Text>
            <Text style={styles.heroTitleAr}>{region.name_ar}</Text>
            <View style={styles.locationContainer}>
              <MapPin size={16} color="#ffffff" />
              <Text style={styles.locationText}>Algerie</Text>
            </View>
          </View>
        </LinearGradient>
      </View>

      <View style={styles.content}>
        <Text style={styles.description}>{region.description}</Text>

        {heritage.length > 0 && (
          <View style={styles.section}>
            <View style={styles.sectionHeader}>
              <Landmark size={24} color="#16a34a" strokeWidth={2.5} />
              <Text style={styles.sectionTitle}>Patrimoine</Text>
            </View>
            {heritage.map((site) => (
              <TouchableOpacity
                key={site.id}
                style={styles.itemCard}
                activeOpacity={0.82}
                onPress={() => openOnMap(site.latitude, site.longitude, 'heritage')}>
                <Image
                  source={{ uri: site.image_url }}
                  style={styles.itemImage}
                  resizeMode="cover"
                />
                <View style={styles.itemContent}>
                  <View style={styles.itemBadge}>
                    <Text style={styles.itemBadgeText}>{site.category}</Text>
                  </View>
                  <Text style={styles.itemTitle}>{site.name}</Text>
                  <Text style={styles.itemTitleAr}>{site.name_ar}</Text>
                  <Text style={styles.itemDescription} numberOfLines={3}>
                    {site.description}
                  </Text>
                </View>
              </TouchableOpacity>
            ))}
          </View>
        )}

        {gastronomy.length > 0 && (
          <View style={styles.section}>
            <View style={styles.sectionHeader}>
              <UtensilsCrossed
                size={24}
                color="#16a34a"
                strokeWidth={2.5}
              />
              <Text style={styles.sectionTitle}>Gastronomie</Text>
            </View>
            {gastronomy.map((dish) => (
              <TouchableOpacity
                key={dish.id}
                style={styles.itemCard}
                activeOpacity={0.82}
                onPress={() => openOnMap(dish.latitude, dish.longitude, 'gastronomy')}>
                <Image
                  source={{ uri: dish.image_url }}
                  style={styles.itemImage}
                  resizeMode="cover"
                />
                <View style={styles.itemContent}>
                  <View style={styles.itemBadge}>
                    <Text style={styles.itemBadgeText}>{dish.category}</Text>
                  </View>
                  <Text style={styles.itemTitle}>{dish.name}</Text>
                  <Text style={styles.itemTitleAr}>{dish.name_ar}</Text>
                  <Text style={styles.itemDescription} numberOfLines={2}>
                    {dish.description}
                  </Text>
                  {dish.ingredients.length > 0 && (
                    <View style={styles.ingredientsContainer}>
                      <Text style={styles.ingredientsLabel}>Ingredients:</Text>
                      <Text style={styles.ingredientsText} numberOfLines={2}>
                        {dish.ingredients.join(', ')}
                      </Text>
                    </View>
                  )}
                </View>
              </TouchableOpacity>
            ))}
          </View>
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
  loadingContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#f9fafb',
  },
  loadingText: {
    fontSize: 16,
    color: '#6b7280',
  },
  heroContainer: {
    height: 400,
    position: 'relative',
  },
  heroImage: {
    width: '100%',
    height: '100%',
  },
  heroGradient: {
    position: 'absolute',
    top: 0,
    left: 0,
    right: 0,
    bottom: 0,
    justifyContent: 'space-between',
    padding: 24,
    paddingTop: 50,
  },
  backButton: {
    width: 44,
    height: 44,
    borderRadius: 22,
    backgroundColor: 'rgba(0,0,0,0.3)',
    justifyContent: 'center',
    alignItems: 'center',
  },
  favoriteButton: {
    position: 'absolute',
    top: 50,
    right: 24,
    width: 44,
    height: 44,
    borderRadius: 22,
    backgroundColor: 'rgba(0,0,0,0.3)',
    justifyContent: 'center',
    alignItems: 'center',
  },
  heroContent: {
    gap: 8,
  },
  heroTitle: {
    fontSize: 40,
    fontWeight: '800',
    color: '#ffffff',
    letterSpacing: -0.5,
  },
  heroTitleAr: {
    fontSize: 24,
    color: '#ffffff',
    opacity: 0.95,
    fontWeight: '600',
  },
  locationContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 6,
    marginTop: 4,
  },
  locationText: {
    color: '#ffffff',
    fontSize: 14,
    fontWeight: '600',
  },
  content: {
    padding: 24,
  },
  description: {
    fontSize: 16,
    color: '#374151',
    lineHeight: 26,
    marginBottom: 32,
  },
  section: {
    marginBottom: 32,
  },
  sectionHeader: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 12,
    marginBottom: 20,
  },
  sectionTitle: {
    fontSize: 24,
    fontWeight: '700',
    color: '#111827',
  },
  itemCard: {
    marginBottom: 16,
    borderRadius: 16,
    overflow: 'hidden',
    backgroundColor: '#ffffff',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.08,
    shadowRadius: 8,
    elevation: 3,
  },
  itemImage: {
    width: '100%',
    height: 160,
  },
  itemContent: {
    padding: 16,
  },
  itemBadge: {
    alignSelf: 'flex-start',
    backgroundColor: '#16a34a',
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: 6,
    marginBottom: 10,
  },
  itemBadgeText: {
    color: '#ffffff',
    fontSize: 11,
    fontWeight: '700',
    textTransform: 'uppercase',
  },
  itemTitle: {
    fontSize: 18,
    fontWeight: '700',
    color: '#111827',
    marginBottom: 4,
  },
  itemTitleAr: {
    fontSize: 14,
    color: '#6b7280',
    marginBottom: 8,
    fontWeight: '600',
  },
  itemDescription: {
    fontSize: 13,
    color: '#4b5563',
    lineHeight: 19,
  },
  ingredientsContainer: {
    marginTop: 10,
    paddingTop: 10,
    borderTopWidth: 1,
    borderTopColor: '#f3f4f6',
  },
  ingredientsLabel: {
    fontSize: 12,
    fontWeight: '700',
    color: '#16a34a',
    marginBottom: 4,
  },
  ingredientsText: {
    fontSize: 12,
    color: '#6b7280',
    fontStyle: 'italic',
  },
});
