CLASS zcl_obj_block_ee18d DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_obj_block_ee18d IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    out->write( 'El usuario ha empezado el programa' ). " AÑADIDA

    TRY.

        DATA(lo_lock_object) = cl_abap_lock_object_factory=>get_instance( EXPORTING iv_name = 'EZ_BLOK_DER' ).
      CATCH cx_abap_lock_failure.
        out->write( 'El objeto no se ha creado' ).
        RETURN. " AÑADIDA
    ENDTRY.

    DATA lt_parameter TYPE if_abap_lock_object=>tt_parameter.
    lt_parameter = VALUE #( (   name = 'ID'
                               value = REF #( '00000001' ) )
                                ).

    WHILE sy-subrc = 0.
      TRY. " AÑADIDA
          lo_lock_object->enqueue(
*               it_table_mode =
           it_parameter  =  lt_parameter
*               _scope        =
*               _wait         =
          ).

        CATCH cx_abap_foreign_lock  cx_abap_lock_failure.

          out->write( 'El objeto ya esta siendo tratado por otro usuario ' ).
          RETURN. " AÑADIDA
      ENDTRY.

    ENDWHILE.

    out->write( 'El objeto ya esta disponible' ).

    "--------------- segunda parte , "intento" crear una nueva fila----------------------------

    DATA ls_new_registro TYPE ztab_eje1_der.

    ls_new_registro  =  VALUE #(
                                  mandt         = '100'
                                  id            = '00000006'
                                  first_name    = 'Daniel'
                                  last_name     = 'RUIZ'
                                  email         = 'lauram@example.com'
                                  phone_number  = '38512369'
                                  salary        = '2000.30'
                                  currency_code = 'EUR' ).

*    WAIT UP TO 20 SECONDS.

    MODIFY ztab_eje1_der FROM @ls_new_registro.

    "---------------- tercera parte, liberación del objeto.---------------------------------------

    IF sy-subrc = 0.
      out->write( 'El la base de datos ha sido actualizado ' ).
    ENDIF.

    TRY.
        lo_lock_object->dequeue( it_parameter = lt_parameter ).
      CATCH cx_abap_lock_failure.
        out->write( 'El objeto no ha sido liberado' ).
    ENDTRY.
    out->write( 'El objeto ha sido liberado' ).


**  ********************** Primera parte del bloqueo *****
*out->write( 'el usuario a empezado el programa' ).
*    TRY.
*
*        DATA(lo_lock_objet) = cl_abap_lock_object_factory=>get_instance( EXPORTING iv_name = 'EZ_BLOC_EE18D' ).
*      CATCH cx_abap_lock_failure.
*
*    ENDTRY.
*
*        DATA lt_parameter TYPE if_abap_lock_object=>tt_parameter.
*        lt_parameter = VALUE #( ( name = 'ID'
*                                value = REF #( '001' ) ) ).
*
* TRY.
*        lo_lock_objet->enqueue(
**       it_table_mode =
*         it_parameter  = lt_parameter
**       _scope        =
**       _wait         =
*        ).
*      CATCH cx_abap_foreign_lock.
*        out->write( 'foreing lock exception' ).
*      CATCH cx_abap_lock_failure.
*     out->write( 'el objeto ya esta siendo tratado por el usuario' ).
*    endtry.
*        out->write( 'el objeto esta disponible' ).
*
**     ************************* SEGUNDA PARTE CREAR UNA FILA*****
*        DATA ls_new_registro TYPE ztab_db_ee18d.
*
*        ls_new_registro = VALUE #(
*                 mandt         = '100'
*                 id            = '006'
*                 first_name    = 'Daniel'
*                 last_name     = 'peral'
*                 email         = 'danielpm@example.com'
*                 phone_number  = '38512369'
*                 salary        = '2000.30'
*                 currency_code = 'EUR' ).
*
*        MODIFY ztab_db_ee18d FROM @ls_new_registro.
** ****************************** TERCERA PARTE DE LAS EXCEPCIONES
*        IF sy-subrc = 0.
*          out->write( 'la base de datos ha sido actualizada' ).
*        ENDIF.
*        TRY.
*            lo_lock_objet->dequeue( it_parameter = lt_parameter ).
*          CATCH cx_abap_lock_failure.
*            out->write( 'el objeto ya esta siendo tratado por el usuario' ).
*        ENDTRY.
*        out->write( 'el objeto ha sido liberado' ).
  ENDMETHOD.

ENDCLASS.
