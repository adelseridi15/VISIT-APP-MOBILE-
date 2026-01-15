import { useEffect, useState } from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  TouchableOpacity,
  Image,
} from 'react-native';
import { Heart, Trash2 } from 'lucide-react-native';
import { supabase, Favorite } from '@/lib/supabase';
import { LinearGradient } from 'expo-linear-gradient';
import { router } from 'expo-router';

type FavoriteItem = {
  id: string;
  item_type: string;
  item_id: string;
  name: string;
  name_ar: string;
  description: string;
  image_url: string;
  category?: string;
};

export default function FavoritesScreen() {
  const [favorites, setFavorites] = useState<FavoriteItem[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadFavorites();
  }, []);

  async function loadFavorites() {
    try {
      const { data: favData, error: favError } = await supabase
        .from('favorites')
        .select('*')
        .order('created_at', { ascending: false });

      if (favError) throw favError;

      const enrichedFavorites: FavoriteItem[] = [];

      for (const fav of favData || []) {
        let itemData = null;

        if (fav.item_type === 'region') {
          const { data } = await supabase
            .from('regions')
            .select('*')
            .eq('id', fav.item_id)
            .maybeSingle();
          itemData = data;
        } else if (fav.item_type === 'heritage') {
          const { data } = await supabase
            .from('heritage_sites')
            .select('*')
            .eq('id', fav.item_id)
            .maybeSingle();
          itemData = data;
        } else if (fav.item_type === 'gastronomy') {
          const { data } = await supabase
            .from('gastronomy')
            .select('*')
            .eq('id', fav.item_id)
            .maybeSingle();
          itemData = data;
        }

        if (itemData) {
          enrichedFavorites.push({
            id: fav.id,
            item_type: fav.item_type,
            item_id: fav.item_id,
            name: itemData.name,
            name_ar: itemData.name_ar,
            description: itemData.description,
            image_url: itemData.image_url,
            category: itemData.category,
          });
        }
      }

      setFavorites(enrichedFavorites);
    } catch (error) {
      console.error('Error loading favorites:', error);
    } finally {
      setLoading(false);
    }
  }

  async function removeFavorite(favoriteId: string) {
    try {
      const { error } = await supabase
        .from('favorites')
        .delete()
        .eq('id', favoriteId);

      if (error) throw error;

      setFavorites((prev) => prev.filter((fav) => fav.id !== favoriteId));
    } catch (error) {
      console.error('Error removing favorite:', error);
    }
  }

  const openFavorite = (item: FavoriteItem) => {
    if (item.item_type !== 'region') return;
    router.push({
      pathname: '/region/[id]',
      params: { id: item.item_id },
    });
  };

  return (
    <View style={styles.container}>
      <LinearGradient
        colors={['#dc2626', '#b91c1c']}
        style={styles.header}>
        <Text style={styles.headerTitle}>Mes Favoris</Text>
        <Text style={styles.headerSubtitle}>
          {favorites.length}{' '}
          {favorites.length === 1 ? 'favori' : 'favoris'}
        </Text>
      </LinearGradient>

      <ScrollView
        style={styles.content}
        showsVerticalScrollIndicator={false}>
        {loading ? (
          <Text style={styles.loadingText}>Chargement...</Text>
        ) : favorites.length === 0 ? (
          <View style={styles.emptyContainer}>
            <Heart size={64} color="#e5e7eb" strokeWidth={1.5} />
            <Text style={styles.emptyTitle}>Aucun favori</Text>
            <Text style={styles.emptyText}>
              Explorez l'Algérie et ajoutez vos découvertes préférées
            </Text>
          </View>
        ) : (
          favorites.map((item) => (
            <TouchableOpacity
              key={item.id}
              style={styles.card}
              onPress={() => openFavorite(item)}
              disabled={item.item_type !== 'region'}
              activeOpacity={0.8}>
              <Image
                source={{ uri: item.image_url }}
                style={styles.cardImage}
                resizeMode="cover"
              />
              <View style={styles.cardContent}>
                {item.category && (
                  <View style={styles.categoryBadge}>
                    <Text style={styles.categoryText}>{item.category}</Text>
                  </View>
                )}
                <Text style={styles.cardTitle}>{item.name}</Text>
                <Text style={styles.cardTitleAr}>{item.name_ar}</Text>
                <Text style={styles.cardDescription} numberOfLines={2}>
                  {item.description}
                </Text>
              </View>
              <TouchableOpacity
                style={styles.removeButton}
                onPress={() => removeFavorite(item.id)}
                activeOpacity={0.7}>
                <Trash2 size={20} color="#ffffff" strokeWidth={2.5} />
              </TouchableOpacity>
            </TouchableOpacity>
          ))
        )}
      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f9fafb',
  },
  header: {
    paddingTop: 60,
    paddingBottom: 30,
    paddingHorizontal: 24,
  },
  headerTitle: {
    fontSize: 36,
    fontWeight: '800',
    color: '#ffffff',
    marginBottom: 8,
  },
  headerSubtitle: {
    fontSize: 15,
    color: '#ffffff',
    opacity: 0.9,
    fontWeight: '500',
  },
  content: {
    flex: 1,
    padding: 24,
  },
  loadingText: {
    textAlign: 'center',
    color: '#6b7280',
    fontSize: 16,
    marginTop: 40,
  },
  emptyContainer: {
    alignItems: 'center',
    justifyContent: 'center',
    paddingVertical: 80,
    paddingHorizontal: 40,
  },
  emptyTitle: {
    fontSize: 24,
    fontWeight: '700',
    color: '#111827',
    marginTop: 20,
    marginBottom: 8,
  },
  emptyText: {
    fontSize: 15,
    color: '#6b7280',
    textAlign: 'center',
    lineHeight: 22,
  },
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
  cardImage: {
    width: '100%',
    height: 180,
  },
  cardContent: {
    padding: 16,
  },
  categoryBadge: {
    alignSelf: 'flex-start',
    backgroundColor: '#dc2626',
    paddingHorizontal: 12,
    paddingVertical: 6,
    borderRadius: 8,
    marginBottom: 12,
  },
  categoryText: {
    color: '#ffffff',
    fontSize: 12,
    fontWeight: '700',
    textTransform: 'uppercase',
  },
  cardTitle: {
    fontSize: 22,
    fontWeight: '700',
    color: '#111827',
    marginBottom: 4,
  },
  cardTitleAr: {
    fontSize: 16,
    color: '#6b7280',
    marginBottom: 8,
    fontWeight: '600',
  },
  cardDescription: {
    fontSize: 14,
    color: '#4b5563',
    lineHeight: 20,
  },
  removeButton: {
    position: 'absolute',
    top: 12,
    right: 12,
    backgroundColor: '#dc2626',
    borderRadius: 12,
    padding: 10,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.2,
    shadowRadius: 4,
    elevation: 3,
  },
});
