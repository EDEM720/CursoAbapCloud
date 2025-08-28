CLASS zcl_case_endcase_ee18d DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_case_endcase_ee18d IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    DATA(lv_cliente) = cl_abap_random_int=>create( seed = cl_abap_random=>seed(  )
*                                                                              min = 1
*                                                                              max = 9 )->get_next( ).
*    CASE lv_cliente.
*      WHEN 1.
*        out->write( lv_cliente ).
*        out->write( 'el cliente es 1' ).
*      WHEN 2.
*        out->write( lv_cliente ).
*        out->write( 'el cliente es 2' ).
*      WHEN 3.
*        out->write( lv_cliente ).
*        out->write( 'el cliente es 3' ).
*      WHEN 4.
*        out->write( lv_cliente ).
*        out->write( 'el cliente es 4' ).
*      WHEN OTHERS.
*        out->write( lv_cliente ).
*        out->write( 'el cliente no se ha registrado' ).
*    ENDCASE.

    DATA(lv_aleatorio) = cl_abap_random_int=>create(  seed = cl_abap_random=>seed(  )
         min = 1
          max = 4 )->get_next(  ).
    DATA(lv_aleatorio1) = cl_abap_random_int=>create(  seed = cl_abap_random=>seed(  )
         min = 0
          max = 9 )->get_next(  ).
    DATA(lv_aleatorio2) = cl_abap_random_int=>create(  seed = cl_abap_random=>seed(  )
         min = 0
          max = 9 )->get_next(  ).

    DATA: lv_resul TYPE p DECIMALS 2,
          lv_num1  TYPE i,
          lv_num2  TYPE i,
          lv_oper  TYPE i.

********************** IGUALAMOS NUMEROS RANDON A LA VARIABLE
    lv_num1 = lv_aleatorio1.
    lv_num2 = lv_aleatorio2.
    lv_oper = lv_aleatorio.

******************* REALIZAMOS LOS CASOS DE ACUERDO A LA OPERACION SUMA RESTA MULTIPLICACION Y DIVISION

    CASE lv_oper.
      WHEN 1.
        lv_resul = lv_num1 + lv_num2.
        out->write( |'La operacion es una suma de:' { lv_num1 } + { lv_num1 } Resultando: { lv_resul }|  ).
      WHEN 2.
        lv_resul = lv_num1 - lv_num2.
        out->write( |'La operacion es una resta de:' { lv_num1 } - { lv_num1 } Resultando: { lv_resul }|  ).
      WHEN 3.
        lv_resul = lv_num1 * lv_num2.
        out->write( |'La operacion es una Multiplicacion de:' { lv_num1 } * { lv_num1 } Resultando: { lv_resul }|  ).
      WHEN 4.
        lv_resul = lv_num1 / lv_num2.
        out->write( |'La operacion es una División de:' { lv_num1 } / { lv_num1 } Resultando: { lv_resul }|  ).

      WHEN OTHERS.

    ENDCASE.

*    DATA: lv_nombre1 TYPE string VALUE 'Daniel',
*          lv_nombre2 TYPE string VALUE 'Pedro',
*          lv_nombre3 TYPE string VALUE 'Diego',
*          lv_nombre4 TYPE string VALUE 'Sara'.
*DATA lv_nombre TYPE string.
*    IF lv_aleatorio = 1.
*    lv_nombre = lv_nombre1.
**      out->write( 'el nombre es:' && lv_nombre1 ).
*    ELSEIF lv_aleatorio = 2.
*    lv_nombre = lv_nombre2.
**      out->write( 'el nombre es:' && lv_nombre2 ).
*    ELSEIF lv_aleatorio = 3.
*    lv_nombre = lv_nombre3.
**      out->write( 'el nombre es:' && lv_nombre3 ).
*    ELSE .
*    lv_nombre = lv_nombre4.
**      out->write( 'el nombre es:' && lv_nombre4 ).
*    ENDIF.
*CASE lv_nombre.
*      WHEN 1.
*        out->write( lv_nombre ).
*        out->write( 'el cliente es 1' && lv_nombre ).
*      WHEN 2.
*        out->write( lv_nombre ).
*        out->write( 'el cliente es 2' && lv_nombre ).
*      WHEN 3.
*        out->write( lv_nombre ).
*        out->write( 'el cliente es 3' && lv_nombre ).
*      WHEN 4.
*        out->write( lv_nombre ).
*        out->write( 'el cliente es 4' && lv_nombre ).
*      WHEN OTHERS.
*        out->write( lv_nombre ).
*        out->write( 'el cliente no se ha registrado' ).
*    ENDCASE.
    lv_num1 = 3.
    IF lv_num1 IS INITIAL.
    ELSE.
    ENDIF.
    out->write( lv_num1 ).
  ENDMETHOD.
ENDCLASS.
