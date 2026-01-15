import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  TouchableOpacity,
  Switch,
} from 'react-native';
import { LinearGradient } from 'expo-linear-gradient';
import { ArrowLeft, Bell, Globe, Lock, Database } from 'lucide-react-native';
import { router } from 'expo-router';
import { useState } from 'react';

export default function SettingsScreen() {
  const [notifications, setNotifications] = useState(true);
  const [language, setLanguage] = useState('fr');
  const [dataCollection, setDataCollection] = useState(false);

  return (
    <ScrollView style={styles.container} showsVerticalScrollIndicator={false}>
      <LinearGradient
        colors={['#16a34a', '#15803d']}
        style={styles.header}>
        <TouchableOpacity
          style={styles.backButton}
          onPress={() => router.back()}
          activeOpacity={0.8}>
          <ArrowLeft size={24} color="#ffffff" strokeWidth={2.5} />
        </TouchableOpacity>
        <Text style={styles.headerTitle}>Paramètres</Text>
      </LinearGradient>

      <View style={styles.content}>
        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Notifications</Text>

          <View style={styles.settingRow}>
            <View style={styles.settingLeft}>
              <Bell size={22} color="#16a34a" strokeWidth={2} />
              <View style={styles.settingInfo}>
                <Text style={styles.settingLabel}>Notifications Push</Text>
                <Text style={styles.settingDescription}>
                  Recevez les alertes et mises à jour
                </Text>
              </View>
            </View>
            <Switch
              value={notifications}
              onValueChange={setNotifications}
              trackColor={{ false: '#e5e7eb', true: '#86efac' }}
              thumbColor={notifications ? '#16a34a' : '#9ca3af'}
            />
          </View>
        </View>

        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Langue et Région</Text>

          <View style={styles.settingRow}>
            <View style={styles.settingLeft}>
              <Globe size={22} color="#16a34a" strokeWidth={2} />
              <View style={styles.settingInfo}>
                <Text style={styles.settingLabel}>Langue</Text>
                <Text style={styles.settingDescription}>
                  Choisissez votre langue préférée
                </Text>
              </View>
            </View>
            <View style={styles.languageBadge}>
              <Text style={styles.languageText}>
                {language === 'fr' ? 'FR' : 'EN'}
              </Text>
            </View>
          </View>

          <View style={styles.languageOptions}>
            <TouchableOpacity
              style={[
                styles.languageOption,
                language === 'fr' && styles.activeLanguage,
              ]}
              onPress={() => setLanguage('fr')}
              activeOpacity={0.7}>
              <Text style={[styles.languageOptionText, language === 'fr' && styles.activeLanguageText]}>
                Français
              </Text>
            </TouchableOpacity>

            <TouchableOpacity
              style={[
                styles.languageOption,
                language === 'en' && styles.activeLanguage,
              ]}
              onPress={() => setLanguage('en')}
              activeOpacity={0.7}>
              <Text style={[styles.languageOptionText, language === 'en' && styles.activeLanguageText]}>
                English
              </Text>
            </TouchableOpacity>
          </View>
        </View>

        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Confidentialité</Text>

          <View style={styles.settingRow}>
            <View style={styles.settingLeft}>
              <Lock size={22} color="#16a34a" strokeWidth={2} />
              <View style={styles.settingInfo}>
                <Text style={styles.settingLabel}>Données Anonymisées</Text>
                <Text style={styles.settingDescription}>
                  Permettre la collecte de données anonymisées
                </Text>
              </View>
            </View>
            <Switch
              value={dataCollection}
              onValueChange={setDataCollection}
              trackColor={{ false: '#e5e7eb', true: '#86efac' }}
              thumbColor={dataCollection ? '#16a34a' : '#9ca3af'}
            />
          </View>

          <TouchableOpacity style={styles.infoBox} activeOpacity={0.7}>
            <Database size={18} color="#0ea5e9" strokeWidth={2} />
            <Text style={styles.infoText}>
              Vos données personnelles sont protégées par notre politique de confidentialité.
              Nous ne vendons jamais vos données à des tiers.
            </Text>
          </TouchableOpacity>
        </View>

        <View style={styles.section}>
          <Text style={styles.sectionTitle}>À propos</Text>

          <View style={styles.aboutRow}>
            <Text style={styles.aboutLabel}>Version</Text>
            <Text style={styles.aboutValue}>1.0.0</Text>
          </View>

          <View style={styles.aboutRow}>
            <Text style={styles.aboutLabel}>Développé par</Text>
            <Text style={styles.aboutValue}>Visit Team</Text>
          </View>
        </View>
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
    paddingHorizontal: 24,
    paddingTop: 60,
    paddingBottom: 40,
    flexDirection: 'row',
    alignItems: 'center',
    gap: 16,
  },
  backButton: {
    width: 40,
    height: 40,
    borderRadius: 8,
    backgroundColor: 'rgba(255,255,255,0.2)',
    justifyContent: 'center',
    alignItems: 'center',
  },
  headerTitle: {
    fontSize: 28,
    fontWeight: '800',
    color: '#ffffff',
    flex: 1,
  },
  content: {
    padding: 24,
  },
  section: {
    marginBottom: 32,
  },
  sectionTitle: {
    fontSize: 16,
    fontWeight: '700',
    color: '#111827',
    marginBottom: 16,
    textTransform: 'uppercase',
    letterSpacing: 0.5,
  },
  settingRow: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    backgroundColor: '#ffffff',
    borderRadius: 12,
    padding: 16,
    marginBottom: 12,
  },
  settingLeft: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 16,
    flex: 1,
  },
  settingInfo: {
    flex: 1,
  },
  settingLabel: {
    fontSize: 15,
    fontWeight: '700',
    color: '#111827',
    marginBottom: 4,
  },
  settingDescription: {
    fontSize: 13,
    color: '#6b7280',
  },
  languageBadge: {
    backgroundColor: '#dcfce7',
    borderRadius: 8,
    paddingHorizontal: 12,
    paddingVertical: 6,
  },
  languageText: {
    fontSize: 13,
    fontWeight: '700',
    color: '#16a34a',
  },
  languageOptions: {
    flexDirection: 'row',
    gap: 12,
    marginTop: 12,
  },
  languageOption: {
    flex: 1,
    backgroundColor: '#ffffff',
    borderRadius: 12,
    paddingVertical: 12,
    borderWidth: 2,
    borderColor: '#f3f4f6',
    alignItems: 'center',
  },
  activeLanguage: {
    backgroundColor: '#dcfce7',
    borderColor: '#16a34a',
  },
  languageOptionText: {
    fontSize: 14,
    fontWeight: '600',
    color: '#6b7280',
  },
  activeLanguageText: {
    color: '#16a34a',
  },
  infoBox: {
    flexDirection: 'row',
    alignItems: 'flex-start',
    gap: 12,
    backgroundColor: '#e0f2fe',
    borderRadius: 12,
    padding: 16,
    marginTop: 12,
  },
  infoText: {
    flex: 1,
    fontSize: 13,
    color: '#0c4a6e',
    lineHeight: 19,
    fontWeight: '500',
  },
  aboutRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    backgroundColor: '#ffffff',
    borderRadius: 12,
    paddingHorizontal: 16,
    paddingVertical: 14,
    marginBottom: 12,
  },
  aboutLabel: {
    fontSize: 15,
    fontWeight: '600',
    color: '#374151',
  },
  aboutValue: {
    fontSize: 15,
    fontWeight: '600',
    color: '#16a34a',
  },
});
