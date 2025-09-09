*CLASS zcl_clase_creadora_ee18d DEFINITION
*  PUBLIC
*  FINAL
*  CREATE PUBLIC .
*
*  PUBLIC SECTION.
*  PROTECTED SECTION.
*  PRIVATE SECTION.
*ENDCLASS.
*
*
*
*CLASS zcl_clase_creadora_ee18d IMPLEMENTATION.
*ENDCLASS.
CLASS zcl_clase_creadora_ee18d DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  "Definiciones:
  "Instancia: Objeto creado a partir de una clase

  "Atributos de dependencia de instacia y los estaticos :

  "Atributos de dependencia de instancia-> Depende de la instancia de la clase, el contenido es especifico para
  "cada objeto. Se declaran usando la sentencia data

  "resumen - "" son variables que pertenecen a cada objeto, no a la clase. Cada instancia tiene su propia copia

  "Atributos estaticos->  El contenido de los atributos estaticos definen el estado de la clase y es valido para todas las instancias de la clase,
*            se declaran usando class-data.  Son accesible desde todo el entorno de ejecucion de la clase. Todos los objetos de una clase pueden acceder a sus atributos estaticos.
*            Si se cambia un atributo estatico en un objeto, el cambio es visible en todos los demas objetos de la clase.
*
*            resumen- Variables de la clase, NO del objeto. Hay una sola copia por clase en la sesion. todas las instancias lo comparten


  " Metodos estaticos o de instancia
  "los metodos estaticos-> No dependen de la instancia
  "los metodos de instancia-> Dependen de cada instancia que se va a realizar en el contenxto de la memoria de ejecucion

  "  los metodos de instancia ->
  "  los metodos estaticos  =>

  "estatico NO tiene acceso a la instancia
  "instancia tiene acceso al estatico

  " Todos los atributos y metodos son publicos y accesibles
  PUBLIC SECTION.

    CLASS-DATA currency TYPE c LENGTH 3.                                           "Atributo estatico (se ha declarado con el Class-data)
    DATA region TYPE string.                                                       "Atributo de instancia



    METHODS set_client                                                             "Declaracion de metodo/funcion de instancia

      IMPORTING iv_client   TYPE string                                            "Parametros de entrada
                iv_location TYPE string

      EXPORTING ev_status   TYPE string                                            "Parametros de salida

      CHANGING  cv_process  TYPE string.                                           "Parametros de cambio


    METHODS get_client                                                             "Declaracion de metodo/funcion de instancia

      EXPORTING ev_client TYPE string.


    CLASS-METHODS:                                                                 "Declaracion de metodo/funcion de estatica
      set_cntr_type IMPORTING iv_cntr_type TYPE string,
      get_cntr_type EXPORTING ev_cntr_type TYPE string.


    METHODS get_client_name IMPORTING iv_client_id TYPE string RETURNING VALUE(rv_client_name) TYPE string.

************************* end public section **************
  PROTECTED SECTION.                                                               "Es solo accesible para esta clase y las clases hijas

    DATA creation_date TYPE sydate.                                                "Atributo instancia ( se ha creado con el DATA )


  PRIVATE SECTION.                                                                 "Es accesible solo para esta clase y as clases "friends"

    DATA client TYPE string.                                                       "Atributo instancia ( se ha creado con el DATA )
    CLASS-DATA cntr_type TYPE string.                                              "Atributo estatico ( se ha creado con el DATA )

ENDCLASS.



CLASS zcl_clase_creadora_ee18d IMPLEMENTATION.



  METHOD set_client.                                                               "Desarrollo de la logica de la funcion/metodo set_cliente
    client = iv_client.
    ev_status = 'Ok'.
    cv_process = 'Started'.

  ENDMETHOD.

  METHOD get_client.                                                               "Desarrollo de la logica de la funcion/metodo get_cliente
    ev_client = client.

  ENDMETHOD.

  METHOD get_cntr_type.                                                            "Desarrollo de la logica de la funcion/metodo get_cntr_type
    ev_cntr_type = cntr_type.

  ENDMETHOD.

  METHOD set_cntr_type.
    cntr_type = iv_cntr_type.                                                      "Desarrollo de la logica de la funcion/metodo set_cntr_type

  ENDMETHOD.

  METHOD get_client_name.
    CASE iv_client_id.
      WHEN '01'.
        rv_client_name = 'Client name: Daniel'.
      WHEN '02'.
      rv_client_name = 'Client name: Pedro'.
    ENDCASE.
  ENDMETHOD.

ENDCLASS.
