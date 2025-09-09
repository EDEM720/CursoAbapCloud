CLASS zcl_lab_04_person_ee18d DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
*crea dos métodos de instancia en la sección
*pública. El primer método establece el valor del atributo por el parámetro
*de entrada del método y el segundo método devuelve el atributo de la clase
*por el parámetro que exporta el método.
    METHODS: set_age IMPORTING iv_age TYPE i,
      get_age EXPORTING ev_age TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
*  con el atributo AGE de tipo número
*entero en la sección privada
    DATA age TYPE i.
ENDCLASS.



CLASS zcl_lab_04_person_ee18d IMPLEMENTATION.
  METHOD get_age.
    ev_age = me->age.
  ENDMETHOD.

  METHOD set_age.
    me->age = iv_age.
  ENDMETHOD.

ENDCLASS.
