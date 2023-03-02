<h1>INDICADORES DE PRECIOS DE ALQUILER Y VENTA DE DEPARTAMENTOS</h1>
<p> El proyecto profesional indica las funciones de la tabla están siendo analizadas previamente antes de su desarrollo y representadas en un dashboard para los procesos de venta y alquiler de departamentos, para el análisis se toma como referencia el dataset del BCRP que realiza el seguimiento de la evolución de imobiliarios desde 1998 hasta la actualidad. El objetivo principal es analizar la falta de información sobre los precios para poder hacer una comparación si es más factible la compra, venta o alquiler de un departamento,  además debemos asumir que la mayoría de los clientes cuentan con un presupuesto limitado.</p><br>
<h2>DESCRIPCIÓN DEL PROBLEMA</h2>
<p>El derecho a una vivienda adecuada es más amplio que el derecho a la propiedad, puesto que contempla derechos no vinculados con la propiedad y tiene como fin asegurar que todas las personas, incluidas las que no son propietarias, tengan un lugar seguro para vivir en paz y dignidad.
Por ello se observó que en la provincia de Lima el 72% no cuentan con vivienda propia, los factores que influyen en esto son escasos recursos económicos y falta de información de lugares más accesibles con buenas condiciones según su presupuesto.
El problema principal a analizar es la falta de información sobre los precios para poder hacer una comparación si es más factible la compra, venta o alquiler de un departamento,  además debemos asumir que la mayoría de los clientes cuentan con un presupuesto limitado.<p>
<h2>OBJETIVO</h2>
<p>Analizar e investigar las causas que influyen en los precios de alquiler y venta de departamentos en los distritos de Lima.<br>
</p>
<h2>OBTENCIÓN DE DATOS</h2>

Los datos se obtuvo del Banco Central de Reserva del Perú [(BCRP)](https://www.bcrp.gob.pe/estadisticas/indicador-de-precios-de-venta-de-departamentos.html)
, teniendo información desde 2010 haciendo seguimientos a la evaluación del mercado inmobiliario a través de indicadores de precios de alquiler y venta, los distritos de dónde se recaba la información y generan ingresos son de Barranco, la Molina, Miraflores, San Borja, San Isidro, Surco, Jesús María, Lince, Magdalena, Pueblo Libre, San Miguel y Surquillo.
<p>Los archivos son “Datos desagregados-Venta” y  “Datos desagregados-Alquiler”.</p>
<h2>DICCIONARIO DE DATOS</h2>

![Dashboard](https://github.com/LPaola614/Indicadores_de_Precios_de_Venta_y_Alquiler/blob/main/Proyecto_ADE/Tabla_Datos.PNG)

<h2>PREPROCESAMIENTO DE DATOS</h2>

Eliminación de outliers , limpieza de valores nulos, inserción de una nueva columna llamado Tipo_Cambio del dólar y corrección de valores de la columna Distritos.

<h2>ELABORACIÓN DEL DASHBOARD</h2>

![Dashboard](https://github.com/LPaola614/Indicadores_de_Precios_de_Venta_y_Alquiler/blob/main/Proyecto_ADE/dashboard.png?raw=true)

<h2>ANALYTICAL TASKS</h2>

<p>Para el análisis nos planteamos las siguientes tareas con sus respectivas preguntas respondiendo cada una de estas, cada proceso que fue elaborado se utiliza los atributos  del dataset para el desarrollo de cada una de ellas.<br>
- Analizar los precios de los departamentos por años<br>
- Analizar los precios de los departamentos por trimestres<br> 
- Analizar los precios de los departamentos por distritos<br> 
- Analizar los precios de los departamentos por metros cuadrados<br>  
- Analizar los precios de los departamentos por número de habitaciones<br>
- Analizar los precios de los departamentos por vista<br>
- Analizar los precios de los departamentos por el número de piso de ubicación<br>
- Analizar los precios de los departamentos por los años de antigüedad<br>
</p>
<h2>PREGUNTAS</h2> 

 - ¿En qué años los precios de los departamentos se elevaron?<br>
Debido a muchos factores que ha transcurrido a lo largo del tiempo muchas personas optaron en la venta de un departamento, teniendo en cuenta que los precios son más elevados que un alquiler, en los años 2016 y 2018 se ve un incremento muy elevado  aproximadamente un promedio de s/11,258,038.00 en los distritos de San Isidro.
 Esta es una de las causas, porque el incremento de las ventas superan al año 2017 que fueron de  s/ 8,953,041.00, Cabe mencionar que los precios de los departamentos se han mantenido relativamente estables.
En el año 2016 la economía peruana incrementó un 3.9 % , nivel superior al de hace dos años, informó el Instituto Nacional de Estadística e Informática(INE). Cabe recalcar que el PBI peruano creció 2.39% en 2014 y 3.26% en 2015, reportando que la economía creció en el sector de Alojamiento un 2.57%. En el año 2018 el precio del dólar para afines se incrementó un 96.73%, por el tipo de cambio que autorizó la senda alcista de la reforma tributaria en EE.UU. Es por ello que se generó esa incertidumbre sobre el alza de tasas. Es por ello que para inicios del 2019 disminuye un s/ 5,826,366.00 en el distrito de San Isidro.

![Dashboard](https://github.com/LPaola614/Indicadores_de_Precios_de_Venta_y_Alquiler/blob/main/pregunta1_2016.png)<br>
![Dashboard](https://github.com/LPaola614/Indicadores_de_Precios_de_Venta_y_Alquiler/blob/main/Pregunta1_2018.png)<br>
![Dashboard](https://github.com/LPaola614/Indicadores_de_Precios_de_Venta_y_Alquiler/blob/main/pregunta1_2017.png)<br>

<hr>

 - ¿Qué tipo de tendencia representan los precios de venta desde el 2010 al 2020?¿Por qué?<br>

<p>De acuerdo al índice de precios en soles corrientes por año, los precios de ventas de los departamentos de Lima Metropolitana tuvieron un comportamiento creciente entre los inicios de 2010  y fines de 2019, el promedio anual del PER en Lima aumentó continuamente.  Luego que el vicepresidente Martín Vizcarra asume la presidencia, el congreso establece permanentemente el régimen especial de Jubilación Anticipada para que personas  desempleadas afiliadas a una AFP puedan jubilarse a los 55 años siendo en abril del 2019, muchas personas fueron a retirar sus ahorros para poder disponer del dinero, incrementando así el precio de muchos servicios como el de alojamiento, es por ello que el precio de  ventas de los  departamentos se incrementó un 6.23%.</p>

![Dashboard](https://github.com/LPaola614/Indicadores_de_Precios_de_Venta_y_Alquiler/blob/main/Proyecto_ADE/Tendencias_2010_2020.PNG)<br>

<hr>

- ¿Cuál es el porcentaje de ofertas por distrito? y ¿Cuáles son los distritos con mayor y menor precio en alquileres?<br>
![Dashboard](https://github.com/LPaola614/Indicadores_de_Precios_de_Venta_y_Alquiler/blob/main/Proyecto_ADE/ofertas%20de%20alquiler%20por%20distritos.png)<br>
  - Mayor precio:<br>
  San Isidro, Barranco, Santiago de Surco y San Borja<br>
 ![Dashboard](https://github.com/LPaola614/Indicadores_de_Precios_de_Venta_y_Alquiler/blob/main/Proyecto_ADE/distrito%20con%20valor%20alto%20de%20alquiler.png)<br>
  - Menor precio:<br>
  Pueblo Libre, Breña, Carabayllo y Bellavista<br>
 
  ![Dashboard](https://github.com/LPaola614/Indicadores_de_Precios_de_Venta_y_Alquiler/blob/main/Proyecto_ADE/distritos%20con%20mayor%20y%20menor%20precio.png)<br>
  
<hr>

- ¿Qué tipo de tendencia representan los precios de alquiler desde el 2010 al 2020?¿Por qué?<br>

Tiene una tendencia creciente, donde uno de los factores que influyó es la pandemia, donde mucha gente debido a las restricciones establecidas por el gobierno, estuvo obligada a quedarse en los lugares donde se encontraban, y el tipo de cambio del dólar continuó incrementando.<br>
![Dashboard](https://github.com/LPaola614/Indicadores_de_Precios_de_Venta_y_Alquiler/blob/main/Proyecto_ADE/precio%20por%20a%C3%B1os.png)<br>

<hr>

- ¿Por qué los precios de los alquileres incrementaron en el 2018?<br> 

Debido a la visita del papa Francisco entre el 18 y 21 de enero de 2018 Santiago de surco, Jesús María, entre otros.<br>
![Dashboard](https://github.com/LPaola614/Indicadores_de_Precios_de_Venta_y_Alquiler/blob/main/Proyecto_ADE/precio%20por%20distrito%202018.png)<br> 
![Dashboard](https://github.com/LPaola614/Indicadores_de_Precios_de_Venta_y_Alquiler/blob/main/Proyecto_ADE/precio%20por%20trimestre%202018.png)<br> 

<hr>

- ¿Por qué el precio de los alquileres se incrementaron en el 2020?<br> 

El precio de los alquileres de los departamentos subió debido al inicio de la pandemia y al incremento del dólar.<br> 
![Dashboard](https://github.com/LPaola614/Indicadores_de_Precios_de_Venta_y_Alquiler/blob/main/Proyecto_ADE/tipo%20de%20cambio%20por%20a%C3%B1o.png)<br>
![Dashboard](https://github.com/LPaola614/Indicadores_de_Precios_de_Venta_y_Alquiler/blob/main/Proyecto_ADE/precio%20por%20a%C3%B1os.png)<br>

<hr>

- ¿En qué distritos la pandemia influenció en mayor medida respecto a los precios?<br> 

Los distritos con mayores variaciones en cuanto a precios son: La Molina y Magdalena<br>
![Dashboard](https://github.com/LPaola614/Indicadores_de_Precios_de_Venta_y_Alquiler/blob/main/Proyecto_ADE/precio%20por%20distrito%202019.png)<br> 
![Dashboard](https://github.com/LPaola614/Indicadores_de_Precios_de_Venta_y_Alquiler/blob/main/Proyecto_ADE/precio%20por%20distrito%202020.png)<br> 
 
<hr>

 - ¿Cuál es el precio promedio de la venta de un departamento?<br> 
 
 El precio promedio de un departamento es de s/ 548.18 mil<br>
 
<hr>

  - ¿Cuál es el precio promedio de alquiler de un departamento?<br>
 El precio promedio de un departamento es de s/ 2.81 mil<br>

<hr>

  - ¿Cuál es el precio promedio de la venta y alquiler de un departamento por piso de ubicación?<br>
 
 Alquiler<br>
 Piso de ubicación del primer nivel<br>
![Dashboard](https://github.com/LPaola614/Indicadores_de_Precios_de_Venta_y_Alquiler/blob/main/Proyecto_ADE/Primer_Piso.PNG)<br>
Piso de ubicación del décimo nivel <br>
![Dashboard](https://github.com/LPaola614/Indicadores_de_Precios_de_Venta_y_Alquiler/blob/main/Proyecto_ADE/piso_Alto.PNG)<br>
Venta <br>
Piso de ubicación del primer nivel <br>
![Dashboard](https://github.com/LPaola614/Indicadores_de_Precios_de_Venta_y_Alquiler/blob/main/Proyecto_ADE/Venta_Piso_1.PNG)<br>
Piso de ubicación del décimo nivel <br>
![Dashboard](https://github.com/LPaola614/Indicadores_de_Precios_de_Venta_y_Alquiler/blob/main/Proyecto_ADE/Venta_Piso_10.PNG)<br>
 
<hr>

 - ¿Cuál es el precio promedio de la venta de un departamento por los años de antigüedad?<br>

El precio promedio es de s/694.00 mil<br>
![Dashboard](https://github.com/LPaola614/Indicadores_de_Precios_de_Venta_y_Alquiler/blob/main/Proyecto_ADE/Antiguedad_1.PNG)<br>
El precio promedio es de s/511.00 mil<br>
![Dashboard](https://github.com/LPaola614/Indicadores_de_Precios_de_Venta_y_Alquiler/blob/main/Proyecto_ADE/Antiguedad_2.PNG)<br>

<h2>CONCLUCIÓN</h2>

 - La venta de los departamentos es influenciada en gran medida por el tipo de cambio del dólar, como sucedió en el año 2012 con la caída del dólar.
 - La crisis económica y política influye sobre el precio de los inmuebles ya que genera incertidumbre.
 - La variación del precio de los alquileres es influenciada por acontecimientos o necesidades importantes en un determinado lugar.
 - La variación del precio de venta de los departamentos incrementa en relación a la ubicación, número de habitaciones, piso, superficie, entre otros, sin embargo, tiende a devaluarse con el tiempo y además se ve influenciado por los acontecimientos que suceden en nuestro país.

