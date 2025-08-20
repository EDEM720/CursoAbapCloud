CLASS zcl_variables_ee18d DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_VARIABLES_EE18D IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
DATA: lv_string TYPE string VALUE 'Pedro',
      lv_date1 TYPE d ,
      lv_int TYPE i VALUE 35 ,
      lv_time TYPE c,
      lv_int2 TYPE i,
      lv_dec TYPE p LENGTH 8 DECIMALS 3 value '444.34'.

DATA: lv_nombre TYPE string,
      lv_edad TYPE i,
      lv_dni TYPE string,
      lv_nacimiento TYPE d.

      lv_date1 = cl_abap_context_info=>get_system_date( ).
      lv_time = cl_abap_context_info=>get_system_time( ).


  "*****Comentar y descomentar ctrl+7 *********************************************************************
  "*************************** OPERACIONES MATEMATICAS **********************


*  DATA: lv_num1 TYPE i VALUE 3,
*        lv_num2 TYPE i VALUE 5,
*        lv_num3 TYPE i VALUE 9,
*        lv_res TYPE i.
*
*lv_res = lv_num1 + lv_num2.
*out->write( lv_res ).
*
*lv_res = lv_num1 * lv_num2.
*out->write( lv_res ).
*
*lv_res = lv_num1 / lv_num2.
*out->write( lv_res ).
*
*lv_res = lv_num1 - lv_num3 * lv_num2.
*out->write( lv_res ).
*
* out->write( |La Suma de las variables es: | ).

"********************SACA LOS VALORES DE FORMA LITERAL************
DATA: lv_date  TYPE d,
          lv_date2 TYPE d VALUE '20240623 ',
          lv_mes   TYPE string.


    lv_date = cl_abap_context_info=>get_system_date(  ).

*    lv_mes = lv_date2+4(2). " mes
*     out->write( lv_mes ).
*    lv_mes = lv_date2(4).
*     out->write( lv_mes ).
*    lv_mes = lv_date2+3.
*     out->write( lv_mes ).

"*************************************************************************
"*********DEVUELVE EL NUMERO DE CARACTERES ENCONTRADOS EN LA CADENA****************************************************************
DATA: lv_cadena TYPE string VALUE 'DANIEL daniel DAVID',
      lv_contador TYPE i.

*lv_contador = numofchar( lv_cadena ).
lv_contador = count( val = lv_cadena sub = 'DA' ).

out->write( lv_contador ).

**********************************************************************
******** DECLARACION DE VARIABLE EN UN LINEA *************************

DATA(lv_variable_linea) = 8 * 16.
out->write( lv_variable_linea ).

DATA(lv_texto) = 'ABAP I 2025'.
out->write( lv_texto ).

DATA(lv_div) = 8 / 16.
out->write( lv_variable_linea * lv_variable_linea / lv_div ).


  ENDMETHOD.
ENDCLASS.
