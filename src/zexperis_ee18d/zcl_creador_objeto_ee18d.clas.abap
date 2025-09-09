CLASS zcl_creador_objeto_ee18d DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_creador_objeto_ee18d IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA(lo_contract) = NEW zcl_clase_creadora_ee18d(  ). "Creamos el objeto pero esta vacio
    DATA lv_process TYPE string.

    IF lo_contract IS BOUND.

      lo_contract->set_client(
        EXPORTING
          iv_client   = 'Experis'
          iv_location = space
        IMPORTING
          ev_status   = DATA(lv_status)
        CHANGING
          cv_process  = lv_process
      ).
      lo_contract->get_client(
        IMPORTING
          ev_client = DATA(lv_client)
      ).

      lo_contract->region = 'EU'.

    ENDIF.

*    lo_contract->get_client_name(
*      EXPORTING
*        iv_client_id   = '01'
*      RECEIVING
*        rv_client_name = data(lv_cliente_name)
*    ).
    DATA(lv_client_name) = lo_contract->get_client_name( iv_client_id = '01' ).
    out->write( lv_client_name ).
  ENDMETHOD.

ENDCLASS.
