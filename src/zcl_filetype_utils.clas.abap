CLASS zcl_filetype_utils DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS xstring_to_string
      IMPORTING iv_xstring       TYPE xstring
      RETURNING VALUE(rv_string) TYPE string.
ENDCLASS.


CLASS zcl_filetype_utils IMPLEMENTATION.
  METHOD xstring_to_string.
    TRY.
        CALL METHOD cl_abap_codepage=>('CONVERT_FROM')
          EXPORTING source      = iv_xstring
                    codepage    = 'UTF-8'
                    ignore_cerr = abap_true
          RECEIVING result      = rv_string.
      CATCH cx_root.
        CALL METHOD cl_abap_codepage=>('CONVERT_FROM')
          EXPORTING source   = iv_xstring
                    codepage = 'UTF-8'
          RECEIVING result   = rv_string.
    ENDTRY.
  ENDMETHOD.
ENDCLASS.