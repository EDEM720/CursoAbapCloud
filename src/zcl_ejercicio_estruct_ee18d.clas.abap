CLASS zcl_ejercicio_estruct_ee18d DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
*  *************************************** ENUNCIADO DE EJERCICIO ***************************************************
*Ejercicio: Evaluación de Naves Espaciales
*Enunciado
*Estás desarrollando un sistema para gestionar y evaluar el estado de diferentes naves espaciales. Para ello, deberás definir
*una estructura que agrupe los datos relevantes de cada nave y aplicar una serie de condiciones lógicas para emitir alertas o recomendaciones.
*1. Estructura de datos
*Define un tipo de estructura anidada que contenga tres bloques de información:
*datos_generales:
*nombre
*modelo
*pais_origen
*especificaciones:
*velocidad_max
*autonomia
*estado_mision:
*mision
*nivel_combustible
*2. Declaración de datos
*Declara tres variables estructuradas basadas en ese tipo y asígnales valores usando VALUE #( ).
*Asegúrate de que:
*Al menos una nave no sea de 'EEUU'
*Al menos una tenga una autonomía inferior a 1000
*Al menos una contenga la palabra "Marte" en el campo mision
*3. Evaluación de condiciones
*
*  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_EJERCICIO_ESTRUCT_EE18D IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
***** Comenzamos haciendo la estructura anidada con el TYPE por que necesitamos varias estructuras
***** SE UTILIZA TYPE POR QUE SON VARIAS ESTRUCTURAS NO UNA UNICA QUE SE DECLARA CON DATA
    " Declaramos lun tipo de estructura anidada para representar naves espaciales
    TYPES:BEGIN OF ls_nave,

            BEGIN OF ls_datos_gen,
              nombre      TYPE string,
              modelo      TYPE string,
              pais_origen TYPE string,
            END OF ls_datos_gen,

            BEGIN OF ls_especificaciones,
              velocidad_max TYPE i,
              autonomia     TYPE i,
            END OF ls_especificaciones,

            BEGIN OF ls_estado_mision,
              mision            TYPE string,
              nivel_combustible TYPE i,
            END OF ls_estado_mision,

          END OF ls_nave.
***********************  DECLARAMOS LAS ESTRUCTURAS QUE NECESITAMOS PARA LAS DISTINTAS NAVES *********************************
    DATA: ls_nave1 TYPE ls_nave,
          ls_nave2 TYPE ls_nave,
          ls_nave3 TYPE ls_nave.

*********************** INTRODUCIMOS LOS DATOS EN LA ESTRUCTURA    ************************************************************
    ls_nave1 = VALUE #(
                          ls_datos_gen = VALUE #( nombre = 'Centinela Solar' modelo = 'Artemis' pais_origen = 'UE' )
                          ls_especificaciones = VALUE #( velocidad_max = 1000 autonomia = 800 )
                          ls_estado_mision = VALUE #( mision = 'Sendero Estelar' nivel_combustible = 100 )
                        ).
    ls_nave2 = VALUE #(
                         ls_datos_gen = VALUE #( nombre = 'Niebla Cósmica' modelo ='Nova' pais_origen = 'LATAM' )
                         ls_especificaciones = VALUE #( velocidad_max = 900 autonomia = 1200 )
                         ls_estado_mision = VALUE #( mision = 'Más Allá del Velo' nivel_combustible = 75 )
                         ).
    ls_nave3 = VALUE #(
                        ls_datos_gen = VALUE #( nombre = 'Viajera de Orión' modelo ='Polaris' pais_origen = 'EEUU' )
                        ls_especificaciones = VALUE #( velocidad_max = 1100 autonomia = 1300 )
                        ls_estado_mision = VALUE #( mision = 'Horizonte Infinito a Marte' nivel_combustible = 45 )

    ).
********************* EVALUACIONDE CONDICIONES ************************************************************************************
*Para cada nave, evalúa las siguientes reglas utilizando operadores lógicos (AND, OR, <>, >=, CP) y muestra los mensajes correspondientes
* con out->write:
*Condición 1:
*Si la nave no es de EEUU y su velocidad máxima es superior a 25000:
*→ Mostrar: "Nave extranjera de alta velocidad"
*Condición 2:
*Si la autonomía es menor a 1000 o el nivel de combustible es inferior al 20%:
*→ Mostrar: "Revisión urgente necesaria"
*Condición 3:
*Si el campo mision contiene la palabra "Marte" (mayúsculas o minúsculas) y el nivel de combustible es mayor o igual al 75%:
*→ Mostrar: "Misión a Marte en condiciones óptimas"
******* CREAMOS VARIABLES PARA BUSCAR LOS TERMINOS PAIS DE ORIGEN EEUU VELOCIDAD MAXIMA SUPERIOR A 2500
*DATA: lv_pais_aux TYPE string,
*      lv_velo_aux TYPE i.
*
*      lv_pais_aux = 'EEUU'.

* 1 Condición Si la nave no es de EEUU y su velocidad máxima es superior a 25000
    IF ls_nave1-ls_datos_gen-pais_origen <> 'EEUU' AND ls_nave1-ls_especificaciones-velocidad_max > 2500.
      out->write( 'Nave extranjera de alta velocidad' ).

    ELSEIF ls_nave2-ls_datos_gen-pais_origen <> 'EEUU' AND ls_nave2-ls_especificaciones-velocidad_max > 2500.
      out->write( 'Nave extranjera de alta velocidad' ).

    ELSEIF ls_nave3-ls_datos_gen-pais_origen <> 'EEUU' AND ls_nave3-ls_especificaciones-velocidad_max > 2500.
      out->write( 'Nave extranjera de alta velocidad' ).
    ENDIF.
* Condición 2:Si la autonomía es menor a 1000 o el nivel de combustible es inferior al 20%:
    IF ls_nave1-ls_especificaciones-autonomia < 1000 OR ls_nave1-ls_estado_mision-mision < 20.
      out->write( 'Revisión urgente necesaria' ).
    ELSEIF ls_nave2-ls_especificaciones-autonomia < 1000 OR ls_nave1-ls_estado_mision-mision < 20.
      out->write( 'Revisión urgente necesaria' ).
    ELSEIF ls_nave3-ls_especificaciones-autonomia < 1000 OR ls_nave1-ls_estado_mision-mision < 20.
      out->write( 'Revisión urgente necesaria' ).
    ENDIF.
    out->write( 'estoy aqui ' ).

  ENDMETHOD.
ENDCLASS.
