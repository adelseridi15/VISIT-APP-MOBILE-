import { Drawer } from 'expo-router/drawer';
import { DrawerContent } from '@/components/DrawerContent';
import { GestureHandlerRootView } from 'react-native-gesture-handler';

export default function DrawerLayout() {
  return (
    <GestureHandlerRootView style={{ flex: 1 }}>
      <Drawer
        screenOptions={{
          headerShown: false,
          drawerType: 'slide',
          drawerPosition: 'left',
          swipeEnabled: true,
        }}
        drawerContent={(props) => <DrawerContent {...props} />}>
        <Drawer.Screen
          name="(tabs)"
          options={{
            headerShown: false,
          }}
        />
      </Drawer>
    </GestureHandlerRootView>
  );
}
