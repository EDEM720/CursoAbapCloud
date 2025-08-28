CLASS zcl_textos_ee18d DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    CONSTANTS: gc_msg_bievenido TYPE string VALUE 'Bienvenido',
               gc_msg_error     TYPE string   VALUE 'Ha introducido datos incorrectos',
               gc_msg_user      TYPE string VALUE 'El usuario introducido'.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_textos_ee18d IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    "estructura plana
    "Subestructura (plana)
    TYPES : BEGIN OF ty_addr,

              steet TYPE c LENGTH 30,
              city  TYPE c LENGTH 20,
            END OF ty_addr.
*
*    "estructura ANIDADA: contiene ty_addr como un campo
*
*    TYPES: BEGIN OF ty_employee_nested,
*
*           id type i,
*           name type c LENGTH 20,
*           addr type ty_addr, " subestructura anidada  seria igual que decir prueba : include zst_empleados_der.
*        end of ty_employee_nested.
*
*
*data ls_prueba type ty_employee_nested.
* out->write( ls_prueba ).
*


    " estructura profunda
    " producto simple para la tabla interna
    TYPES: BEGIN OF ty_order_item,
             producto TYPE c LENGTH 10,
             camion   TYPE  i,
           END OF ty_order_item.

    "estructura profunda: tiene tipos dinamicos (string, tablas, referencias)


    TYPES: BEGIN OF ty_customer_deep,
             id      TYPE i,
             name    TYPE string,  " profunda
             addr    TYPE ty_addr, " anidada ( plana )
             orders  TYPE STANDARD TABLE OF ty_order_item WITH EMPTY KEY, "profunda ( tabala interna )
             refaddr TYPE REF TO ty_addr, " profunda ( esta haciendo una referencia)

           END OF ty_customer_deep.

    TYPES: BEGIN OF ty_prueba,
             id        TYPE ty_customer_deep-id,
             nombre    TYPE zde_nombre_ee18,
             addr      TYPE ty_addr,
             employeed TYPE zst_empleado_ee18,
             staff     TYPE zst_estructuranidada_ee18d,
             flight_num TYPE /dmo/flight-connection_id,

           END OF ty_prueba.

    DATA ls_cust TYPE ty_customer_deep.

    FREE ls_cust-orders .

    DATA ls_prueba TYPE ty_prueba.

    FREE ls_prueba.

    out->write( ls_prueba ).


  ENDMETHOD.

ENDCLASS.
