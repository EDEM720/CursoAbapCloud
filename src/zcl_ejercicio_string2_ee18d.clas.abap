CLASS zcl_ejercicio_string2_ee18d DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_EJERCICIO_STRING2_EE18D IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*Ejercicio:
*1-Extraer de la siguiente variable   DATA(lv_string) = 'danielFernando Pedro ramonSergio’.   losdistintos nombres que hay su interior y almacenar cada nombre en variables independientes.
*****************************
*2-Crear un sistema que:
*  2.1-Identifique si el numero de caracteres de cada variable creada es  mayor a 7 y que en caso         afirmativo, que aparezca por consola un mensaje diciendo “Hola Fernando”,
*  2.2-En caso de ser menor de 7, el programa tendrá que comprobar si el tamaño del nombre es igual a 6.
*  2.3-En caso negativo se deberá escribir por consola un mensaje diciendo “Hola Pedro”  y cambiar el   tipo de caracares del nombre de minúscula a mayúscula.
*  2.4-En caso afirmativo se deberá identificar si el nombre es Sergio o Daniel, en caso del nombre sea Sergio se   escribirá un mensaje que diga “Hola Sergio”  y en caso de ser Daniel otro mensaje que diga “Hola Daniel”.
*
***Solo se podrán usar el condicional IF y las funciones de caracteres que hemos visto en clase, nada de bucles u otros eleméntenos que no se hayan visto en clase .**  PROHIBIDO usar el SPLIT
* DECLARAMOS VARIABLE INICIAL
    DATA(lv_string) = 'daniel Fernando Pedro ramon Sergio'.

* DECLARAMOS LAS VARIABLES NECESARIAS PARA SACAR LOS NOMBRE
    DATA: lv_name1 TYPE string,
          lv_name2 TYPE string,
          lv_name3 TYPE string,
          lv_name4 TYPE string,
          lv_name5 TYPE string.
*          QUITAMOS LOS ESPACIOS INNECESARIOS
    CONDENSE lv_string.

* BUSCAMOS LA POSICION DEL PRIMER ESPACIO
    DATA(lv_pos1) = find( val = lv_string sub = | | ).

* EXTRAEMOS EL PRIMER NOMBRE DESDE LA POSICION 0

    lv_name1 = substring( val = lv_string off = 0 len = lv_pos1 ).

*  OBTENEEMOS EL RESTO DE LA CADENA A PARTIR DEL PACIO
    DATA(lv_rest) = substring_after( val = lv_string sub = | | ).

* BUSCAMOS LA POSICION DEL SEGUNDO ESPACIO EN BLANCO

    DATA(lv_pos2) = find( val = lv_rest sub = | | ).

* EXTRAEMOS EL SEGUNDO NOMBRE DESDE LA POSICION 2

    lv_name2 = substring( val = lv_rest off = 0 len = lv_pos2 ).

*  OBTENEEMOS EL RESTO DE LA CADENA A PARTIR DEL 3 ESPACIO

    DATA(lv_rest2) = substring_after( val = lv_rest sub = | | ).

* BUSCAMOS LA POSICION DEL TERCERO ESPACIO EN BLANCO

    DATA(lv_pos3) = find( val = lv_rest2 sub = | | ).

* EXTRAEMOS EL TERCER NOMBRE DESDE LA POSICION 3

    lv_name3 = substring( val = lv_rest2 off = 0 len = lv_pos3 ).

    DATA(lv_rest3) = substring_after( val = lv_rest2 sub = | | ).

* BUSCAMOS LA POSICION DEL CUARTO ESPACIO EN BLANCO

    DATA(lv_pos4) = find( val = lv_rest3 sub = | | ).

* EXTRAEMOS EL CUARTO NOMBRE DESDE LA POSICION 4

    lv_name4 = substring( val = lv_rest3 off = 0 len = lv_pos4 ).

    DATA(lv_rest4) = substring_after( val = lv_rest3 sub = | | ).

* EXTRAEMOS EL QUINTO NOMBRE DESDE LA POSICION 5

    lv_name5 = substring_after( val = lv_rest3 sub = | | ).

    out->write( |Los nombres son: { lv_name1 } { lv_name2 } { lv_name3 } { lv_name4 } { lv_name5 }| ).

* PARTE 2 FUNCIONALIDAD DE CADENAS

    " Seleccionamos un nombre a evaluar (en este caso, el primero: daniel)
    DATA(lv_nombre) = lv_name3.

    " Obtenemos su longitud
    DATA(lv_longitud) = strlen( lv_nombre ).

    " Evaluamos según la longitud del nombre
    IF lv_longitud > 7.
      " Si tiene más de 7 caracteres, asumimos que es Fernando
      out->write( 'Hola Fernando' ).

    ELSEIF lv_longitud = 6.
      " Si tiene 6 caracteres puede ser Sergio o Daniel
      IF lv_nombre = 'Sergio'.
        out->write( 'Hola Sergio' ).
      ELSEIF lv_nombre = 'daniel'.
        out->write( 'Hola Daniel' ).
      ENDIF.

    ELSE.
      " Si no es ninguno de los anteriores, asumimos que es Pedro o Ramon
      IF lv_nombre = 'ramon'.
         " Convertimos el nombre a mayúsculas
      lv_nombre = to_upper( lv_nombre ).

      " Mostramos el nombre en mayúsculas
      out->write( |Nombre en mayúsculas: { lv_nombre }| ).
      ELSE.
       " Convertimos el nombre a mayúsculas
      lv_nombre = to_upper( lv_nombre ).

      " Mostramos el nombre en mayúsculas
      out->write( |Nombre en mayúsculas: { lv_nombre }| ).
      ENDIF.




    ENDIF.


  ENDMETHOD.
ENDCLASS.
