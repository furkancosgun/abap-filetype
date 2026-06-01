CLASS zcl_filetype_docx DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.
ENDCLASS.


CLASS zcl_filetype_docx IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    CONSTANTS lc_zip_header TYPE x LENGTH 4 VALUE '504B0304'.

    DATA lv_chunk  TYPE xstring.
    DATA lv_search TYPE string.
    DATA lv_len    TYPE i.

    lv_len = xstrlen( iv_buffer ).

    IF lv_len < 4 OR iv_buffer(4) <> lc_zip_header.
      RETURN.
    ENDIF.

    IF lv_len > 512.
      lv_chunk = iv_buffer(512).
    ELSE.
      lv_chunk = iv_buffer(lv_len).
    ENDIF.

    lv_search = zcl_filetype_utils=>xstring_to_string( lv_chunk ).

    rv_detected = xsdbool( matches( val   = lv_search
                                    regex = '.*word/.*' ) ).
  ENDMETHOD.
ENDCLASS.
