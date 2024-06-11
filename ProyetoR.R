#analisis de regresion lineal
#unidad de analisis: un pedido realizado de manera digital en lo que va del año y fueron entregados a domicilio

#Lectura de Datos 
library(readxl)
datos <- read_excel("C:/Users/leo-f/OneDrive/Documentos/Proyecto-EA/MuestraGrupo2.xlsx")
View(datos)

# Convertir variables categóricas en factores
datos$ZonaDestino <- as.factor(datos$ZonaDestino)
datos$HoraEntrega <- as.factor(datos$HoraEntrega)
datos$Contacto <- as.factor(datos$Contacto)

# Crear variables dummy para las variables categóricas
datos$Norte <- ifelse(datos$ZonaDestino == "Norte", 1, 0)
datos$SI <- ifelse(datos$Contacto == "Si", 1, 0)
datos$tarde <- ifelse(datos$HoraEntrega == "Tarde", 1, 0)
datos$noche <- ifelse(datos$HoraEntrega == "Noche", 1, 0)

# Ajustar el modelo de regresión lineal con las variables dummy
modelo_lineal <- lm(Tiempo ~ Preparacion + CostoTraslado + Productos + Norte + tarde + noche + EdadRepartidor + ExperienciaRepartidor + SI, data = datos)
summary(modelo_lineal)

# Seleccionar las variables significativas
modelo_seleccionado <- step(modelo_lineal, direction = "both")
summary(modelo_seleccionado)

# Evaluar los supuestos del modelo
par(mfrow = c(2, 2))
plot(modelo_seleccionado)

# Predecir el tiempo de traslado para un futuro pedido
nuevo_pedido <- data.frame(Preparacion = 20, CostoTraslado = 12, Productos = 10, 
                           Norte = 1, tarde = 0, noche = 0, 
                           EdadRepartidor = 30, ExperienciaRepartidor = 5, SI = 1)
prediccion_lineal <- predict(modelo_seleccionado, nuevo_pedido)
prediccion_lineal
