import{StyleSheet, Text, View} from"react-native"

interface TarjetaMascotaProps {
  nombre: string
  especie: string
  raza: string
  edad: number
  dueno?: string
}

export  default function TarjetaMascota({ nombre, especie, raza, edad, dueno }: TarjetaMascotaProps) {
  return (
    <View style={styles.tarjeta}>
      <Text style={styles.nombreMascota}>{nombre}</Text>
      <Text style={styles.datoEspecie}>{especie} · {raza}</Text>
      <Text style={styles.datoEdad}>{edad} años</Text>
      {dueno && <Text style={styles.datoDueno}>Dueño: {dueno}</Text>}
    </View>
  )
}

const styles = StyleSheet.create({
  fondo: {
    flex: 1,
    backgroundColor: '#f0f4f8',
    padding: 20,
    paddingTop: 60,
    gap: 12,
  },
  centrado: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  encabezado: {
    fontSize: 20,
    fontWeight: '700',
    color: '#1a237e',
    marginBottom: 4,
  },
  tarjeta: {
    backgroundColor: '#ffffff',
    borderRadius: 10,
    padding: 16,
    gap: 4,
    shadowColor: '#000',
    shadowOpacity: 0.06,
    shadowRadius: 4,
    shadowOffset: { width: 0, height: 2 },
    elevation: 2,
  },
  nombreMascota: {
    fontSize: 16,
    fontWeight: '600',
    color: '#1a1a1a',
  },
  datoEspecie: {
    fontSize: 13,
    color: '#1565c0',
    fontFamily: 'monospace',
  },
  datoEdad: {
    fontSize: 12,
    color: '#757575',
  },
  datoDueno: {
    fontSize: 12,
    color: '#2e7d32',
    fontStyle: 'italic',
    marginTop: 2,
  },
})