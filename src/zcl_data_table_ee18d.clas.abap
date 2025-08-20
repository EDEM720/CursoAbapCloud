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
    " Vaciar la tabla antes de cargar datos de ejemplo
    DELETE FROM ztab_db_ee18d.

    " Insertar los registros
    MODIFY ztab_db_ee18d FROM TABLE @(
      VALUE #(
        ( mandt         = '100'
          id            = '00000001'
          first_name    = 'Laura'
          last_name     = 'Martinez'
          email         = 'lauram@example.com'
          phone_number  = '38512369'
          salary        = '2000.30'
          currency_code = 'EUR' )

        ( mandt         = '100'
          id            = '00000002'
          first_name    = 'Mario'
          last_name     = 'Martinez'
          email         = 'marion@example.com'
          phone_number  = '38512369'
          salary        = '2000.30'
          currency_code = 'EUR' )

        ( mandt         = '100'
          id            = '00000003'
          first_name    = 'Daniela'
          last_name     = 'Linares'
          email         = 'daniela@example.com'
          phone_number  = '38512369'
          salary        = '2000.30'
          currency_code = 'EUR' )

        ( mandt         = '100'
          id            = '00000004'
          first_name    = 'Karol'
          last_name     = 'Pérez'
          email         = 'kperez@example.com'
          phone_number  = '546987'
          salary        = '5000.00'
          currency_code = 'USD' )

           ( mandt         = '100'
          id            = '00000005'
          first_name    = 'Mario'
          last_name     = 'Pérez'
          email         = 'kperez@example.com'
          phone_number  = '546987'
          salary        = '5000.00'
          currency_code = 'USD' )

      )

    ).
  ENDMETHOD.

ENDCLASS.
