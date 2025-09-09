CLASS zcl_lab_03_contract_ee18d DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
*  Sección pública
*Atributo: CNTR_TYPE – de tipo carácter de dos posiciones.Método: SET_CREATION_DATE. Utiliza un parámetro IMPORTING
*(IV_CREATION_DATE) para establecer el valor del atributo
*CREATION_DATE.
    DATA cntr_type TYPE c LENGTH 2.
    METHODS set_creation_date IMPORTING iv_creation_date TYPE zde_date_pwc.

  PROTECTED SECTION.
*  2. Sección protegida
*Atributo: CREATION_DATE de tipo ZDATE.
    DATA creation_date TYPE zde_date_pwc.
  PRIVATE SECTION.
*  3. Sección privada
*Atributo: CLIENT de tipo cadena de caracteres dinámica STRING.
    DATA client TYPE string.

ENDCLASS.



CLASS zcl_lab_03_contract_ee18d IMPLEMENTATION.

  METHOD set_creation_date.
    me->creation_date = iv_creation_date.
  ENDMETHOD.

ENDCLASS.
