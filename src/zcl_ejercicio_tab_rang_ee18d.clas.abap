CLASS zcl_ejercicio_tab_rang_ee18d DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ejercicio_tab_rang_ee18d IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
*Crea un programa que muestre solo los vuelos cuya fecha (flight_date) esté dentro de un rango de fechas específico, usando tablas de rangos.
*Pasos que debe cumplir:
*Declarar una tabla de rangos para flight_date.
    DATA lt_flight_date TYPE TABLE OF /dmo/flight.
*Añadir dos condiciones al rango:
    DATA lr_flight_date TYPE RANGE OF /dmo/flight_date.
*Fechas entre '2024-01-01' y '2024-12-31'.
    "Ponemos la condicion de las fechas

    APPEND VALUE #( sign = 'I' option = 'BT' low = '20250101' high = '20251231' ) TO lr_flight_date.

*Excluir la fecha '2024-06-01'.

    APPEND VALUE #( sign = 'E' option = 'EQ' low = '20250601' ) TO lr_flight_date.

*Usar la tabla de rangos en un SELECT sobre /dmo/flight.
*Mostrar el carrier_id, connection_id y flight_date de los vuelos que cumplan.
    SELECT *
    FROM /dmo/flight
    WHERE flight_date IN @lr_flight_date
    INTO TABLE @lt_flight_date.

    LOOP AT lt_flight_date INTO DATA(ls_flight).
      out->write( |Carrier: { ls_flight-carrier_id }  Conn: { ls_flight-connection_id }  Fecha: { ls_flight-flight_date }| ).
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
