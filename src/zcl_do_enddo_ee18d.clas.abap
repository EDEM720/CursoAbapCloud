CLASS zcl_do_enddo_ee18d DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_DO_ENDDO_EE18D IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


******************* BUCLE DO *************
*    DATA(lv_num) = 0.
*  DO.
*      out->write( lv_num ).
*      lv_num += 1.
*      IF lv_num > 8.
*        EXIT.
*
*      ENDIF.
*
*    ENDDO.
**********************
*    DO 20 TIMES.
*
*      DATA(lv_div) = sy-index MOD 2."sy-index variable del propio sap que indica el recorrido del bucle DO
*out->write( sy-index ).
*      CHECK lv_div = 0.
*     out->write( sy-index ).
*      out->write( sy-index ).
*    ENDDO.

    " Declaramos la cadena original con los nombres separados por espacios
    DATA(lv_string) = 'daniel Fernando Pedro ramon Sergio'.

    " Quitamos espacios duplicados y espacios al principio/final si los hubiera
    CONDENSE lv_string."""""""""""""""" lo mismo con funcion split"""""""""""""""""""""""""
    DATA: lv_nombre1 TYPE string,
          lv_nombre2 TYPE string,
          lv_nombre3 TYPE string,
          lv_nombre4 TYPE string,
          lv_nombre5 TYPE string,
          lv_long    TYPE i,
          lv_nombre  TYPE string.
*********** DEJAMOS TODOS IGUALES MAYUSCULAS ANTES
    lv_string = to_mixed( lv_string )."ESTO NO FUNCIONA POR AHORA

    " Extraer los nombres usando SPLIT
    SPLIT lv_string AT space  INTO  lv_nombre1 lv_nombre2 lv_nombre3 lv_nombre4 lv_nombre5.

    """""""""""""" SEGUNDA PARTE DEL EJERCICIO """"""""""""""""
    lv_long = strlen( lv_nombre ).

    DO  5 TIMES.
***********    EVALUAMOS ANTES DE ENTRAR EN EL PRIMER CASO *******

*      **** Evaluamos cada caso y asignamos a la variable lv_nombre el nombre
      CASE sy-index.
        WHEN 1.
          lv_nombre = lv_nombre1.
          lv_long = strlen( lv_nombre ).
*          out->write( lv_nombre && lv_long ).
        WHEN 2.
          lv_nombre = lv_nombre2.
          lv_long = strlen( lv_nombre ).
*          out->write( lv_nombre && lv_long ).
        WHEN 3.
          lv_nombre = lv_nombre3.
          lv_long = strlen( lv_nombre ).
*          out->write( lv_nombre && lv_long ).
        WHEN 4.
          lv_nombre = lv_nombre4.
          lv_long = strlen( lv_nombre ).
*          out->write( lv_nombre && lv_long ).
        WHEN 5.
          lv_nombre = lv_nombre5.
          lv_long = strlen( lv_nombre ).
*          out->write( lv_nombre && lv_long ).
        WHEN OTHERS.
      ENDCASE.
      IF lv_long > 7. "Verificamos si tiene siete por cada vez que pase
        out->write( 'Hola Fernando' ).
      ELSEIF lv_long = 6.
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

*    lv_nombre1 = strlen( lv_nombre1 ).
*    out->write( lv_nombre1 ).


    ENDDO.

  ENDMETHOD.
ENDCLASS.
