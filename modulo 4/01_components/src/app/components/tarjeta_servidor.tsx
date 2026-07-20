// En React web usarías <div> y <span>.
// En React Native usas <View> y <Text> — el resultado es nativo real.

import { StyleSheet, View, Text} from "react-native"

interface TarjetaServidorProps {
  nombre: string
  ip: string
  sistema: string
  puerto: number
}

function TarjetaServidor({ nombre, ip, sistema, puerto }: TarjetaServidorProps) {
  return (
    <View style={styles.tarjeta}>
      <Text style={styles.nombreServidor}>{nombre}</Text>
      <Text style={styles.datoDireccion}>{ip}:{puerto}</Text>
      <Text style={styles.datoSistema}>{sistema}</Text>
    </View>
  )
}

function Paso1() {
  return (
    <View style={styles.fondo}>
      <Text style={styles.encabezado}>Inventario de servidores</Text>
      <TarjetaServidor
        nombre="web-01"
        ip="10.0.2.10"
        sistema="Ubuntu 24.04 LTS"
        puerto={22}
      />
      <TarjetaServidor
        nombre="db-primary"
        ip="10.0.2.20"
        sistema="Debian 12"
        puerto={5432}
      />
      <TarjetaServidor
        nombre="cache-01"
        ip="10.0.2.30"
        sistema="Alpine 3.19"
        puerto={6379}
      />
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
  nombreServidor: {
    fontSize: 16,
    fontWeight: '600',
    color: '#1a1a1a',
  },
  datoDireccion: {
    fontSize: 13,
    color: '#1565c0',
    fontFamily: 'monospace',
  },
  datoSistema: {
    fontSize: 12,
    color: '#757575',
  },
})