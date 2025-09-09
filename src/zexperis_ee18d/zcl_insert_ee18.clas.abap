CLASS zcl_insert_ee18 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_insert_ee18 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
*    DATA ls_airline TYPE ztab_carrier_ee1.
*    ls_airline = VALUE #( carrier_id = 'AA'
*                        name = 'American Airline'
*                        currency_code = 'USD' ).
*
*    INSERT ztab_carrier_ee1 FROM @ls_airline.
*
*    IF sy-subrc = 0.
*      out->write( 'Registro introducido' ).
*      else.
*       out->write( 'Registro no se ha introducido' ).
*
*      ENDIF.
********************** MULTIPLES REGISTROS ******************
*    DATA lt_ddbb TYPE STANDARD TABLE OF ztab_carrier_ee1.
*
*    SELECT FROM /DMO/I_Carrier
*    FIELDS *
*    WHERE currencyCode = 'USD'
*    INTO TABLE @DATA(lt_airlines).
*
*    IF sy-subrc = 0.
*
*      lt_ddbb = CORRESPONDING #( lt_airlines MAPPING carrier_id  = AirlineID
*                                                     currency_code = CurrencyCode ).
*
*      INSERT ztab_carrier_ee1 FROM TABLE @lt_ddbb.
*      IF sy-subrc = 0.
*        out->write( |el numero de lines insertada es { sy-dbcnt }| ).
*      ENDIF.
*    ENDIF.
************************************ NUEVA TABLA DE FLIGHT ******************
 DELETE from ztab_flight_ee1.

 DATA lt_flights TYPE STANDARD TABLE OF ztab_flight_ee1.

    SELECT FROM /DMO/I_Flight
    FIELDS *
    INTO corresponding FIELDS OF TABLE @lt_flights.

    if sy-subrc = 0.

   INSERT ztab_flight_ee1 from table @lt_flights.

     IF sy-subrc = 0.
        out->write( |el numero de lines insertada es { sy-dbcnt }| ).
      ENDIF.

    ENDIF.
  ENDMETHOD.

ENDCLASS.
