CLASS zcl_tablas_ee18d DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_tablas_ee18d IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
*    TYPES: BEGIN OF ty_persona,
*             nombre TYPE string,
*             edad   TYPE i,
*           END OF ty_persona.
*

    "AÑADIR REGISTROS CON EL INSERT

*   TYPES: ty_tabla_personas TYPE STANDARD TABLE OF ty_persona WITH EMPTY KEY.
*
*    DATA: lt_personas TYPE ty_tabla_personas,
*          ls_persona  TYPE ty_persona.
*
*
*    ls_persona-nombre = 'Carlos'.
*    ls_persona-edad = 40.
*
*    INSERT ls_persona INTO lt_personas INDEX 1.
*
*    ls_persona-nombre = 'Maria'.
*    ls_persona-edad = 30.
*
*    INSERT ls_persona INTO lt_personas INDEX 2.
*
*    ls_persona-nombre = 'Pedro'.
*    ls_persona-edad = 31.
*
*    INSERT ls_persona INTO lt_personas INDEX 3.
*
*    ls_persona-nombre = 'Juan'.
*    ls_persona-edad = 11.
*
*   INSERT ls_persona INTO lt_personas INDEX 2. " mismo index para forzar su posicion
*
* out->write( lt_personas ).
*
*    LOOP AT lt_personas INTO ls_persona.
*
*     " out->write( |edad { ls_persona-edad } nombre { ls_persona-nombre } | ).
*
*    ENDLOOP.
*
    "insert value

    DATA lt_aeropuerto TYPE STANDARD TABLE OF /dmo/airport.

    INSERT VALUE #(
        client  = 100
        airport_id = 'FRA'
        name = 'Frankfurt Airport'
        city = 'Frankfurt/Main'
        country = 'DE'
      ) INTO TABLE lt_aeropuerto.
    INSERT VALUE #(
            client  = 100
            airport_id = 'FRA'
            name = 'Frankfurt Airport'
            city = 'Frankfurt/Main'
            country = 'PP'
          ) INTO TABLE lt_aeropuerto.

    """"""""""""""


    INSERT VALUE #(
          client  = 100
          airport_id = 'FRA'
          name = 'Frankfurt Airport'
          city = 'Frankfurt/Main'
          country = 'EE'
        ) INTO  lt_aeropuerto INDEX 2.  " con esta formula podemos indicar la posicion donde quermos que se introduzca la nueva fila


    "out->write( lt_aeropuerto ).

    " para crear un registro con una linea en blanco
    "insert initial line into table lt_aeropuerto .

    " Para igualar dos tablas internas usamos el like
    "DATA lt_aeropuerto2 like lt_aeropuerto.

    "duplicar el contenido

    "insert lines of lt_aeropuerto into table lt_aeropuerto2.  "Duplica todo el contenido de la tabla original

    "insert lines of lt_aeropuerto to 2 into table lt_aeropuerto2." Copia el contenido de las lineas de la tabla original hasta la linea 2

    "insert lines of lt_aeropuerto from 2 to 3 into table lt_aeropuerto2."Copia el contenido de las lineas de la tabla original desde la linea inicial que se le indica hasta la linea final

    "AÑADIR REGISTROS CON EL APPEND
    "Añade un registro al final de la tabla interna, solo se usa en las standard. hace los mismo que los inserte, mejor usar los insert.

*    TYPES: BEGIN OF ty_persona,
*             nombre TYPE string,
*             edad   TYPE i,
*           END OF ty_persona.
*
*  TYPES: ty_tabla_personas TYPE STANDARD TABLE OF ty_persona WITH EMPTY KEY.
**
*    DATA: lt_personas TYPE ty_tabla_personas,
*          ls_persona  TYPE ty_persona.
**
*
*
*    ls_persona-nombre = 'Daniel'.
*    ls_persona-edad  = '23'.
*
*
*
*    APPEND ls_persona TO lt_personas.
*
*    out->write( lt_personas ).

    """ declaracion lineal del append

*    TYPES: BEGIN OF ty_persona,
*             nombre TYPE string,
*             edad   TYPE i,
*           END OF ty_persona.
*
* TYPES: ty_tabla_personas TYPE STANDARD TABLE OF ty_persona WITH EMPTY KEY.
*
*    DATA: lt_personas TYPE ty_tabla_personas.
*
*APPEND VALUE #(
*
*        nombre = 'Daniel'
*        edad   = 15
*
* ) to lt_personas.

    """"""
    "copiar contenido de unta tabla a otra

*Append lines of lt_personas into table lt_personas2.
*
*APPEND lines of lt_personas to 1 into table lt_personas2.


    "AÑADIR REGISTROS CON EL VALUE

*    TYPES: BEGIN OF ty_persona,
*             nombre TYPE string,
*             edad   TYPE i,
*           END OF ty_persona.
*
*    TYPES: ty_tabla_personas TYPE STANDARD TABLE OF ty_persona WITH EMPTY KEY.
*
*
*    DATA(lt_persona) = VALUE ty_tabla_personas(
*    ( nombre = 'Ana' edad = 25 )
*    ( nombre = 'Javier' edad = 45 )
*    ( nombre = 'Lucia' edad = 22 )
*
*
*    ).
*
*    out->write( lt_persona ).
*
*    DATA ls_persona TYPE ty_persona.
*
*    LOOP AT lt_persona INTO ls_persona.
*
*      out->write( |Nombre: { ls_persona-nombre }, Edad: { ls_persona-edad }| ).
*
*    ENDLOOP.

    "extraemos todo de la base de datos / la tabla externa
*data lt_aeropuerto type STANDARD TABLE OF /dmo/airport.
*
*lt_aeropuerto = value #(
*
*        (
*        client = 100
*        airport_id = 'FRA'
*        name = 'Frankfurt Airport'
*        city = 'Frankfurt/Main'
*        country = 'DE'
*        )
*
*                (
*        client = 100
*        airport_id = 'RRA'
*        name = 'Frankfurt Airport'
*        city = 'Frankfurt/Main'
*        country = 'RE'
*        )
*).
*
*out->write( lt_aeropuerto ).

******************** READ TABLE CON INDICE

*   SELECT FROM /dmo/airport
*    FIELDS *
*    WHERE country = 'DE'
*    INTO TABLE @DATA(lt_flights).
*
*    out->write( lt_flights ).
*************************************
***************** FOR ***************

*    TYPES: BEGIN OF ty_flights,
*             iduser     TYPE /dmo/customer_id,
*             aircode    TYPE /dmo/carrier_id,
*             flightnum  TYPE /dmo/connection_id,
*             key        TYPE land1,
*             seat       TYPE /dmo/plane_seats_occupied,
*             flightdate TYPE /dmo/flight_date,
*           END OF ty_flights.
*
*    DATA: lt_flights_info TYPE TABLE OF ty_flights,
*          lt_my_flights   TYPE TABLE OF ty_flights.
**   lt_my_flights = VALUE#( for i = 1 while i <= 20 ). " Otra forma de hacer el bucle
*    lt_my_flights = VALUE #( FOR i = 1 UNTIL i > 30 " Condicion para el bucle (  )
*    ( iduser = |{ 123456 + i } - USER |
*    aircode = 'LH'
*    flightnum = 00001 + i
*    key = 'US'
*    seat = 0 + i
*    flightdate = cl_abap_context_info=>get_system_date(  ) + 1 ) ).

*    out->write( data = lt_my_flights name = 'lt_flights' ).
********************************************** FOR ANIDADO
    TYPES: BEGIN OF ty_flights,
             aircode     TYPE /dmo/carrier_id,
             flightnum   TYPE /dmo/connection_id,
             flightdate  TYPE /dmo/flight_date,
             flightprice TYPE /dmo/flight_price,
             currency    TYPE /dmo/currency_code,
           END OF ty_flights.

    "Creamos la primera tabla lt_flights_type, que extrae los datos de la tabla dmo/flight
    SELECT FROM /dmo/flight
         FIELDS *
         INTO TABLE @DATA(lt_flights_type).

*    "Creamos la primera tabla lt_airline, que extrae los datos de la tabla dmo/booking_m
*    SELECT FROM /dmo/booking_m
*       FIELDS carrier_id, connection_id , flight_price, currency_code
*       INTO TABLE @DATA(lt_airline)
*       UP TO 20 ROWS.
*    "creamos la tercera tabla de tipo SORTED, que a diferencia de la ESTANDAR se le indica que hereda los campos de las tabla anteriores creada
*    " y tiene una key no unica que hace referencia al flighrprice que hemos declarado antes
*    DATA lt_final TYPE SORTED TABLE OF ty_flights WITH NON-UNIQUE KEY flightprice.
*
*    "Ahora contnuamos el proceso de creacion con los filtros que se le haran en el for anidado
*    lt_final = VALUE #(
* " Primer Bucle For: recorre la tabla lt_flights_type filtrando solo los vuelos por el  carrier_id = 'AA'
*    FOR ls_flight_type IN lt_flights_type WHERE ( carrier_id = 'AA' ) "Se crean los filtros y se declara automaticamente la estructura ls_*
*" Segundo Bucle For: recorre la tabla lt_airline filtrando la tabla por los vuelos que coincidan con carrier = id
*    FOR ls_airline IN lt_airline WHERE (  carrier_id = ls_flight_type-carrier_id ) "Se crean los filtros y se declara automaticamente la estructura ls_*
*
*
*                         ( aircode     = ls_flight_type-carrier_id
*                           flightnum   = ls_flight_type-connection_id
*                           flightdate  = ls_flight_type-flight_date
*                           flightprice = ls_airline-flight_price
*                           currency    = ls_airline-currency_code )  ).
*
*
*
*    out->write( data = lt_flights_type name = `lt_flights_type` ).
*    out->write( |\n| ).
*    out->write( data = lt_airline name = `lt_airline` ).
*    out->write( |\n| ).
*    out->write( data = lt_final name = `tabla generada con las dos anteriores` ).

******************* SELECT NORMAL ********************
    "select "normal"

    SELECT FROM /dmo/flight
          FIELDS *
          WHERE carrier_id = 'LH'
         INTO TABLE @DATA(lt_flights).


    "select a una tabla interna (no aconsejado hacer )
    SELECT carrier_id, connection_id, flight_date
    FROM @lt_flights AS lt
    INTO TABLE @DATA(lt_flights_copy).

*    out->write( data = lt_flights name = `lt_flights` ).
*    out->write( data = lt_flights_copy name = `lt_flights_copy` ).

****************************** SENTENCIA SORT   ************************
    "sentencia SORT
    "ordenar tablas ( no tiene sentido para las tablas de tipo shorted) si para las estandar y las hash

*    out->write( data = lt_flights_copy name = `lt_flights_copy` ).
*    SORT lt_flights_copy BY flight_date DESCENDING connection_id ASCENDING.
*    out->write( data = lt_flights_copy name = `lt_flights_copy ordenado` ).

************************ MODIFICAR REGISTRSO *****************************

************************ FORMA ANTIGUA ************************
*    out->write( data = lt_flights name = 'ANTES/ lt_flights' ).
*
*    LOOP AT lt_flights INTO DATA(ls_flights).
*      ls_flights-flight_date = cl_abap_context_info=>get_system_date(  ).
*      MODIFY lt_flights FROM ls_flights INDEX 2.
*
*    ENDLOOP.
*    out->write( data = lt_flights name = 'DESPUES/ lt_flights' ).

******************** FORMA MODERNA ****************************
*    out->write( data = lt_flights name = 'ANTES/ lt_flights' ).
*
*    LOOP AT lt_flights INTO DATA(ls_flights).
*
*      IF ls_flights-connection_id = 400.
*        ls_flights-connection_id = 1400.
*        MODIFY lt_flights FROM ls_flights TRANSPORTING connection_id.
*      ENDIF.
*
*
*    ENDLOOP.
*    out->write( data = lt_flights name = 'DESPUES/ lt_flights' ).

******************** FORMA MODERNA MAS UTILIZADA ****************************
******************** UTILIZAR SIEMPRE ************************************
    out->write( data = lt_flights name = 'ANTES/ lt_flights' ).

    LOOP AT lt_flights INTO DATA(ls_flights).

      IF ls_flights-connection_id > 0400.
        "ls_flights-connection_id = 1400.
        MODIFY lt_flights FROM VALUE #( connection_id = '4000'
                                        carrier_id = 'XX'
                                        plane_type_id = 'yy'
                                        ) TRANSPORTING connection_id plane_type_id carrier_id.
      ENDIF.

    ENDLOOP.
    out->write( data = lt_flights name = 'DESPUES/ lt_flights' ).

" ES NECESARIO AHCER
  ENDMETHOD.

ENDCLASS.
