CLASS zcl_filetype_jp2 DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_jp2 IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool( xstrlen( iv_buffer ) >= 13
                           AND iv_buffer(13)         = '0000000C6A5020200D0A870A00' ).
  ENDMETHOD.
ENDCLASS.
