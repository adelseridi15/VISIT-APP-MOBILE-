import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  TouchableOpacity,
  Linking,
} from 'react-native';
import { LinearGradient } from 'expo-linear-gradient';
import {
  ArrowLeft,
  Compass,
  Heart,
  Users,
  Globe,
  Mail,
} from 'lucide-react-native';
import { router } from 'expo-router';

export default function AboutScreen() {
  const handleEmail = () => {
    Linking.openURL('mailto:contact@visitalger.com');
  };

  const handleWebsite = () => {
    Linking.openURL('https://visitalger.com');
  };

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
        <Text style={styles.headerTitle}>À propos</Text>
      </LinearGradient>

      <View style={styles.content}>
        <View style={styles.logoContainer}>
          <View style={styles.logoBadge}>
            <Compass size={48} color="#ffffff" strokeWidth={2} />
          </View>
          <Text style={styles.appName}>Visit</Text>
          <Text style={styles.version}>v1.0.0</Text>
        </View>

        <View style={styles.section}>
          <Text style={styles.sectionTitle}>À propos de Visit</Text>
          <Text style={styles.description}>
            Visit est une application mobile moderne dédiée à la découverte de
            l'Algérie. Elle vous guide à travers les régions algériennes les
            plus fascinantes, leurs sites patrimoniaux exceptionnels et leurs
            délices culinaires.
          </Text>
        </View>

        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Notre Mission</Text>
          <View style={styles.missionItems}>
            <View style={styles.missionItem}>
              <Heart size={20} color="#16a34a" strokeWidth={2.5} />
              <Text style={styles.missionText}>
                Promouvoir le riche patrimoine culturel algérien
              </Text>
            </View>
            <View style={styles.missionItem}>
              <Users size={20} color="#16a34a" strokeWidth={2.5} />
              <Text style={styles.missionText}>
                Connecter les voyageurs avec la culture locale
              </Text>
            </View>
            <View style={styles.missionItem}>
              <Globe size={20} color="#16a34a" strokeWidth={2.5} />
              <Text style={styles.missionText}>
                Célébrer la diversité et la beauté de l'Algérie
              </Text>
            </View>
          </View>
        </View>

        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Caractéristiques</Text>
          <View style={styles.featuresList}>
            <View style={styles.featureItem}>
              <View style={styles.featureDot} />
              <Text style={styles.featureText}>
                Découvrez 6 régions algériennes principales
              </Text>
            </View>
            <View style={styles.featureItem}>
              <View style={styles.featureDot} />
              <Text style={styles.featureText}>
                Explorez des sites patrimoniaux et sites historiques
              </Text>
            </View>
            <View style={styles.featureItem}>
              <View style={styles.featureDot} />
              <Text style={styles.featureText}>
                Découvrez la gastronomie traditionnelle algérienne
              </Text>
            </View>
            <View style={styles.featureItem}>
              <View style={styles.featureDot} />
              <Text style={styles.featureText}>
                Gérez vos découvertes préférées avec la section Favoris
              </Text>
            </View>
            <View style={styles.featureItem}>
              <View style={styles.featureDot} />
              <Text style={styles.featureText}>
                Interface bilingue Français/Arabe
              </Text>
            </View>
          </View>
        </View>

        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Contact</Text>

          <TouchableOpacity
            style={styles.contactButton}
            onPress={handleEmail}
            activeOpacity={0.7}>
            <Mail size={20} color="#16a34a" strokeWidth={2} />
            <Text style={styles.contactButtonText}>
              contact@visitalger.com
            </Text>
          </TouchableOpacity>

          <TouchableOpacity
            style={styles.contactButton}
            onPress={handleWebsite}
            activeOpacity={0.7}>
            <Globe size={20} color="#16a34a" strokeWidth={2} />
            <Text style={styles.contactButtonText}>
              visitalger.com
            </Text>
          </TouchableOpacity>
        </View>

        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Politique et Légal</Text>

          <TouchableOpacity style={styles.legalLink} activeOpacity={0.7}>
            <Text style={styles.legalLinkText}>
              Politique de Confidentialité
            </Text>
          </TouchableOpacity>

          <TouchableOpacity style={styles.legalLink} activeOpacity={0.7}>
            <Text style={styles.legalLinkText}>
              Conditions d'Utilisation
            </Text>
          </TouchableOpacity>

          <TouchableOpacity style={styles.legalLink} activeOpacity={0.7}>
            <Text style={styles.legalLinkText}>
              Licences Ouvertes
            </Text>
          </TouchableOpacity>
        </View>

        <View style={styles.footerSection}>
          <Text style={styles.footerText}>
            Fait avec passion pour la découverte de l'Algérie
          </Text>
          <Text style={styles.footerSubtext}>
            © 2024 Visit. Tous les droits réservés.
          </Text>
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
  logoContainer: {
    alignItems: 'center',
    marginBottom: 40,
  },
  logoBadge: {
    width: 80,
    height: 80,
    borderRadius: 40,
    backgroundColor: '#16a34a',
    justifyContent: 'center',
    alignItems: 'center',
    marginBottom: 16,
    shadowColor: '#16a34a',
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.3,
    shadowRadius: 8,
    elevation: 5,
  },
  appName: {
    fontSize: 36,
    fontWeight: '800',
    color: '#111827',
  },
  version: {
    fontSize: 14,
    color: '#6b7280',
    fontWeight: '600',
    marginTop: 4,
  },
  section: {
    marginBottom: 32,
  },
  sectionTitle: {
    fontSize: 18,
    fontWeight: '700',
    color: '#111827',
    marginBottom: 16,
  },
  description: {
    fontSize: 15,
    color: '#4b5563',
    lineHeight: 24,
  },
  missionItems: {
    gap: 12,
  },
  missionItem: {
    flexDirection: 'row',
    alignItems: 'flex-start',
    gap: 12,
    backgroundColor: '#ffffff',
    borderRadius: 12,
    padding: 16,
  },
  missionText: {
    flex: 1,
    fontSize: 15,
    color: '#374151',
    lineHeight: 22,
    fontWeight: '500',
  },
  featuresList: {
    gap: 12,
  },
  featureItem: {
    flexDirection: 'row',
    alignItems: 'flex-start',
    gap: 12,
  },
  featureDot: {
    width: 8,
    height: 8,
    borderRadius: 4,
    backgroundColor: '#16a34a',
    marginTop: 6,
  },
  featureText: {
    flex: 1,
    fontSize: 15,
    color: '#374151',
    lineHeight: 22,
    fontWeight: '500',
  },
  contactButton: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 12,
    backgroundColor: '#ffffff',
    borderRadius: 12,
    paddingHorizontal: 16,
    paddingVertical: 14,
    marginBottom: 12,
    borderWidth: 2,
    borderColor: '#dcfce7',
  },
  contactButtonText: {
    fontSize: 15,
    fontWeight: '600',
    color: '#16a34a',
  },
  legalLink: {
    backgroundColor: '#ffffff',
    borderRadius: 12,
    paddingHorizontal: 16,
    paddingVertical: 14,
    marginBottom: 12,
  },
  legalLinkText: {
    fontSize: 15,
    fontWeight: '600',
    color: '#374151',
  },
  footerSection: {
    alignItems: 'center',
    paddingVertical: 40,
    borderTopWidth: 1,
    borderTopColor: '#e5e7eb',
  },
  footerText: {
    fontSize: 15,
    fontWeight: '600',
    color: '#16a34a',
    textAlign: 'center',
    marginBottom: 8,
  },
  footerSubtext: {
    fontSize: 13,
    color: '#6b7280',
    textAlign: 'center',
  },
});
