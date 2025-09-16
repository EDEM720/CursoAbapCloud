CLASS zcl_00_main_ee18d DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_00_main_ee18d IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
*    DATA(lo_empleado) = NEW zcl_01_class_ee18d( iv_nombre = 'Rodrigo'
*                                                iv_apellido = 'mendez'
*                                                iv_telefono = '67272727'
*                                                iv_certification = '1'
*                                                iv_experience = '1' ).
*
*
*    DATA(lv_alta) = lo_empleado->alta_empleado(  ).
*    out->write( lv_alta ).

**************************************************************************
**************************     HERENCIA   ********************************

   DATA(lo_company) = NEW zcl_03_class_der(  ).
    DATA(lo_pant) = NEW zcl_04_class_der(  ).
    DATA(lo_storage_location) = NEW zcl_05_class_der(  ).

    lo_company->set_company_code( '1234' ).
    lo_company->set_currency( 'USD' ).


    lo_company->get_company_code( importing ev_company_code = data(lv_company_code) ).
    lo_company->get_currency( importing ev_currency = data(lv_currency) ).

    out->write( |{ lv_company_code }-{ lv_currency }| ).





  ENDMETHOD.

ENDCLASS.
