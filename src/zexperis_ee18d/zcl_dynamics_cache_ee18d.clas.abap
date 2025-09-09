CLASS zcl_dynamics_cache_ee18d DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dynamics_cache_ee18d IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    GET TIME STAMP FIELD DATA(lv_timestamp_begin).

    SELECT FROM ztab_invoice_ee1
    FIELDS comp,
            currency_key,
            SUM( amount ) AS totalAmount

            GROUP BY comp, currency_key
            INTO TABLE @DATA(lt_invoices).

    IF sy-subrc = 0.

      GET TIME STAMP FIELD DATA(lv_timestamp_end).

      DATA(lv_dif_sec) = cl_abap_tstmp=>subtract( EXPORTING tstmp1 = lv_timestamp_end
                                                            tstmp2 = lv_timestamp_begin ).

out->write( |Numero de registros: { lines( lt_invoices ) }| ).
out->write( lt_invoices ).
out->write( |tiempo de ejecucion total: { lv_dif_sec }| ).
else.
out->write( 'no estoy entrando' ).
ENDIF.
    ENDMETHOD.

ENDCLASS.
