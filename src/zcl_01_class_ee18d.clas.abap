CLASS zcl_01_class_ee18d DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor IMPORTING iv_nombre        TYPE zde_nombre_ee18
                                  iv_apellido      TYPE zde_nombre_ee18
                                  iv_telefono      TYPE zde_tele_der
                                  iv_certification TYPE i
                                  iv_experience    TYPE i.

    METHODS alta_empleado RETURNING VALUE(rv_sueldo) TYPE string.
    METHODS buscar_registros IMPORTING iv_id TYPE zid.

  PROTECTED SECTION.
  PRIVATE SECTION.



    METHODS get_id EXPORTING ev_id TYPE zid.
    METHODS calculate_salary.
    DATA ls_employe TYPE ztab_ej_objt_ee.
    DATA lt_employe TYPE ztab_ej_objt_ee.
    DATA: certification TYPE i,
          experience    TYPE i,
          reg           TYPE i.
    CONSTANTS cv_currency TYPE waers VALUE 'EUR'.






ENDCLASS.



CLASS zcl_01_class_ee18d IMPLEMENTATION.
  METHOD get_id.
    SELECT MAX( id_employed )
    FROM ztab_ej_objt_ee
    INTO @DATA(lv_id).

    IF sy-subrc = 0.
      me->ls_employe-id_employed = lv_id + 1.
    ELSE.
      me->ls_employe-id_employed = lv_id.
    ENDIF.

  ENDMETHOD.

  METHOD calculate_salary.
    me->ls_employe-sueldo = ( 50 * ( me->certification + me->experience ) ) + me->ls_employe-sueldo  .
  ENDMETHOD.

  METHOD constructor.
    me->ls_employe-nombre = iv_nombre.
    me->ls_employe-apellido = iv_apellido.
    me->ls_employe-telefono = iv_telefono.
    me->certification = iv_certification.
    me->experience = iv_experience.
    me->ls_employe-currency_code = cv_currency.
  ENDMETHOD.

  METHOD alta_empleado.
    me->calculate_salary( ).
    me->get_id(  ).

    MODIFY ztab_ej_objt_ee FROM @ls_employe.

    IF sy-subrc = 0.
      COMMIT WORK.
      rv_sueldo = |Subida Correcta|.
    ELSE.
      rv_sueldo = |Subida Incorrecta|.
    ENDIF.
  ENDMETHOD.



  METHOD buscar_registros.

    FIELD-SYMBOLS <fs_empleado> TYPE ztab_ej_objt_ee.

    SELECT * FROM ztab_ej_objt_ee
    INTO TABLE @DATA(lt_empleados).

    LOOP AT lt_empleados ASSIGNING <fs_empleado>.
      """""""""""""""""""""" BUSCAR REGISTROS POR ID """""""""""""""""
      IF iv_id IS NOT INITIAL AND <fs_empleado>-id_employed EQ iv_id.
        CONTINUE.
      ENDIF.

      IF <fs_empleado>-currency_code IS INITIAL.
        <fs_empleado>-currency_code = cv_currency.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
