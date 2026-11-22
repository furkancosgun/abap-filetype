CLASS zcl_filetype_utils DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS xstring_to_string
      IMPORTING iv_xstring       TYPE xstring
      RETURNING VALUE(rv_string) TYPE string.

    CLASS-METHODS xstring_to_string_utf8
      IMPORTING iv_xstr       TYPE xstring
      RETURNING VALUE(rv_str) TYPE string.

    CLASS-METHODS string_to_xstring_utf8
      IMPORTING iv_str         TYPE string
      RETURNING VALUE(rv_xstr) TYPE xstring.
ENDCLASS.


CLASS zcl_filetype_utils IMPLEMENTATION.
  METHOD xstring_to_string.
    rv_string = xstring_to_string_utf8( iv_xstring ).
  ENDMETHOD.

  METHOD xstring_to_string_utf8.
    DATA lo_conv TYPE REF TO object.
    DATA lv_in_ce TYPE string.

    lv_in_ce = 'CL_ABAP_CONV_IN_CE'.

    TRY.
        CALL METHOD ('CL_ABAP_CONV_CODEPAGE')=>create_in
          RECEIVING
            instance = lo_conv.
        CALL METHOD lo_conv->('IF_ABAP_CONV_IN~CONVERT')
          EXPORTING
            source = iv_xstr
          RECEIVING
            result = rv_str.
      CATCH cx_sy_dyn_call_illegal_class.
        CALL METHOD (lv_in_ce)=>create
          EXPORTING
            encoding = 'UTF-8'
          RECEIVING
            conv     = lo_conv.
        CALL METHOD lo_conv->('CONVERT')
          EXPORTING
            input = iv_xstr
          IMPORTING
            data  = rv_str.
    ENDTRY.
  ENDMETHOD.

  METHOD string_to_xstring_utf8.
    DATA lo_conv TYPE REF TO object.
    DATA lv_out_ce TYPE string.

    lv_out_ce = 'CL_ABAP_CONV_OUT_CE'.

    TRY.
        CALL METHOD ('CL_ABAP_CONV_CODEPAGE')=>create_out
          RECEIVING
            instance = lo_conv.
        CALL METHOD lo_conv->('IF_ABAP_CONV_OUT~CONVERT')
          EXPORTING
            source = iv_str
          RECEIVING
            result = rv_xstr.
      CATCH cx_sy_dyn_call_illegal_class.
        CALL METHOD (lv_out_ce)=>create
          EXPORTING
            encoding = 'UTF-8'
          RECEIVING
            conv     = lo_conv.
        CALL METHOD lo_conv->('CONVERT')
          EXPORTING
            data   = iv_str
          IMPORTING
            buffer = rv_xstr.
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
