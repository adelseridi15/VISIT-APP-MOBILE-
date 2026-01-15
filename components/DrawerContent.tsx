import { View, Text, StyleSheet, TouchableOpacity } from 'react-native';
import { useAuth } from '@/contexts/AuthContext';
import {
  Home,
  Compass,
  Heart,
  User,
  LogOut,
  Settings,
  Info,
} from 'lucide-react-native';
import { LinearGradient } from 'expo-linear-gradient';
import { router } from 'expo-router';

type DrawerItem = {
  label: string;
  icon: React.ReactNode;
  action: () => void;
};

export function DrawerContent({ navigation }: any) {
  const { user, signOut } = useAuth();

  async function handleSignOut() {
    try {
      await signOut();
      router.replace('/login');
      navigation.closeDrawer();
    } catch (error) {
      console.error('Error signing out:', error);
    }
  }

  const menuItems: DrawerItem[] = [
    {
      label: 'Accueil',
      icon: <Home size={22} color="#16a34a" strokeWidth={2.5} />,
      action: () => {
        navigation.navigate('(tabs)', { screen: 'index' });
        navigation.closeDrawer();
      },
    },
    {
      label: 'Explorer',
      icon: <Compass size={22} color="#16a34a" strokeWidth={2.5} />,
      action: () => {
        navigation.navigate('(tabs)', { screen: 'explore' });
        navigation.closeDrawer();
      },
    },
    {
      label: 'Mes Favoris',
      icon: <Heart size={22} color="#16a34a" strokeWidth={2.5} />,
      action: () => {
        navigation.navigate('(tabs)', { screen: 'favorites' });
        navigation.closeDrawer();
      },
    },
  ];

  const settingsItems: DrawerItem[] = [
    {
      label: 'Mon Profil',
      icon: <User size={22} color="#6b7280" strokeWidth={2.5} />,
      action: () => {
        router.push('/profile');
        navigation.closeDrawer();
      },
    },
    {
      label: 'Paramètres',
      icon: <Settings size={22} color="#6b7280" strokeWidth={2.5} />,
      action: () => {
        router.push('/settings');
        navigation.closeDrawer();
      },
    },
    {
      label: 'À propos',
      icon: <Info size={22} color="#6b7280" strokeWidth={2.5} />,
      action: () => {
        router.push('/about');
        navigation.closeDrawer();
      },
    },
  ];

  return (
    <View style={styles.container}>
      <LinearGradient
        colors={['#16a34a', '#15803d']}
        style={styles.header}>
        <View style={styles.userInfo}>
          <View style={styles.avatar}>
            <Text style={styles.avatarText}>
              {user?.email?.[0].toUpperCase() || 'U'}
            </Text>
          </View>
          <View style={styles.userDetails}>
            <Text style={styles.userName}>
              {user?.user_metadata?.full_name || user?.email?.split('@')[0] || 'Utilisateur'}
            </Text>
            <Text style={styles.userEmail} numberOfLines={1}>
              {user?.email}
            </Text>
          </View>
        </View>
      </LinearGradient>

      <View style={styles.menuSection}>
        <Text style={styles.sectionTitle}>NAVIGATION</Text>
        {menuItems.map((item) => (
          <TouchableOpacity
            key={item.label}
            style={styles.menuItem}
            onPress={item.action}
            activeOpacity={0.7}>
            {item.icon}
            <Text style={styles.menuLabel}>{item.label}</Text>
          </TouchableOpacity>
        ))}
      </View>

      <View style={styles.menuSection}>
        <Text style={styles.sectionTitle}>PARAMÈTRES</Text>
        {settingsItems.map((item) => (
          <TouchableOpacity
            key={item.label}
            style={styles.menuItem}
            onPress={item.action}
            activeOpacity={0.7}>
            {item.icon}
            <Text style={styles.menuLabel}>{item.label}</Text>
          </TouchableOpacity>
        ))}
      </View>

      <TouchableOpacity
        style={styles.logoutButton}
        onPress={handleSignOut}
        activeOpacity={0.7}>
        <LogOut size={22} color="#dc2626" strokeWidth={2.5} />
        <Text style={styles.logoutLabel}>Déconnexion</Text>
      </TouchableOpacity>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#ffffff',
  },
  header: {
    paddingHorizontal: 16,
    paddingTop: 50,
    paddingBottom: 24,
  },
  userInfo: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 16,
  },
  avatar: {
    width: 56,
    height: 56,
    borderRadius: 28,
    backgroundColor: 'rgba(255,255,255,0.3)',
    justifyContent: 'center',
    alignItems: 'center',
  },
  avatarText: {
    fontSize: 24,
    fontWeight: '800',
    color: '#ffffff',
  },
  userDetails: {
    flex: 1,
  },
  userName: {
    fontSize: 16,
    fontWeight: '700',
    color: '#ffffff',
    marginBottom: 4,
  },
  userEmail: {
    fontSize: 13,
    color: '#ffffff',
    opacity: 0.85,
  },
  menuSection: {
    paddingVertical: 12,
  },
  sectionTitle: {
    fontSize: 12,
    fontWeight: '700',
    color: '#9ca3af',
    letterSpacing: 0.5,
    paddingHorizontal: 16,
    paddingVertical: 12,
  },
  menuItem: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 16,
    paddingHorizontal: 16,
    paddingVertical: 14,
  },
  menuLabel: {
    fontSize: 15,
    fontWeight: '600',
    color: '#111827',
  },
  logoutButton: {
    position: 'absolute',
    bottom: 32,
    left: 16,
    right: 16,
    flexDirection: 'row',
    alignItems: 'center',
    gap: 16,
    paddingHorizontal: 16,
    paddingVertical: 14,
    backgroundColor: '#fee2e2',
    borderRadius: 12,
    borderWidth: 2,
    borderColor: '#fecaca',
  },
  logoutLabel: {
    fontSize: 15,
    fontWeight: '700',
    color: '#dc2626',
  },
});
