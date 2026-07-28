// app/paso3.tsx
import { Image, StyleSheet, Text, View } from 'react-native'

export default function Paso3() {
  return (
    <View style={styles.contenedor}>
      <Image
        source={{ uri: 'https://cdn-icons-png.flaticon.com/512/2206/2206378.png' }}
        style={styles.logo}
      />
      <Text style={styles.titulo}>Mascota saludable</Text>
    </View>
  )
}

const styles = StyleSheet.create({
  contenedor: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    gap: 16,
  },
  logo: {
    width: 150,
    height: 150,
    borderRadius: 75, 
  },
  titulo: {
    fontSize: 20,
    fontWeight: '600',
    color: '#2e7d32',
  },
  boton: {
    backgroundColor: '#1565c0',
    paddingVertical: 12,
    paddingHorizontal: 24,
    borderRadius: 8,
  },
  botonPresionado: {
    backgroundColor: '#0d47a1',
  },
  textoBoton: {
    color: '#fff',
    fontWeight: '600',
    fontSize: 16,
  },
})