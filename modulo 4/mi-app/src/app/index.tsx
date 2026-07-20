// app/index.tsx
import { StyleSheet, Text, View } from 'react-native'
import {Paso2} from './paso2'
// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1  Texto y vistas básicas                               │
// │  2  Paso 2  Imágenes y botones                                   │
// └──────────────────────────────────────────────────────────────────┘
const PASO = 2

export default function Index() {
  switch (PASO) {
    case 1:
      return <Paso1 />
    case 2:
      return <Paso2 />
    default:
      return (
        <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
          <Text>Paso {PASO}: crea la pantalla primero</Text>
        </View>
      )
  }
}

// ─── Paso 1 — lo creamos abajo ──────────────────────────────────────
function Paso1() {
  return (
    <>
      <View style={styles.contenedor}>
        <Text style={styles.titulo}>Sistema de Monitoreo</Text>
        <Text style={styles.subtitulo}>Servidor web-01</Text>
        <Text style={styles.detalle}>10.0.2.10 · Ubuntu 24.04</Text>
      </View>

      <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center',}}>
        <Text>Programacion 4</Text>
        <Text>Version 1.0</Text>
        <Text>Autor: Ariel Paucar</Text>
      </View>

    </>


  )
}

const styles = StyleSheet.create({
  contenedor: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#ffffff',
    gap: 8,
  },
  titulo: {
    fontSize: 22,
    fontWeight: 'bold',
    color: '#811414',
  },
  subtitulo: {
    fontSize: 16,
    color: '#3657e9',
  },
  detalle: {
    fontSize: 13,
    color: '#34a347',
  },
})
