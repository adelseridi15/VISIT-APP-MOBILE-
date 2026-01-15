import { useEffect, useState } from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  TouchableOpacity,
  TextInput,
} from 'react-native';
import { LinearGradient } from 'expo-linear-gradient';
import { ArrowLeft, Mail, User, Calendar, Save } from 'lucide-react-native';
import { router } from 'expo-router';
import { useAuth } from '@/contexts/AuthContext';
import { supabase } from '@/lib/supabase';

export default function ProfileScreen() {
  const { user } = useAuth();
  const [fullName, setFullName] = useState('');
  const [email, setEmail] = useState('');
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [message, setMessage] = useState('');

  useEffect(() => {
    loadProfile();
  }, []);

  async function loadProfile() {
    try {
      if (user?.id) {
        const { data } = await supabase
          .from('user_profiles')
          .select('*')
          .eq('id', user.id)
          .maybeSingle();

        if (data) {
          setFullName(data.full_name || '');
          setEmail(data.email || '');
        }
      }
    } catch (error) {
      console.error('Error loading profile:', error);
    } finally {
      setLoading(false);
    }
  }

  async function handleSaveProfile() {
    if (!fullName.trim()) {
      setMessage('Le nom complet est requis');
      return;
    }

    setSaving(true);
    setMessage('');

    try {
      if (user?.id) {
        const { error } = await supabase
          .from('user_profiles')
          .update({ full_name: fullName })
          .eq('id', user.id);

        if (error) throw error;
        setMessage('Profil mis à jour avec succès');
      }
    } catch (error: any) {
      setMessage('Erreur lors de la mise à jour');
    } finally {
      setSaving(false);
    }
  }

  const joinDate = user?.created_at
    ? new Date(user.created_at).toLocaleDateString('fr-FR')
    : 'N/A';

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
        <Text style={styles.headerTitle}>Mon Profil</Text>
      </LinearGradient>

      <View style={styles.content}>
        <View style={styles.avatarContainer}>
          <View style={styles.avatarLarge}>
            <Text style={styles.avatarText}>
              {fullName?.[0]?.toUpperCase() || email?.[0]?.toUpperCase() || 'U'}
            </Text>
          </View>
        </View>

        {message && (
          <View style={[styles.messageContainer, message.includes('succès') ? styles.successMessage : styles.errorMessage]}>
            <Text style={styles.messageText}>{message}</Text>
          </View>
        )}

        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Informations Personnelles</Text>

          <View style={styles.inputGroup}>
            <Text style={styles.inputLabel}>Nom Complet</Text>
            <View style={styles.inputContainer}>
              <User size={18} color="#6b7280" strokeWidth={2} />
              <TextInput
                style={styles.input}
                placeholder="Votre nom complet"
                value={fullName}
                onChangeText={setFullName}
                editable={!saving}
              />
            </View>
          </View>

          <View style={styles.inputGroup}>
            <Text style={styles.inputLabel}>Email</Text>
            <View style={[styles.inputContainer, styles.disabledInput]}>
              <Mail size={18} color="#6b7280" strokeWidth={2} />
              <TextInput
                style={styles.input}
                placeholder="Email"
                value={email}
                editable={false}
              />
            </View>
          </View>

          <TouchableOpacity
            style={[styles.saveButton, saving && styles.disabledButton]}
            onPress={handleSaveProfile}
            disabled={saving}
            activeOpacity={0.8}>
            <Save size={20} color="#ffffff" strokeWidth={2.5} />
            <Text style={styles.saveButtonText}>
              {saving ? 'Enregistrement...' : 'Enregistrer les modifications'}
            </Text>
          </TouchableOpacity>
        </View>

        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Informations du Compte</Text>

          <View style={styles.infoRow}>
            <View style={styles.infoLeft}>
              <Calendar size={20} color="#16a34a" strokeWidth={2} />
              <Text style={styles.infoLabel}>Date d'inscription</Text>
            </View>
            <Text style={styles.infoValue}>{joinDate}</Text>
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
  avatarContainer: {
    alignItems: 'center',
    marginBottom: 32,
  },
  avatarLarge: {
    width: 100,
    height: 100,
    borderRadius: 50,
    backgroundColor: '#16a34a',
    justifyContent: 'center',
    alignItems: 'center',
    shadowColor: '#16a34a',
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.3,
    shadowRadius: 8,
    elevation: 5,
  },
  avatarText: {
    fontSize: 40,
    fontWeight: '800',
    color: '#ffffff',
  },
  messageContainer: {
    borderRadius: 12,
    padding: 16,
    marginBottom: 24,
    borderLeftWidth: 4,
  },
  successMessage: {
    backgroundColor: '#dcfce7',
    borderLeftColor: '#16a34a',
  },
  errorMessage: {
    backgroundColor: '#fee2e2',
    borderLeftColor: '#dc2626',
  },
  messageText: {
    fontSize: 14,
    fontWeight: '600',
    color: '#111827',
  },
  section: {
    marginBottom: 32,
  },
  sectionTitle: {
    fontSize: 18,
    fontWeight: '700',
    color: '#111827',
    marginBottom: 20,
  },
  inputGroup: {
    marginBottom: 20,
  },
  inputLabel: {
    fontSize: 14,
    fontWeight: '600',
    color: '#374151',
    marginBottom: 8,
  },
  inputContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 12,
    backgroundColor: '#ffffff',
    borderRadius: 12,
    paddingHorizontal: 16,
    paddingVertical: 12,
    borderWidth: 2,
    borderColor: '#f3f4f6',
  },
  disabledInput: {
    backgroundColor: '#f9fafb',
    opacity: 0.6,
  },
  input: {
    flex: 1,
    fontSize: 15,
    color: '#111827',
    fontWeight: '500',
  },
  saveButton: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 10,
    backgroundColor: '#16a34a',
    borderRadius: 12,
    paddingVertical: 14,
    marginTop: 24,
  },
  disabledButton: {
    opacity: 0.6,
  },
  saveButtonText: {
    color: '#ffffff',
    fontSize: 15,
    fontWeight: '700',
  },
  infoRow: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    backgroundColor: '#ffffff',
    borderRadius: 12,
    padding: 16,
    marginBottom: 12,
  },
  infoLeft: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 12,
  },
  infoLabel: {
    fontSize: 15,
    fontWeight: '600',
    color: '#374151',
  },
  infoValue: {
    fontSize: 15,
    fontWeight: '600',
    color: '#16a34a',
  },
});
