CLASS zcl_data_table_ee18d DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_data_table_ee18d IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
*    " Vaciar la tabla antes de cargar datos de ejemplo
*    DELETE FROM ztab_db_ee18d.
*
*    " Insertar los registros
*    MODIFY ztab_db_ee18d FROM TABLE @(
*      VALUE #(
*        ( mandt         = '100'
*          id            = '001'
*          first_name    = 'Laura'
*          last_name     = 'Martinez'
*          email         = 'lauram@example.com'
*          phone_number  = '38512369'
*          salary        = '2000.30'
*          currency_code = 'EUR' )
*
*        ( mandt         = '100'
*          id            = '002'
*          first_name    = 'Mario'
*          last_name     = 'Martinez'
*          email         = 'marion@example.com'
*          phone_number  = '38512369'
*          salary        = '2000.30'
*          currency_code = 'EUR' )
*
*        ( mandt         = '100'
*          id            = '003'
*          first_name    = 'Daniela'
*          last_name     = 'Linares'
*          email         = 'daniela@example.com'
*          phone_number  = '38512369'
*          salary        = '2000.30'
*          currency_code = 'EUR' )
*
*        ( mandt         = '100'
*          id            = '004'
*          first_name    = 'Karol'
*          last_name     = 'Pérez'
*          email         = 'kperez@example.com'
*          phone_number  = '546987'
*          salary        = '5000.00'
*          currency_code = 'USD' )
*
*           ( mandt         = '100'
*          id            = '005'
*          first_name    = 'Mario'
*          last_name     = 'Pérez'
*          email         = 'kperez@example.com'
*          phone_number  = '546987'
*          salary        = '5000.00'
*          currency_code = 'USD' )
*
*      )
*
*    ).


GET TIME STAMP FIELD DATA(lv_timestamp_begin).

    DELETE FROM ztab_invoice_ee1.


    DO 10000 TIMES.

      MODIFY ztab_invoice_ee1 FROM TABLE @( VALUE #(

                                    ( invoice_id = sy-index
                                      comp = '1010'
                                      customer = 'coca-cola'
                                      status = 1
                                      created_by = cl_abap_context_info=>get_user_technical_name(  )
                                      amount = '1000'
                                      currency_key = 'USD' )

                                    ( invoice_id = sy-index
                                      comp = '1020'
                                      customer = 'Pepsi'
                                      status = 1
                                      created_by = cl_abap_context_info=>get_user_technical_name(  )
                                      amount = '2000'
                                      currency_key = 'USD' )


                                    ( invoice_id = sy-index
                                      comp = '1030'
                                      customer = 'patatas'
                                      status = 1
                                      created_by = cl_abap_context_info=>get_user_technical_name(  )
                                      amount = '500'
                                      currency_key = 'USD' )

                                    ( invoice_id = sy-index
                                      comp = '1040'
                                      customer = 'Piña'
                                      status = 1
                                      created_by = cl_abap_context_info=>get_user_technical_name(  )
                                      amount = '1000'
                                      currency_key = 'USD' )

                                    ( invoice_id = sy-index
                                      comp = '1050'
                                      customer = 'Manzana'
                                      status = 1
                                      created_by = cl_abap_context_info=>get_user_technical_name(  )
                                      amount = '1000'
                                      currency_key = 'EUR' )
       ) ).

    ENDDO.
   if sy-subrc = 0.
     out->write( 'ya estoy' ).
     else.
     out->write( 'nada ' ).
   endif.

    GET TIME STAMP FIELD DATA(lv_tiemstamp_end).
    DATA(lv_dif_sec) = cl_abap_tstmp=>subtract( EXPORTING tstmp1 = lv_tiemstamp_end
                                                           tstmp2 = lv_timestamp_begin ).

    out->write( |Tiempo total de ejecucion { lv_dif_sec }| ).

  ENDMETHOD.

ENDCLASS.
