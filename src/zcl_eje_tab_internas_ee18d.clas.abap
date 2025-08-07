CLASS zcl_eje_tab_internas_ee18d DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_eje_tab_internas_ee18d IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
*Una biblioteca quiere guardar información sobre los libros que tiene. Para ello, crea un programa que:
*Defina un tipo de estructura ty_libro con estos campos:
*Título (tipo string)
*Autor (tipo string)
*Número de páginas (tipo i)
    TYPES: BEGIN OF ty_libro,
             titulo  TYPE string,
             autor   TYPE string,
             num_pag TYPE i,
           END OF ty_libro.


*Declare una tabla interna lt_libros y una variable ls_libro de ese tipo.
    TYPES: ty_tabla_libros TYPE STANDARD TABLE OF ty_libro WITH EMPTY KEY.

    DATA: lt_libros TYPE ty_tabla_libros,
          ls_libro  TYPE ty_libro.

*Añada tres libros usando INSERT ... INDEX para colocarlos en posiciones concretas.
    ls_libro-titulo = 'La ciudad perdida'.
    ls_libro-autor = 'Carlos'.
    ls_libro-num_pag = 120.

    INSERT ls_libro INTO lt_libros INDEX 1.

    ls_libro-titulo = 'Caballero de la armadura oxidada'.
    ls_libro-autor = 'Rocio'.
    ls_libro-num_pag = 150.

    INSERT ls_libro INTO lt_libros INDEX 2.

    ls_libro-titulo = 'El Principito'.
    ls_libro-autor = 'Daniel'.
    ls_libro-num_pag = 520.

    INSERT ls_libro INTO lt_libros INDEX 3.

*Recorra la tabla con un LOOP AT y muestre:
    LOOP AT lt_libros INTO ls_libro.
*"Libro corto: <título>" si tiene menos de 150 páginas
      IF ls_libro-num_pag <= 150.
        out->write( |Este libro es corto: { ls_libro-titulo } | ).
*"Libro largo: <título>" si tiene más de 500 páginas
      ELSEIF ls_libro-num_pag > 500.
        out->write( |Este libro es largo: { ls_libro-titulo } | ).
*"Libro estándar: <título>" en otro caso
      ELSE.
        out->write( |Este libro es estándar: { ls_libro-titulo } | ).
      ENDIF.
    ENDLOOP.
*Finalmente, muestra toda la tabla con out->write.
    out->write( lt_libros ).

***************************** EJERCICIOS DE LA CLASE QUE HE PERDIDO ****************
" Paso 1: Leer todas las agencias
    SELECT FROM /dmo/agency
      FIELDS *
      INTO TABLE @DATA(lt_agencias).

    " Mostrar contenido original
    out->write( data = lt_agencias name = `Antes de la anonimización` ).

    " Paso 2: Recorrer y aplicar condiciones lógicas
    LOOP AT lt_agencias ASSIGNING FIELD-SYMBOL(<fs_agencia>).

      " Si NO está en Alemania Y su web contiene la palabra 'tour'
      IF <fs_agencia>-country_code <> 'DE'  AND <fs_agencia>-web_address CP '*tour*'.

        " Paso 3: Anonimizar el correo
        <fs_agencia>-email_address = 'oculta@demo.com'.

      ENDIF.

    ENDLOOP.

    " Paso 4: Mostrar resultado
    out->write( data = lt_agencias name = `Después de la anonimización` ).

  ENDMETHOD.

ENDCLASS.
