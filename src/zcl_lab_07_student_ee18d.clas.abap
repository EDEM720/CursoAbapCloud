CLASS zcl_lab_07_student_ee18d DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA birth_date TYPE zde_date_pwc READ-ONLY.


    METHODS set_birth_date IMPORTING iv_birth_date TYPE zde_date_pwc.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_07_student_ee18d IMPLEMENTATION.
  METHOD set_birth_date.
    me->birth_date = iv_birth_date.
  ENDMETHOD.

ENDCLASS.
