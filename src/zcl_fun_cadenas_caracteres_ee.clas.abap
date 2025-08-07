CLASS zcl_fun_cadenas_caracteres_ee DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fun_cadenas_caracteres_ee IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA: lv_string TYPE string VALUE '¡EXPERIS! Welcome to ABAP Cloud Master',
*          lv_string1 TYPE string VALUE 'Daniel, Fernando, Pedro',
          lv_name   TYPE string,
          lv_num    TYPE i.

************************************************************************************
********************** FUNCIONES DE BUSQUEDA **************************************

** STRLEN es una función de ABAP que se usa para contar la cantidad de caracteres en una cadena de texto (string).
*    lv_num = strlen( '¡EXPERIS! Welcome to ABAP Cloud Master' ).
*    out->write( lv_num ).
*
** COUNT permite contar cuántos registros existen en una tabla o entidad CDS sin traer los datos completos
*    lv_num = count( val = lv_string sub = 'We' ).
*    out->write( lv_num ).
*
** count_any_of permite contar cuántos registros existen sin distinguir mayusculas o minusculas
*    lv_num = count_any_of( val = lv_string sub = 'We' ).
*    out->write( lv_num ).
*
** count_any_of permite contar todos los registros distinto de lo que se le establece
*    lv_num = count_any_not_of( val = lv_string sub = 'We' ).
*    out->write( lv_num ).
*
**    find es una función que se usa para buscar un texto dentro de otro texto.
** Devuelve la posición donde se encuentra el texto buscado (si lo encuentra) o 0 si no lo encuentra.
*    lv_name = 'Fernando'.
*    lv_num = find( val = lv_string1 sub = lv_name ).
*    out->write( lv_num ).
*
**    FIND_any_of es una función que sirve para buscar si alguno de varios caracteres aparece en un texto.
** Devuelve la posición del primer carácter encontrado, o 0 si ninguno de los caracteres está en el texto.
*    lv_num = find( val = lv_string1 sub = 'Fernando' ).
*    out->write( lv_num ).
*
**    find_any_not_of  se usa para buscar la posición del primer carácter en un texto que no pertenece a un conjunto de caracteres permitidos.
*    lv_num = find( val = lv_string1 sub = 'Fernando' ).
*    out->write( lv_num ).

**************************************************************************************************
************************ FUNCIONES DE PROCESAMIENTO ************************************
    DATA lv_cadenas TYPE string.

**** MAYUSCULAS Y MINUSCULAS
    lv_cadenas = to_upper( lv_string ). "Se puede hacer desde afuera del out->write
    out->write( lv_cadenas ).
    out->write( |Mayusculas con to_upper = { to_upper( lv_string ) }| ).

    lv_cadenas = to_lower( lv_string ). "Se puede hacer desde afuera del out->write
    out->write( lv_cadenas ).
    out->write( |Minuscula con to_lower = { to_lower( lv_string ) }| ).

    DATA: lv_string1 TYPE string VALUE 'daniel Fernando Pedro Ramon',
          lv_comodin TYPE string.

    lv_comodin = find( val = lv_string1 sub = 'Pedro' ).
    out->write( lv_comodin ).

    lv_string1 = to_upper( lv_string1 ).
    out->write( lv_string1 ).

    out->write( |TO_MIXED = { to_mixed( lv_string1 ) }| ).
    out->write( |FROM_MIXED       = { from_mixed( lv_string1 ) } | ).

*
**" Order
*out->write( |REVERSE          = { reverse( lv_string1 ) } | ).
*out->write( |SHIFT_LEFT (places)  = { shift_left( val = lv_string places = 5 ) } | ).
*out->write( |SHIFT_RIGHT (places) = { shift_right( val = lv_string places = 5 ) } | ).
*out->write( |SHIFT_LEFT (circ)    = { shift_left( val = lv_string circular = 5 ) } | ).
*out->write( |SHIFT_RIGHT (circ)   = { shift_right( val = lv_string circular = 5 ) } | ).
**
**" Substring
*out->write( |SUBSTRING           = { substring( val = lv_string off = 9 len = 6 ) } | ).
*out->write( |SUBSTRING_FROM      = { substring_from( val = lv_string sub = 'Pedro' ) } | ).
*out->write( |SUBSTRING_AFTER     = { substring_after( val = lv_string sub = 'Pedro' ) } | ).
*out->write( |SUBSTRING_TO        = { substring_to( val = lv_string sub = 'Pedro' ) } | ).
*out->write( |SUBSTRING_BEFORE    = { substring_before( val = lv_string sub = 'Pedro' ) } | ).
**
**" Others
*out->write( |CONDENSE            = { condense( val = lv_string ) } | ).
*out->write( |REPEAT              = { repeat( val = lv_string occ = 2 ) } | ).
**out->write( |SEGMENT1            = { segment( val = lv_string sep = '!' index = 1 ) } | ).
**out->write( |SEGMENT2            = { segment( val = lv_string sep = '!' index = 2 ) } | ).

********************************************** CODIGO DE PROFESOR COMENTADO *********************************************+
**************************************************************************************************************************
*DATA: lv_string TYPE string VALUE 'daniel Fernando Pedro Ramon',
*      lv_name   TYPE string VALUE 'Fernando',
*      lv_comodin TYPE string,
*      lv_num    TYPE i.
*
*" Funciones de búsqueda sobre cadenas de texto
*
** strlen
*lv_num = strlen( lv_string ).                                      " Cuenta el número total de caracteres de la cadena (incluye espacios)
*out->write( lv_num ).
*
*" count
*lv_num = count( val = lv_string sub = lv_name ).                   " Cuenta cuántas veces aparece el valor de lv_name en lv_string
*out->write( lv_num ).
*lv_num = count( val = lv_string sub = 'Fernando' ).                " Hace lo mismo que arriba, pero sin usar la variable lv_name
*out->write( lv_num ).
*
*"count_any_of
*lv_num = count_any_of( val = lv_string sub = lv_name ).            " Cuenta cuántos caracteres de lv_name están presentes en lv_string (aunque no formen la palabra completa)
*out->write( lv_num ).
*
*"count_any_not_of
*lv_num = count_any_not_of( val = lv_string sub = 'Fernando' ).     " Cuenta cuántos caracteres de lv_string **no** están en la palabra 'Fernando'
*out->write( lv_num ).
*
*"find  "Empieza a contar por 0
*lv_num = find( val = lv_string sub = lv_name ).                    " Devuelve la posición donde empieza la palabra 'Fernando' dentro de lv_string (empieza desde 0)
*out->write( lv_num ).
*
*"find_any_of
*lv_num = find_any_of( val = lv_string sub = 'Fernando' ).          " Devuelve la posición del primer carácter que coincida con alguno de los caracteres de 'Fernando'
*out->write( lv_num ).
*
*"find_any_not_of
*lv_num = find_any_not_of( val = lv_string sub = 'Fernando' ).      " Devuelve la posición del primer carácter de lv_string que **no** está contenido en 'Fernando'
*out->write( lv_num ).
*
*
*
*  " FUNCIONES DE PROCESAMINETO
**    DATA: lv_string  TYPE string VALUE 'daniel Fernando Pedro Ramon',
**          lv_comodin TYPE string.
*
*
*" MAYUS minus
*out->write( |TO_UPPER         = { to_upper( lv_string ) } | ).        " Convierte todo el texto a MAYÚSCULAS
*out->write( |TO_LOWER         = { to_lower( lv_string ) } | ).        " Convierte todo el texto a minúsculas
*out->write( |TO_MIXED         = { to_mixed( lv_string ) } | ).        " Primera letra de cada palabra en mayúscula
*out->write( |FROM_MIXED       = { from_mixed( lv_string ) } | ).      " Invierte el efecto de to_mixed (si aplica)
*
*" Order
*out->write( |REVERSE          = { reverse( lv_string ) } | ).         " Invierte el orden de todos los caracteres del texto
*out->write( |SHIFT_LEFT (places)  = { shift_left( val = lv_string places = 5 ) } | ).  " Desplaza 5 caracteres a la izquierda (rellena con espacios)
*out->write( |SHIFT_RIGHT (places) = { shift_right( val = lv_string places = 5 ) } | ). " Desplaza 5 caracteres a la derecha (rellena con espacios)
*out->write( |SHIFT_LEFT (circ)    = { shift_left( val = lv_string circular = 5 ) } | )." Desplaza 5 caracteres a la izquierda de forma circular
*out->write( |SHIFT_RIGHT (circ)   = { shift_right( val = lv_string circular = 5 ) } | )." Desplaza 5 caracteres a la derecha de forma circular
*
*" Substring
*out->write( |SUBSTRING           = { substring( val = lv_string off = 9 len = 6 ) } | ).     " Extrae 6 caracteres desde la posición 9
*out->write( |SUBSTRING_FROM      = { substring_from( val = lv_string sub = 'Pedro' ) } | ).   " Devuelve el texto a partir de 'Pedro' (inclusive)
*out->write( |SUBSTRING_AFTER     = { substring_after( val = lv_string sub = 'Pedro' ) } | ).  " Devuelve el texto después de 'Pedro' (excluyendo 'Pedro')
*out->write( |SUBSTRING_TO        = { substring_to( val = lv_string sub = 'Pedro' ) } | ).     " Devuelve el texto desde el inicio hasta 'Pedro' (inclusive)
*out->write( |SUBSTRING_BEFORE    = { substring_before( val = lv_string sub = 'Pedro' ) } | ). " Devuelve el texto desde el inicio hasta antes de 'Pedro'
*
*" Others
*out->write( |CONDENSE            = { condense( val = lv_string ) } | ).   " Elimina espacios duplicados e innecesarios ( como dobles espacios en blanco)
*out->write( |REPEAT              = { repeat( val = lv_string occ = 2 ) } | ). " Repite el contenido completo 2 veces
*out->write( |SEGMENT1            = { segment( val = lv_string sep = '!' index = 1 ) } | ).    " Extrae el primer segmento antes del primer '!'
*out->write( |SEGMENT2            = { segment( val = lv_string sep = '!' index = 2 ) } | ).    " Extrae el segundo segmento entre el primer y segundo '!'
*

********************" FUNCIONES DE CONTENIDO
*    DATA: lv_text     TYPE string,
*          lv_pattern  TYPE string,
*          lv_pattern2 TYPE string.

    " contains con pcre .
*    lv_text = 'El telefono del empleado es 688-365-987 el correo electronico es daniel.elviraruiz@experis.es'.
*    lv_pattern = `\d{3}-\d{3}-\d{3}`.
*
*    lv_pattern2 = `\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b`.
*
*    IF contains( val = lv_text pcre = lv_pattern2 ).
*      out->write( 'El texto contiene una direccion de correo electronico ' ).
*      DATA(lv_count) = count( val = lv_text pcre = lv_pattern2 ).
*      out->write( lv_count ).
*      DATA(lv_pos) = find( val = lv_text pcre = lv_pattern2 occ = 1 ).
*      out->write( lv_pos ).
*    ENDIF.
*
*    IF contains(  val = lv_text pcre = lv_pattern ).
*      out->write('el texto contiene un numero de telefono').
*    ELSE.
*
*      out->write('el texto NO contiene un numero de telefono').
*    ENDIF.

    " match con pcre

*    lv_text = 'El telefono del empleado es 688-365-987 el correo electronico es daniel.elviraruiz@experis.es'.
*    lv_pattern = `\d{3}-\d{3}-\d{3}`.
*
*    lv_pattern2 = `\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b`.
*
*    data(lv_numero) = match( val = lv_text pcre = lv_pattern occ = '1').
*      out->write( lv_numero ).

    "Concatenación forma 1



*DATA: lv_string_a type string VALUE 'hola, que tal esta ? ',
*       lv_string_b type string value 'Bien gracias 2',
*       lv_concatenacion type string,
*       lv_concatenacion3 type string.
*
*lv_concatenacion = |concatenacion 1: { lv_string_a } { lv_string_a } |.
*out->write( lv_concatenacion ).
*
*"concatencion forma 2
*
*    Concatenate lv_string_a lv_string_b into data(lv_concatenacion2)  SEPARATED BY space.
*
*"concatenacion forma 3
*
*lv_concatenacion3 = 'Hola' && ` ` && 'Juan'.
*out->write( lv_concatenacion3 ).
*
*"concatenacion de lineas de tablas.
*SELECT from /dmo/flight
*fields flight_date
*into table @data(lt_itab).
*
*
*DATA(lv_string_itab) = concat_lines_of( table = lt_itab sep = '-' ).
*out->write( lv_string_itab ).

************ SEGMENT  *********
*DATA(lv_frase) = 'El-perro-corre-por-el-prado'.
*DATA(lv_palabra) = segment( val = lv_frase index = 3 sep = '-' ).
*
*out->write( lv_palabra ).

********* INSERT ******
    DATA: lv_cadena TYPE string VALUE 'Frase',
          lv_insert TYPE string VALUE 'hola nueva'.

lv_insert = insert( val = lv_insert sub = lv_cadena off = 10 ).
out->write( lv_insert ).




            ENDMETHOD.

ENDCLASS.
