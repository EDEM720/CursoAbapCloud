CLASS zcl_lab_02_product_ee18d DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
*  dos métodos llamados SET_PRODUCT y SET_CREATIONDATE en la
*encapsulación pública. Cada método debe tener un parámetro de entrada
*que actualiza los atributos PRODUCT y CCREATION_DATE.

METHODS: set_product IMPORTING iv_product TYPE matnr,
set_creationdate IMPORTING iv_creation_date TYPE zde_date_pwc.

  PROTECTED SECTION.
  PRIVATE SECTION.
*  con dos atributos de instancia en la encapsulación
*privada llamados:
*- PRODUCT de tipo MATNR
*- CREATION_DATE de tipo ZDATE
data: product TYPE matnr,
      creation_date TYPE zde_date_pwc.

ENDCLASS.



CLASS zcl_lab_02_product_ee18d IMPLEMENTATION.
  METHOD set_creationdate.
me->creation_date = iv_creation_date.
  ENDMETHOD.

  METHOD set_product.
me->product = iv_product.
  ENDMETHOD.

ENDCLASS.
