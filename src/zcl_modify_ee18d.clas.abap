CLASS zcl_modify_ee18d DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_modify_ee18d IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
************* MODIFICACION DE UN UNICO REGISTRO ********
    "declaramos una estructura para moder modificar ya que utilizamos registros
    DATA(ls_airline) = VALUE ztab_carrier_ee1( carrier_id = 'WZ'
                                               name = 'Wizz'
                                               currency_code = 'USD' ).

    MODIFY ztab_carrier_ee1 FROM @ls_airline.
    IF sy-subrc = 0.
      out->write( 'El registro ha sido introducido o modificado' ).
    ELSE.
      out->write( 'El registro ha sido introducido o modificado' ).
    ENDIF.

***************** MODIFICACION DE MULTIPLES REGISTROS *****************************
    CONSTANTS lc_currency TYPE c LENGTH 3 VALUE 'EUR'.

    SELECT FROM ztab_carrier_der
       FIELDS *
          WHERE carrier_id = 'LH'
          OR carrier_id = 'AF'
          INTO TABLE @DATA(lt_airlines).

    IF sy-subrc = 0.

      LOOP AT lt_airlines ASSIGNING FIELD-SYMBOL(<fs_airline>).
        <fs_airline>-currency_code = lc_currency.
      ENDLOOP.
      APPEND VALUE #( carrier_id  = 'AV'
                      name        =  'AVIANCA'
                      currency_code = 'COP' ) TO lt_airlines.

      MODIFY ztab_carrier_der FROM TABLE @lt_airlines.

      IF sy-subrc = 0.

        out->write(  'los registros se han modificado/creado ' ).
      ELSE.
        out->write(  'los registros NO se han modificado/creado ' ).

      ENDIF.
    ELSE.
      SELECT FROM /dmo/I_carrier
       FIELDS AirlineID AS carrier_id,
       Name,
       CurrencyCode AS currency_code
       WHERE AirlineID = 'AF' OR AirlineID = 'LH'
          INTO CORRESPONDING FIELDS OF TABLE @lt_airlines.
      "AF,Air France,EUR


    ENDIF.
  ENDMETHOD.

ENDCLASS.
