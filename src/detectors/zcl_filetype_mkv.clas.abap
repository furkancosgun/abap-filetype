CLASS zcl_filetype_mkv DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.
ENDCLASS.


CLASS zcl_filetype_mkv IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    CONSTANTS lc_ebml_header TYPE x LENGTH 4 VALUE '1A45DFA3'.

    DATA lv_len    TYPE i.
    DATA lv_chunk  TYPE xstring.
    DATA lv_search TYPE string.

    lv_len = xstrlen( iv_buffer ).

    IF lv_len < 4 OR iv_buffer+0(4) <> lc_ebml_header.
      RETURN.
    ENDIF.

    IF lv_len > 64.
      lv_chunk = iv_buffer(64).
    ELSE.
      lv_chunk = iv_buffer.
    ENDIF.

    lv_search = zcl_filetype_utils=>xstring_to_string( lv_chunk ).

    rv_detected = xsdbool( lv_search CS 'matroska' ).
  ENDMETHOD.
ENDCLASS.
