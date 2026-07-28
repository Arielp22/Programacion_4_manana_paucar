import {
  Alert,
  Image,
  Pressable,
  StyleSheet,
  Text,
  View,
} from 'react-native';

export default function Paso2() {
  return (
    <View style={styles.contenedor}>
      <Image
        source={{ uri: 'https://cdn-icons-png.flaticon.com/512/616/616430.png' }}
        style={styles.logo}
      />

      <Text style={styles.titulo}>Veterinaria AP</Text>

      <Pressable
        style={({ pressed }) => [
          styles.boton,
          pressed && styles.botonPresionado,
        ]}
        onPress={() =>
          Alert.alert('Agendando cita', 'Cita registrada para el 30/07/2026')
        }
      >
        <Text style={styles.textoBoton}>Agendar cita</Text>
      </Pressable>
    </View>
  );
}

const styles = StyleSheet.create({
  contenedor: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    gap: 16,
  },
  logo: {
    width: 80,
    height: 80,
  },
  titulo: {
    fontSize: 20,
    fontWeight: '600',
  },
  boton: {
    backgroundColor: '#2e7d32',
    paddingVertical: 12,
    paddingHorizontal: 24,
    borderRadius: 8,
  },
  botonPresionado: {
    backgroundColor: '#1b5e20',
  },
  textoBoton: {
    color: '#fff',
    fontWeight: '600',
    fontSize: 16,
  },
});