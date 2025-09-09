CLASS zcl_lab_01_ejec_ee18d DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
*    la clase de ejecución para declarar una estructura global referenciada al tipo
*de datos definido en la clase. En la misma clase ZCL_LAB_06_ELEMENTS
*crea el método SET_OBJECT que actualiza el atributo MS_OBJECT que está
*referenciado al tipo definido y realiza una llamada al método desde la
*misma clase de ejecución para mostrar el contenido de la estructura
*MS_OBJECT a través de la referencia de la clase en la consola.



  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_01_ejec_ee18d IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
*Declara una referencia de esta
*clase en el método MAIN de la clase creada en la primera actividad (desde
*aquí en adelante clase de ejecución) e instancia el objeto. Llama al primer
*método con tu edad en el parámetro y muestra por pantalla el valor del
*atributo utilizando el segundo método.

    DATA(lo_person) = NEW zcl_lab_04_person_ee18d( ).

    lo_person->set_age( iv_age = '14' ).

    lo_person->get_age(
      IMPORTING
        ev_age = DATA(lv_age)
    ).

    out->write( lv_age ).

*6. Métodos funcionales
*Crea la clase ZCL_LAB_05_FLIGHT con un método funcional que devuelve
*VERDAD (X) o FALSO (space) en cuanto le pasemos el código de la compañía
*aérea y un número de conexión de vuelo. La comprobación se debe hacer
*con la tabla de base de datos /DMO/FLIGHT.
*Instancia e invoca el método funcional desde la clase de ejecución.

    DATA(lo_flight) = NEW zcl_lab_05_flight_ee18d(  ).

    lo_flight->check_fligth(
      EXPORTING
        iv_carrier_id    = 'SV'
        iv_connection_id = '0012'
      RECEIVING
        rv_result        = DATA(lv_bool)
    ).
    IF lv_bool = 'X'.
      out->write( 'Se ha encontrado es verdadero' ).
    ELSE.
      out->write( 'No se ha encontrado es falso ' ).
    ENDIF.

    DATA(go_element) = NEW zcl_lab_06_elements_ee18d(  ).
    DATA gs_object TYPE zcl_lab_06_elements_ee18d=>ty_elem_objects.
    gs_object-class = 'ABAP Cloud'.
    gs_object-instance = 'INTANCES 123'.
    gs_object-reference = 'GO ELEMENT'.

    go_element->set_object( is_object = gs_object ).

    out->write( gs_object ).

    DATA(lo_country) = zcl_lab_06_elements_ee18d=>lc_country.
    DATA(lo_name) = zcl_lab_06_elements_ee18d=>lc_name.
    DATA(lo_last_name) = zcl_lab_06_elements_ee18d=>lc_last_name.
    DATA(lo_date) = zcl_lab_06_elements_ee18d=>lc_date.

    out->write( | constante 1: { lo_country } , constante 2: { lo_name } , constante 3: { lo_last_name } contsnate 4: { lo_date } | ).

  ENDMETHOD.

ENDCLASS.
