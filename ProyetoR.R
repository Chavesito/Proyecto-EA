#analisis de regresion lineal
#unidad de analisis: un pedido realizado de manera digital en lo que va del año y fueron entregados a domicilio

#Lectura de Datos 
library(readxl)
datos <- read_excel("MuestraGrupo2.xlsx")
View(datos)

#tipo de datos
str(datos)

#visualizacion de las 10 primeras muestras
head(datos,n=10)

#creaccion de datos dummy

#dummy de zonadestino
datos$Norte <- ifelse(datos$ZonaDestino=="Norte",1,0)

#dummy de contacto
datos$SI <- ifelse(datos$Contacto=="Si",1,0)

#dummy de hora de entrega
datos$tarde <- ifelse(datos$HoraEntrega=="Tarde",1,0)
datos$noche <- ifelse(datos$HoraEntrega=="Noche",1,0)

