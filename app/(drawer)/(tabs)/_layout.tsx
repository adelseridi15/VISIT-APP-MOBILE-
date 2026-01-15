import { Tabs } from 'expo-router';
import { Home, Compass, Heart, Menu } from 'lucide-react-native';
import { TouchableOpacity } from 'react-native';
import { useNavigation } from '@react-navigation/native';

export default function TabLayout() {
  const navigation: any = useNavigation();

  return (
    <Tabs
      screenOptions={{
        headerShown: true,
        headerStyle: {
          backgroundColor: '#16a34a',
        },
        headerTintColor: '#ffffff',
        headerTitleStyle: {
          fontWeight: '700',
          fontSize: 18,
        },
        headerLeft: () => (
          <TouchableOpacity
            onPress={() => navigation.toggleDrawer?.()}
            style={{ paddingLeft: 16 }}>
            <Menu size={24} color="#ffffff" strokeWidth={2.5} />
          </TouchableOpacity>
        ),
        tabBarActiveTintColor: '#16a34a',
        tabBarInactiveTintColor: '#9ca3af',
        tabBarStyle: {
          backgroundColor: '#ffffff',
          borderTopWidth: 1,
          borderTopColor: '#f3f4f6',
          height: 60,
          paddingBottom: 8,
          paddingTop: 8,
        },
        tabBarLabelStyle: {
          fontSize: 12,
          fontWeight: '600',
        },
      }}>
      <Tabs.Screen
        name="index"
        options={{
          title: 'Accueil',
          headerTitle: 'Accueil',
          tabBarIcon: ({ size, color }) => (
            <Home size={size} color={color} strokeWidth={2.5} />
          ),
        }}
      />
      <Tabs.Screen
        name="explore"
        options={{
          title: 'Explorer',
          headerTitle: 'Explorer',
          tabBarIcon: ({ size, color }) => (
            <Compass size={size} color={color} strokeWidth={2.5} />
          ),
        }}
      />
      <Tabs.Screen
        name="favorites"
        options={{
          title: 'Favoris',
          headerTitle: 'Mes Favoris',
          tabBarIcon: ({ size, color }) => (
            <Heart size={size} color={color} strokeWidth={2.5} />
          ),
        }}
      />
    </Tabs>
  );
}
