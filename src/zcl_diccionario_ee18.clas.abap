CLASS zcl_diccionario_ee18 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_diccionario_ee18 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

DATA lv_nombre TYPE zde_nombre_ee18.

DATA ls_empleado TYPE zst_empleado_ee18.

lv_nombre = 'Daniel'.

ls_empleado-nombre = lv_nombre.

out->write( ls_empleado ).
out->write( ls_empleado-nombre ).
  ENDMETHOD.

ENDCLASS.
