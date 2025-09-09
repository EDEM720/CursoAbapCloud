CLASS zcl_lab_05_flight_ee18d DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  METHODS check_fligth IMPORTING iv_carrier_id TYPE string
                                 iv_connection_id type i
                                 RETURNING VALUE(rv_result) TYPE abap_boolean.

  PROTECTED SECTION.
  PRIVATE SECTION.
  DATA: carrier_id TYPE string,
        connection_id TYPE i.
ENDCLASS.



CLASS zcl_lab_05_flight_ee18d IMPLEMENTATION.
  METHOD check_fligth.

  SELECT SINGLE FROM /dmo/flight
  fields carrier_id, connection_id
  where carrier_id eq @iv_carrier_id
  and connection_id eq @iv_connection_id
  Into  @data(lv_comp_name).

    if sy-subrc = 0.
    rv_result = abap_true.
    else.
    rv_result = abap_false.
    ENDIF.


  ENDMETHOD.

ENDCLASS.
