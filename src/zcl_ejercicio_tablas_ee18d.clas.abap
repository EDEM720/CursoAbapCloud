CLASS zcl_ejercicio_tablas_ee18d DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ejercicio_tablas_ee18d IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA lt_vuelo TYPE STANDARD TABLE OF /dmo/flight.
*eje 1 Crea una tabla interna con los datos de 15 vuelos simulados. Cada vuelo tendrá:
    TYPES: BEGIN OF ty_simulated_flight,
*       Un ID de usuario (iduser)
             iduser     TYPE /dmo/customer_id,
*Un código de aerolínea (aircode)
             aircode    TYPE /dmo/carrier_id,
*Un número de vuelo (flightnum)
             flightnum  TYPE /dmo/connection_id,
*Una clave de país (key)
             key        TYPE land1,
*Número de asientos ocupados (seat)
             seat       TYPE /dmo/plane_seats_occupied,
*Fecha del vuelo (flightdate)
             flightdate TYPE /dmo/flight_date,
           END OF ty_simulated_flight.


*Utiliza una expresión FOR con UNTIL para crear los datos dinámicamente.

    DATA: lt_simulated_flights TYPE TABLE OF ty_simulated_flight.
    " GENERAMOS 15 VUELOS CON DATOS FICTICIOS USANDO FOR ..... UNTIL
    lt_simulated_flights = VALUE #( FOR i = 1 UNTIL i > 15  "Condicion para el bucle (  )
        ( iduser = |{ 123 + i } - USER |
        aircode = 'LH'
        flightnum  = |04{ i WIDTH = 2 PAD = '0' }|
        key = 'US'
        seat = 10 + i
        flightdate = cl_abap_context_info=>get_system_date(  ) + 1 ) ).
*    SELECT FROM /dmo/flight
*            FIELDS *
*            INTO TABLE @DATA(lt_simulated_flights)
*            UP TO 15 ROWS.
*
    out->write( data = lt_simulated_flights name = 'Mi tabla de vuelos simulados' ).
    out->write( |\n| ).

*  Eje 2 Con la tabla de vuelos del ejercicio anterior, elimina todos los vuelos cuyo número de vuelo sea menor que '0405'.

    " Eliminar todos los registros con flightnum < 405
*    DELETE lt_simulated_flights WHERE flightnum < '0405'.
    LOOP AT lt_simulated_flights INTO DATA(ls_simulated_flight)." where flightnum < 405.
      IF ls_simulated_flight-flightnum < 405.
        DELETE lt_simulated_flights FROM ls_simulated_flight.
      ENDIF.
    ENDLOOP.
    out->write( data = lt_simulated_flights name = 'Despues del borrado' ).
    out->write( |\n| ).

*eje 3 *Actualiza la tabla interna lt_flights para:
    " Paso 2: Recorrer y aplicar condiciones lógicas
    LOOP AT lt_simulated_flights INTO DATA(ls_flight).
*Cambiar la aircode a 'UPD' si seat es mayor a 20.
      IF ls_flight-seat > 20.
        ls_flight-aircode = 'UPD'.
*Cambiar el flightdate al día actual para esos mismos vuelos.
        ls_flight-flightdate = cl_abap_context_info=>get_system_date(  ).
        MODIFY lt_simulated_flights FROM ls_flight TRANSPORTING aircode flightdate.
      ENDIF.

    ENDLOOP.
    out->write( data = lt_simulated_flights name = `Despues / Modify` ).

  ENDMETHOD.

ENDCLASS.
