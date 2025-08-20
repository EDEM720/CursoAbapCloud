CLASS zcl_performance_ee18 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_performance_ee18 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*"---------------------------------------------------------------------------------
*" Definición de un tipo de tabla interna con filas de /dmo/flight
*" Clave primaria NO única por (carrier_id, connection_id, flight_date)
*" → permitirá duplicados en esa combinación pero servirá para ordenar por defecto
*"---------------------------------------------------------------------------------
    TYPES lty_flights TYPE STANDARD TABLE OF /dmo/flight
                      WITH NON-UNIQUE KEY carrier_id connection_id flight_date.
*
*"---------------------------------------------------------------------------------
*" Declaración de la tabla interna que usaremos en los ejemplos de ordenación
*"---------------------------------------------------------------------------------
    DATA lt_flights TYPE lty_flights.                          " Itab de vuelos con la clave anterior
*
*"---------------------------------------------------------------------------------
*" Carga manual de datos de ejemplo usando constructor VALUE #( ... ).
*" Nota: muchos campos de /dmo/flight son DATS, NUMC o DEC → las comillas serán
*"       convertidas implícitamente (si prefieres, puedes usar CONV <tipo>( ... )).
*"       flight_date es DATS (YYYYMMDD), price suele ser DEC / CURR.
*"---------------------------------------------------------------------------------
    lt_flights = VALUE #(
      ( client         = sy-mandt                                " Mandante actual del sistema
        carrier_id     = 'CO'                                    " Compañía aérea
        connection_id  = '0500'                                  " Conexión (NUMC/char con ceros a la izquierda)
        flight_date    = '20250201'                              " Fecha de vuelo (YYYYMMDD)
        plane_type_id  = '123-456'                               " Tipo de avión (texto)
        price          = '1000'                                  " Precio (se convertirá a DEC/CURR si aplica)
        currency_code  = 'COP' )                                 " Moneda

      ( client         = sy-mandt
        carrier_id     = 'MX'
        connection_id  = '0600'
        flight_date    = '20250120'
        plane_type_id  = '747-400'
        price          = '800'
        currency_code  = 'MXN' )

      ( client         = sy-mandt
        carrier_id     = 'QF'
        connection_id  = '0006'
        flight_date    = '20230112'
        plane_type_id  = 'A380'
        price          = '1600'
        currency_code  = 'AUD' )

      ( client         = sy-mandt
        carrier_id     = 'SP'
        connection_id  = '0700'
        flight_date    = '20250610'
        plane_type_id  = '321-654'
        price          = '100'
        currency_code  = 'EUR' )

      ( client         = sy-mandt
        carrier_id     = 'LX'
        connection_id  = '0900'
        flight_date    = '20250101'
        plane_type_id  = '258-963'
        price          = '50'
        currency_code  = 'COP' )
    ).
*
*"---------------------------------------------------------------------------------
*" Mostrar la tabla ANTES de ordenar
*"---------------------------------------------------------------------------------
    out->write( |Before Sort| ).                                " Título/etiqueta
    out->write( lt_flights ).                                   " Contenido actual de la itab
*
*"=================================================================================
*" SORT con la clave primaria de la itab
*"=================================================================================
*SORT lt_flights.                                            " Ordena por la clave definida en lty_flights:
*                                                            " (carrier_id, connection_id, flight_date) ASC por defecto
*out->write( |Sort by primary key| ).                        " Título/etiqueta
*out->write( lt_flights ).                                   " Tabla ya ordenada por la clave
*
*"=================================================================================
*" SORT por cualquier campo (varios campos) – orden ascendente por defecto
*"=================================================================================
*SORT lt_flights BY currency_code plane_type_id.             " Ordena 1º por moneda, 2º por tipo de avión (ASC/ASC)
*out->write( |Sort by 2 fields| ).                           " Título/etiqueta
*out->write( lt_flights ).                                   " Resultado del orden múltiple
*
*"=================================================================================
*" SORT combinando ASCENDING y DESCENDING por distintos campos
*"=================================================================================
*SORT lt_flights BY carrier_id ASCENDING                     " 1º por compañía (A→Z)
*                   flight_date DESCENDING.                  " 2º por fecha (más reciente primero)
*out->write( |Sort by 2 fields (ASC/DESC)| ).                " Título/etiqueta
*out->write( lt_flights ).                                   " Tabla ordenada con criterios mixtos

    "Mejor manera de eliminar registros duplicados

    SORT lt_flights BY carrier_id connection_id.

    out->write( lt_flights ).

  ENDMETHOD.

ENDCLASS.
