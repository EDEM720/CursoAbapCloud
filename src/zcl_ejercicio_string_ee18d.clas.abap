CLASS zcl_ejercicio_string_ee18d DEFINITION
  PUBLIC

  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_EJERCICIO_STRING_EE18D IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*  *************** El programa debe:
* Eliminar los espacios sobrantes de la frase.                             LISTO*************************
* Convertir la frase a minúsculas.                                         LISTO****************************
* Comprobar si la palabra "abap" aparece en ella.
* Si aparece, extraer solo esa
* palabra usando substring_from.
* Contar cuántos caracteres tiene la frase sin espacios iniciales/finales.
* Mostrar todos los resultados por consola.


    DATA: lv_texto   TYPE string VALUE '¡   Bienvenido a   ABAP Cloud, Daniel!   ',
          lv_newText TYPE string,
          lv_find    TYPE string,
          lv_aux     TYPE i.
********** " Elimina espacios duplicados e innecesarios ( como dobles espacios en blanco)
    lv_newtext = condense( lv_texto ).
    out->write( |La Cadena sin espacios es:{ lv_newtext } | ).
********** " Convierte a Mayusculas toda la cadena de caracteres
    lv_newtext = to_upper( lv_newtext ).
    out->write( |La Cadena en MAYUSCULAS es:{ lv_newtext } | ).
    out->write( |La Cadena en minusculas es:{ to_lower( lv_newtext ) } | ).
********** " Comprobar si la palabra "abap" aparece en ella
*    lv_aux = 'ABAP'.
*    lv_aux = count( val = lv_texto sub = lv_aux ).
*    IF lv_aux = 0.
*      lv_find = 'abap'.
*      out->write( |la palabra { lv_find } no se encuentra en { lv_newText }| ).
*    ELSE.
*      lv_find = 'ABAP'.
*      out->write( |la palabra { lv_find } se encuentra en el texto: { lv_newText }| ).
*    ENDIF.

*********** " Comprobar si la palabra "abap" aparece en ella
***************** PREGUNTAR POR EL 1-

    lv_find = 'abap'.
    lv_aux = find( val = lv_newtext sub = lv_find ).

    IF lv_aux > 0.
      lv_find = substring( val = lv_newtext off = lv_aux len = 4 ).
      out->write( |la palabra buscada es { lv_find } que se encuentra en: { lv_newText } | ).
    ELSE.
      out->write( |la palabra buscada es { lv_find } no se encuentra en: { lv_newText } | ).
    ENDIF.

    out->write( |La posicíon en la que esta es la: { lv_aux } | ).

***********************************  palabra usando substring_from.
    lv_find = 'ABAP'.
    lv_find = substring_from( val = lv_newtext sub = lv_find ).
    out->write( |la palabra sacada con SUBSTRINF_FROM { lv_find } que se encuentra en: { lv_newText } | ).

* *************** Contar cuántos caracteres tiene la frase sin espacios iniciales/finales.
    CONDENSE lv_newtext NO-GAPS.
    out->write( |La cadena sin espacio resulta asi:{ lv_newtext } | ).
    lv_newtext = strlen( lv_newtext ).
    out->write( | La cadena tiene { lv_newtext } caracteres en total | ).







  ENDMETHOD.
ENDCLASS.
