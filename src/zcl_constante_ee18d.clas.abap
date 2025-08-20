CLASS zcl_constante_ee18d DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CONSTANTE_EE18D IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*CONSTANTS: lc_pais TYPE string VALUE 'España',
*lc_moneda TYPE string VALUE 'EUR',
*lc_ahorros TYPE i VALUE 10,
*lc_iva TYPE p DECIMALS 4 VALUE '21.00'.
*
*DATA: lv_numero TYPE i.
*lv_numero = lc_ahorros + lc_ahorros .
*out->write( lv_numero ).
    "**************************** EJERCICIO 1 ***************************************
    "****************** EJERCICIO AREA DE UN CIRCULO ********************************

    CONSTANTS: lc_pi TYPE p LENGTH 8 DECIMALS 2 VALUE '3.14'.

    DATA: lv_rad TYPE i VALUE '100',
          lv_res TYPE p DECIMALS 2.
    "********** FORMULA MAS OPTIMA********
    lv_res = lc_pi * lv_rad ** 2.
    "lv_res = lc_pi * ( lv_rad * lv_rad ) .

    out->write( |El area del circulo de radio { lv_rad } es: { lv_res }| ).

    "**************************** EJERCICIO 2 ***************************************
    "****************** EJERCICIO OPERACIONES ARITMÉTICAS ********************************
    DATA: lv_val1 TYPE p DECIMALS 2 VALUE 6,
          lv_val2 TYPE p DECIMALS 2 VALUE 7.

"                   SUMA
lv_val1 = lv_val1 + lv_val2.
out->write( lv_val1 ).

CLEAR lv_val1.

"                   RESTA
lv_val1 = lv_val1 - lv_val2.
out->write( lv_val1 ).

CLEAR lv_val1.

"                   MULTIPLICACION
lv_val1 = lv_val1 * lv_val2.
out->write( lv_val1 ).

CLEAR lv_val1.

"                   DIVISION
lv_val1 = lv_val1 / lv_val2.
out->write( lv_val1 ).

CLEAR lv_val1.
  ENDMETHOD.
ENDCLASS.
