// app/index.tsx
import React, { ReactNode, useState } from 'react'
import { Modal, Pressable, SafeAreaView, ScrollView, StyleSheet, Text, View } from 'react-native'

const PASO = 6

export default function Index() {
  switch (PASO) {
    case 1:
      return <Paso1 />
    case 2:
      return <Paso2 />
    case 3: return <Paso3 />
    case 4: return <Paso4 />
    case 5: return <Paso5 />
    case 6: return <Paso6 />
    default:
      return (
        <View style={styles.centrado}>
          <Text>Paso {PASO}: crea el componente primero</Text>
        </View>
      )
  }
}

// ─── Paso 1 — Props tipadas ──────────────────────────────────────────

interface TarjetaMascotaProps {
  nombre: string
  especie: string
  raza: string
  edad: number
  dueno?: string
}

function TarjetaMascota({ nombre, especie, raza, edad, dueno }: TarjetaMascotaProps) {
  return (
    <View style={styles.tarjeta}>
      <Text style={styles.nombreMascota}>{nombre}</Text>
      <Text style={styles.datoEspecie}>{especie} · {raza}</Text>
      <Text style={styles.datoEdad}>{edad} años</Text>
      {dueno && <Text style={styles.datoDueno}>Dueño: {dueno}</Text>}
    </View>
  )
}

function Paso1() {
  return (
    <View style={styles.fondo}>
      <Text style={styles.encabezado}>Pacientes de la veterinaria</Text>
      <TarjetaMascota
        nombre="Luna"
        especie="Perro"
        raza="Golden Retriever"
        edad={3}
        dueno="María García"
      />
      <TarjetaMascota
        nombre="Misi"
        especie="Gato"
        raza="Siamés"
        edad={5}
        dueno="Carlos López"
      />
      <TarjetaMascota
        nombre="Piolín"
        especie="Ave"
        raza="Canario"
        edad={1}
        dueno="Ana Martínez"
      />
    </View>
  )
}

// ─── Paso 2 — children y composición ────────────────────────────────

interface CardProps {
  titulo: string
  subtitulo?: string
  children: ReactNode
}

function Card({ titulo, subtitulo, children }: CardProps) {
  return (
    <View style={estilos2.card}>
      <View style={estilos2.cardCabecera}>
        <Text style={estilos2.cardTitulo}>{titulo}</Text>
        {subtitulo && (
          <Text style={estilos2.cardSubtitulo}>{subtitulo}</Text>
        )}
      </View>
      <View style={estilos2.cardCuerpo}>{children}</View>
    </View>
  )
}

function FilaInfo({ etiqueta, valor }: { etiqueta: string; valor: string }) {
  return (
    <View style={estilos2.fila}>
      <Text style={estilos2.etiqueta}>{etiqueta}</Text>
      <Text style={estilos2.valor}>{valor}</Text>
    </View>
  )
}

function Paso2() {
  return (
    <View style={estilos2.fondo}>
      <Text style={estilos2.titulo}>Ficha médica</Text>

      <Card titulo="Luna" subtitulo="Golden Retriever · 3 años">
        <FilaInfo etiqueta="Dueño" valor="María García" />
        <FilaInfo etiqueta="Peso" valor="28.5 kg" />
        <FilaInfo etiqueta="Temperatura" valor="38.2 °C" />
        <FilaInfo etiqueta="Vacunas" valor="Completas" />
        <FilaInfo etiqueta="Última visita" valor="15/07/2026" />
      </Card>

      <Card titulo="Misi" subtitulo="Gato Siamés · 5 años">
        <FilaInfo etiqueta="Dueño" valor="Carlos López" />
        <FilaInfo etiqueta="Peso" valor="4.2 kg" />
        <FilaInfo etiqueta="Temperatura" valor="38.5 °C" />
        <FilaInfo etiqueta="Vacunas" valor="Pendiente antirrábica" />
        <FilaInfo etiqueta="Última visita" valor="10/06/2026" />
      </Card>
    </View>
  )
}



type EstadoSalud = 'saludable' | 'observacion' | 'critico' | 'alta'

interface BadgeSaludProps {
  estado: EstadoSalud
  tamaño?: number          // opcional — valor por defecto: 12
  mostrarIcono?: boolean   // opcional — valor por defecto: false
}

const COLOR_SALUD: Record<EstadoSalud, { fondo: string; texto: string }> = {
  saludable:   { fondo: '#e8f5e9', texto: '#2e7d32' },
  observacion: { fondo: '#fff8e1', texto: '#f57f17' },
  critico:     { fondo: '#fce4ec', texto: '#c62828' },
  alta:        { fondo: '#f5f5f5', texto: '#616161' },
}

const ICONO_SALUD: Record<EstadoSalud, string> = {
  saludable:   '✓',
  observacion: '◐',
  critico:     '✕',
  alta:        '○',
}

function BadgeSalud({
  estado,
  tamaño = 12,
  mostrarIcono = false,
}: BadgeSaludProps) {
  const colores = COLOR_SALUD[estado]
  return (
    <View style={[estilos3.badge, { backgroundColor: colores.fondo }]}>
      {mostrarIcono && (
        <Text style={[estilos3.icono, { color: colores.texto, fontSize: tamaño }]}>
          {ICONO_SALUD[estado]}{' '}
        </Text>
      )}
      <Text style={[estilos3.textoBadge, { color: colores.texto, fontSize: tamaño }]}>
        {estado.toUpperCase()}
      </Text>
    </View>
  )
}

interface FilaMascotaProps {
  nombre: string
  especie: string
  estado: EstadoSalud
  peso?: number        // kg — opcional
}

function FilaMascota({ nombre, especie, estado, peso }: FilaMascotaProps) {
  return (
    <View style={estilos3.fila}>
      <View style={estilos3.infoIzq}>
        <Text style={estilos3.nombreMascota}>{nombre}</Text>
        <Text style={estilos3.especieTexto}>{especie}</Text>
      </View>
      <View style={estilos3.infoDer}>
        {peso !== undefined && (
          <Text style={estilos3.peso}>{peso} kg</Text>
        )}
        <BadgeSalud estado={estado} mostrarIcono tamaño={11} />
      </View>
    </View>
  )
}
function Paso3() {
  return (
    <View style={estilos3.fondo}>
      <Text style={estilos3.titulo}>Estado de salud</Text>
      <FilaMascota nombre="Luna"     especie="Perro"   estado="saludable"   peso={28.5} />
      <FilaMascota nombre="Misi"     especie="Gato"    estado="saludable"   peso={4.2}  />
      <FilaMascota nombre="Rocky"    especie="Perro"   estado="observacion" peso={15.0} />
      <FilaMascota nombre="Pelusa"   especie="Gato"    estado="critico"                   />
      <FilaMascota nombre="Piolín"   especie="Ave"     estado="alta"                      />
    </View>
  )
}

const MASCOTAS_DEMO = [
  { id: '1',  nombre: 'Luna',     especie: 'Perro',   raza: 'Golden Retriever', edad: 3,  peso: 28.5, temp: 38.2, vacunas: 90 },
  { id: '2',  nombre: 'Misi',     especie: 'Gato',    raza: 'Siamés',          edad: 5,  peso: 4.2,  temp: 38.5, vacunas: 60 },
  { id: '3',  nombre: 'Rocky',    especie: 'Perro',   raza: 'Pastor Alemán',  edad: 2,  peso: 15.0, temp: 39.1, vacunas: 75 },
  { id: '4',  nombre: 'Pelusa',   especie: 'Gato',    raza: 'Persa',          edad: 8,  peso: 5.1,  temp: 38.0, vacunas: 40 },
  { id: '5',  nombre: 'Piolín',   especie: 'Ave',     raza: 'Canario',        edad: 1,  peso: 0.03, temp: 40.5, vacunas: 85 },
  { id: '6',  nombre: 'Max',      especie: 'Perro',   raza: 'Labrador',       edad: 4,  peso: 32.0, temp: 38.3, vacunas: 95 },
  { id: '7',  nombre: 'Nala',     especie: 'Perro',   raza: 'Beagle',         edad: 6,  peso: 12.0, temp: 38.1, vacunas: 30 },
  { id: '8',  nombre: 'Simba',    especie: 'Gato',    raza: 'Naranja',        edad: 3,  peso: 4.8,  temp: 38.4, vacunas: 70 },
  { id: '9',  nombre: 'Coco',     especie: 'Perro',   raza: 'Poodle',         edad: 7,  peso: 7.5,  temp: 38.6, vacunas: 50 },
  { id: '10', nombre: 'Kiwi',     especie: 'Ave',     raza: 'Perico',         edad: 2,  peso: 0.12, temp: 40.2, vacunas: 80 },
  { id: '11', nombre: 'Toby',     especie: 'Perro',   raza: 'Bulldog',        edad: 4,  peso: 24.0, temp: 38.0, vacunas: 65 },
  { id: '12', nombre: 'Mia',      especie: 'Gato',    raza: 'Atigrado',       edad: 1,  peso: 3.5,  temp: 38.7, vacunas: 100 },
]

interface BarraSaludProps {
  porcentaje: number
  etiqueta: string
}

function BarraSalud({ porcentaje, etiqueta }: BarraSaludProps) {
  const color = porcentaje > 85 ? '#c62828'
              : porcentaje > 60 ? '#f57f17'
              : '#2e7d32'
  return (
    <View style={estilos4.barraFila}>
      <Text style={estilos4.barraEtiqueta}>{etiqueta}</Text>
      <View style={estilos4.barraFondo}>
        <View style={[estilos4.barraRelleno, { width: `${porcentaje}%` as any, backgroundColor: color }]} />
      </View>
      <Text style={[estilos4.barraPct, { color }]}>{porcentaje}%</Text>
    </View>
  )
}

function TarjetaMascotaCompleta({ nombre, especie, raza, edad, peso, temp, vacunas }: typeof MASCOTAS_DEMO[0]) {
  return (
    <View style={estilos4.nodo}>
      <View style={estilos4.nodoEncabezado}>
        <Text style={estilos4.nodoNombre}>{nombre}</Text>
        <Text style={estilos4.nodoEspecie}>{especie}</Text>
      </View>
      <Text style={estilos4.nodoRaza}>{raza} · {edad} años</Text>
      <BarraSalud porcentaje={Math.round((vacunas / 100) * 100)} etiqueta="Vacunas" />
      <BarraSalud porcentaje={Math.round((100 - (temp > 39 ? (temp - 39) * 20 : 0)))} etiqueta="Salud" />
    </View>
  )
}

function Paso4() {
  return (
    <SafeAreaView style={estilos4.safeArea}>
      <View style={estilos4.header}>
        <Text style={estilos4.headerTitulo}>Pacientes internados</Text>
        <Text style={estilos4.headerSub}>{MASCOTAS_DEMO.length} mascotas registradas</Text>
      </View>
      <ScrollView
        style={estilos4.scroll}
        contentContainerStyle={estilos4.scrollContenido}
        showsVerticalScrollIndicator={false}
      >
        {MASCOTAS_DEMO.map((mascota) => (
          <TarjetaMascotaCompleta key={mascota.id} {...mascota} />
        ))}
      </ScrollView>
    </SafeAreaView>
  )
}

interface ModalConfirmProps {
  visible: boolean
  titulo: string
  mensaje: string
  etiquetaConfirmar?: string
  etiquetaCancelar?: string
  onConfirmar: () => void
  onCancelar: () => void
}

function ModalConfirm({
  visible,
  titulo,
  mensaje,
  etiquetaConfirmar = 'Confirmar',
  etiquetaCancelar = 'Cancelar',
  onConfirmar,
  onCancelar,
}: ModalConfirmProps) {
  return (
    <Modal
      visible={visible}
      transparent
      animationType="fade"
      onRequestClose={onCancelar}
    >
      <Pressable style={estilos5.fondo} onPress={onCancelar}>
        <Pressable style={estilos5.dialogo} onPress={() => {}}>
          <Text style={estilos5.dialogoTitulo}>{titulo}</Text>
          <Text style={estilos5.dialogoMensaje}>{mensaje}</Text>
          <View style={estilos5.botones}>
            <Pressable
              style={[estilos5.boton, estilos5.botonCancelar]}
              onPress={onCancelar}
            >
              <Text style={estilos5.textoCancelar}>{etiquetaCancelar}</Text>
            </Pressable>
            <Pressable
              style={[estilos5.boton, estilos5.botonConfirmar]}
              onPress={onConfirmar}
            >
              <Text style={estilos5.textoConfirmar}>{etiquetaConfirmar}</Text>
            </Pressable>
          </View>
        </Pressable>
      </Pressable>
    </Modal>
  )
}

function Paso5() {
  const [modalVisible, setModalVisible] = useState(false)
  const [accionEjecutada, setAccionEjecutada] = useState<string | null>(null)

  return (
    <SafeAreaView style={estilos5.safeArea}>
      <Text style={estilos5.titulo}>Atención médica</Text>
      <Text style={estilos5.subtitulo}>Luna · Golden Retriever</Text>

      <View style={estilos5.acciones}>
        <Pressable
          style={estilos5.botonAccion}
          onPress={() => {
            setAccionEjecutada(null)
            setModalVisible(true)
          }}
        >
          <Text style={estilos5.textoAccion}>Aplicar vacuna</Text>
        </Pressable>
      </View>

      {accionEjecutada && (
        <View style={estilos5.resultado}>
          <Text style={estilos5.textoResultado}>{accionEjecutada}</Text>
        </View>
      )}

      <ModalConfirm
        visible={modalVisible}
        titulo="Aplicar vacuna"
        mensaje={`¿Confirmas la aplicación de la vacuna antirrábica para Luna?\nRevisa el historial médico antes de proceder.`}
        etiquetaConfirmar="Vacunar"
        onConfirmar={() => {
          setModalVisible(false)
          setAccionEjecutada('Vacuna aplicada a Luna a las ' + new Date().toLocaleTimeString())
        }}
        onCancelar={() => setModalVisible(false)}
      />
    </SafeAreaView>
  )
}

interface AccionProps {
  etiqueta: string
  color: string
  onPress: () => void
}

function BotonAccion({ etiqueta, color, onPress }: AccionProps) {
  return (
    <Pressable
      style={({ pressed }) => [
        estilos6.botonAccion,
        { backgroundColor: color },
        pressed && { opacity: 0.75 },
      ]}
      onPress={onPress}
    >
      <Text style={estilos6.textoBotonAccion}>{etiqueta}</Text>
    </Pressable>
  )
}

function Paso6() {
  const [modalVisible, setModalVisible] = useState(false)
  const [accionPendiente, setAccionPendiente] = useState<string>('')
  const [log, setLog] = useState<string[]>([])

  function pedirConfirmacion(accion: string) {
    setAccionPendiente(accion)
    setModalVisible(true)
  }

  function ejecutarAccion() {
    const entrada = `[${new Date().toLocaleTimeString()}] ${accionPendiente} realizado en Luna`
    setLog((prev) => [entrada, ...prev])
    setModalVisible(false)
  }

  return (
    <SafeAreaView style={estilos6.safeArea}>
      {/* Cabecera fija — fuera del scroll */}
      <View style={estilos6.cabecera}>
        <View>
          <Text style={estilos6.cabNombre}>Luna</Text>
          <Text style={estilos6.cabEspecie}>Golden Retriever · 3 años</Text>
        </View>
        <BadgeSalud estado="saludable" mostrarIcono tamaño={12} />
      </View>

      {/* Contenido desplazable */}
      <ScrollView
        contentContainerStyle={estilos6.scrollContenido}
        showsVerticalScrollIndicator={false}
      >
        {/* Card de signos vitales */}
        <Card titulo="Signos vitales" subtitulo="Última actualización: hoy 15:30">
          <FilaInfo etiqueta="Peso" valor="28.5 kg" />
          <FilaInfo etiqueta="Temperatura" valor="38.2 °C" />
          <FilaInfo etiqueta="Frec. cardíaca" valor="82 lpm" />
          <FilaInfo etiqueta="Frec. respiratoria" valor="24 rpm" />
          <FilaInfo etiqueta="Última desparasitación" valor="15/04/2026" />
        </Card>

        {/* Card de información del paciente */}
        <Card titulo="Información del paciente">
          <FilaInfo etiqueta="Especie" valor="Perro" />
          <FilaInfo etiqueta="Raza" valor="Golden Retriever" />
          <FilaInfo etiqueta="Edad" valor="3 años" />
          <FilaInfo etiqueta="Sexo" valor="Hembra" />
          <FilaInfo etiqueta="Dueño" valor="María García" />
          <FilaInfo etiqueta="Teléfono" valor="+593 99 123 4567" />
        </Card>

        {/* Card de acciones médicas */}
        <Card titulo="Acciones médicas">
          <View style={estilos6.gridAcciones}>
            <BotonAccion
              etiqueta="Vacunar"
              color="#1565c0"
              onPress={() => pedirConfirmacion('Vacunación')}
            />
            <BotonAccion
              etiqueta="Desparasitar"
              color="#b71c1c"
              onPress={() => pedirConfirmacion('Desparasitación')}
            />
            <BotonAccion
              etiqueta="Cirugía"
              color="#2e7d32"
              onPress={() => pedirConfirmacion('Agendar cirugía')}
            />
            <BotonAccion
              etiqueta="Receta"
              color="#6a1b9a"
              onPress={() => pedirConfirmacion('Generar receta')}
            />
          </View>
        </Card>

        {/* Card de actividad reciente */}
        {log.length > 0 && (
          <Card titulo="Actividad reciente">
            {log.map((entrada, i) => (
              <Text key={i} style={estilos6.entradaLog}>{entrada}</Text>
            ))}
          </Card>
        )}
      </ScrollView>

      {/* Modal reutilizado del Paso 5 */}
      <ModalConfirm
        visible={modalVisible}
        titulo={`Confirmar: ${accionPendiente}`}
        mensaje={`¿Ejecutar "${accionPendiente}" para Luna?\nEsta acción quedará registrada en su historial médico.`}
        etiquetaConfirmar="Ejecutar"
        onConfirmar={ejecutarAccion}
        onCancelar={() => setModalVisible(false)}
      />
    </SafeAreaView>
  )
}

// ─── Estilos ─────────────────────────────────────────────────────────

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

const estilos2 = StyleSheet.create({
  fondo: {
    flex: 1,
    backgroundColor: '#f0f4f8',
    padding: 20,
    paddingTop: 60,
    gap: 16,
  },
  titulo: {
    fontSize: 20,
    fontWeight: '700',
    color: '#1a237e',
  },
  card: {
    backgroundColor: '#ffffff',
    borderRadius: 12,
    overflow: 'hidden',
    shadowColor: '#000',
    shadowOpacity: 0.07,
    shadowRadius: 6,
    shadowOffset: { width: 0, height: 2 },
    elevation: 3,
  },
  cardCabecera: {
    backgroundColor: '#1565c0',
    paddingHorizontal: 16,
    paddingVertical: 12,
    gap: 2,
  },
  cardTitulo: {
    fontSize: 16,
    fontWeight: '700',
    color: '#ffffff',
  },
  cardSubtitulo: {
    fontSize: 12,
    color: '#bbdefb',
  },
  cardCuerpo: {
    padding: 12,
    gap: 8,
  },
  fila: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  etiqueta: {
    fontSize: 13,
    color: '#546e7a',
    fontWeight: '500',
  },
  valor: {
    fontSize: 13,
    color: '#1a1a1a',
    fontFamily: 'monospace',
  },
  
})


const estilos3 = StyleSheet.create({
  fondo: {
    flex: 1,
    backgroundColor: '#f0f4f8',
    padding: 20,
    paddingTop: 60,
    gap: 8,
  },
  titulo: {
    fontSize: 20,
    fontWeight: '700',
    color: '#1a237e',
    marginBottom: 8,
  },
  fila: {
    backgroundColor: '#ffffff',
    borderRadius: 10,
    paddingHorizontal: 16,
    paddingVertical: 14,
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    shadowColor: '#000',
    shadowOpacity: 0.05,
    shadowRadius: 3,
    shadowOffset: { width: 0, height: 1 },
    elevation: 1,
  },
  infoIzq: { gap: 2 },
  infoDer: { alignItems: 'flex-end', gap: 4 },
  nombreMascota: { fontSize: 14, fontWeight: '600', color: '#1a1a1a' },
  especieTexto: { fontSize: 12, color: '#90a4ae', fontFamily: 'monospace' },
  peso: { fontSize: 11, color: '#546e7a' },
  badge: {
    flexDirection: 'row',
    alignItems: 'center',
    borderRadius: 4,
    paddingHorizontal: 6,
    paddingVertical: 2,
  },
  icono: { fontWeight: '700' },
  textoBadge: { fontWeight: '600' },
})

const estilos4 = StyleSheet.create({
  safeArea: {
    flex: 1,
    backgroundColor: '#0d1b2a',
  },
  header: {
    paddingHorizontal: 20,
    paddingTop: 16,
    paddingBottom: 12,
    borderBottomWidth: 1,
    borderBottomColor: '#1c2e40',
  },
  headerTitulo: {
    fontSize: 20,
    fontWeight: '700',
    color: '#e3f2fd',
  },
  headerSub: {
    fontSize: 12,
    color: '#78909c',
    marginTop: 2,
  },
  scroll: { flex: 1 },
  scrollContenido: {
    padding: 16,
    gap: 10,
    paddingBottom: 40,
  },
  nodo: {
    backgroundColor: '#132232',
    borderRadius: 10,
    padding: 14,
    gap: 8,
    borderWidth: 1,
    borderColor: '#1c3548',
  },
  nodoEncabezado: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'baseline',
  },
  nodoNombre: {
    fontSize: 14,
    fontWeight: '700',
    color: '#e3f2fd',
  },
  nodoEspecie: {
    fontSize: 12,
    color: '#4fc3f7',
    fontFamily: 'monospace',
  },
  nodoRaza: {
    fontSize: 11,
    color: '#546e7a',
    marginBottom: 2,
  },
  barraFila: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
  },
  barraEtiqueta: {
    fontSize: 11,
    color: '#78909c',
    width: 28,
  },
  barraFondo: {
    flex: 1,
    height: 4,
    backgroundColor: '#1c3548',
    borderRadius: 2,
    overflow: 'hidden',
  },
  barraRelleno: {
    height: '100%',
    borderRadius: 2,
  },
  barraPct: {
    fontSize: 11,
    fontWeight: '600',
    width: 34,
    textAlign: 'right',
  },
})

const estilos5 = StyleSheet.create({
  safeArea: {
    flex: 1,
    backgroundColor: '#f0f4f8',
    padding: 24,
    paddingTop: 60,
  },
  titulo: {
    fontSize: 22,
    fontWeight: '700',
    color: '#1a237e',
  },
  subtitulo: {
    fontSize: 14,
    color: '#546e7a',
    marginTop: 4,
    marginBottom: 32,
    fontFamily: 'monospace',
  },
  acciones: { gap: 12 },
  botonAccion: {
    backgroundColor: '#1565c0',
    borderRadius: 10,
    paddingVertical: 14,
    alignItems: 'center',
  },
  textoAccion: {
    color: '#fff',
    fontWeight: '700',
    fontSize: 15,
  },
  resultado: {
    marginTop: 24,
    backgroundColor: '#e8f5e9',
    borderRadius: 8,
    padding: 14,
  },
  textoResultado: {
    color: '#2e7d32',
    fontSize: 13,
    fontFamily: 'monospace',
  },
  // Modal
  fondo: {
    flex: 1,
    backgroundColor: 'rgba(0,0,0,0.55)',
    justifyContent: 'center',
    alignItems: 'center',
  },
  dialogo: {
    backgroundColor: '#ffffff',
    borderRadius: 16,
    padding: 24,
    width: '85%',
    gap: 12,
    shadowColor: '#000',
    shadowOpacity: 0.2,
    shadowRadius: 12,
    shadowOffset: { width: 0, height: 6 },
    elevation: 10,
  },
  dialogoTitulo: {
    fontSize: 17,
    fontWeight: '700',
    color: '#1a1a1a',
  },
  dialogoMensaje: {
    fontSize: 14,
    color: '#546e7a',
    lineHeight: 20,
  },
  botones: {
    flexDirection: 'row',
    gap: 10,
    marginTop: 4,
  },
  boton: {
    flex: 1,
    borderRadius: 8,
    paddingVertical: 12,
    alignItems: 'center',
  },
  botonCancelar: {
    backgroundColor: '#f5f5f5',
  },
  botonConfirmar: {
    backgroundColor: '#1565c0',
  },
  textoCancelar: {
    color: '#424242',
    fontWeight: '600',
    fontSize: 14,
  },
  textoConfirmar: {
    color: '#ffffff',
    fontWeight: '700',
    fontSize: 14,
  },
})
const estilos6 = StyleSheet.create({
  safeArea: {
    flex: 1,
    backgroundColor: '#f0f4f8',
  },
  cabecera: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    paddingHorizontal: 20,
    paddingVertical: 14,
    backgroundColor: '#ffffff',
    borderBottomWidth: 1,
    borderBottomColor: '#e0e7ef',
  },
  cabNombre: {
    fontSize: 18,
    fontWeight: '700',
    color: '#1a237e',
  },
  cabEspecie: {
    fontSize: 12,
    color: '#78909c',
    fontFamily: 'monospace',
    marginTop: 2,
  },
  scrollContenido: {
    padding: 16,
    gap: 14,
    paddingBottom: 40,
  },
  gridAcciones: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 10,
  },
  botonAccion: {
    borderRadius: 8,
    paddingVertical: 10,
    paddingHorizontal: 16,
    minWidth: '45%',
    alignItems: 'center',
  },
  textoBotonAccion: {
    color: '#ffffff',
    fontWeight: '600',
    fontSize: 14,
  },
  entradaLog: {
    fontSize: 11,
    color: '#2e7d32',
    fontFamily: 'monospace',
    lineHeight: 18,
  },
})