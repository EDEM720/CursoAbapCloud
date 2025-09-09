CLASS zcl_lab_06_elements_ee18d DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
*  7. Utilizar tipos de datos en clases
*Crea la clase ZCL_LAB_06_ELEMENTS y declara la estructura de datos
*TY_ELEM_OBJECTS con tres componentes: CLASS, INSTANCE y REFERENCE
    TYPES: BEGIN OF ty_elem_objects,
             class     TYPE string,
             instance  TYPE string,
             reference TYPE string,
           END OF ty_elem_objects, tty_elem_objects TYPE TABLE OF ty_elem_objects.

    DATA ms_object TYPE ty_elem_objects.
*  En la misma clase ZCL_LAB_06_ELEMENTS
*crea el método SET_OBJECT que actualiza el atributo MS_OBJECT que está
*referenciado al tipo definido y realiza una llamada al método desde la
*misma clase de ejecución
    METHODS set_object IMPORTING is_object TYPE ty_elem_objects.
*Constantes en clases
*Crea cuatro constantes en la clase definida en la anterior actividad y escribe
    CONSTANTS: lc_country   TYPE string VALUE 'jola',
               lc_name      TYPE string VALUE 'Pedro',
               lc_last_name TYPE string VALUE 'Perdono',
               lc_date      TYPE d VALUE '20250908'.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_06_elements_ee18d IMPLEMENTATION.
  METHOD set_object.
    me->ms_object = is_object.
  ENDMETHOD.

ENDCLASS.
