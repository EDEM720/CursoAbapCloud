CLASS zcl_estructuras_ee18d DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_ESTRUCTURAS_EE18D IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    TRY.
        DATA: lv_num1 TYPE i VALUE 10,
              lv_num2 TYPE i VALUE 0,
              lv_res  TYPE i.

        lv_res = lv_num1 / lv_num2.
        out->write( lv_res ).
      CATCH cx_sy_zerodivide INTO DATA(lv_zero_divide).
        out->write( lv_zero_divide ).
    ENDTRY.


  ENDMETHOD.
ENDCLASS.
