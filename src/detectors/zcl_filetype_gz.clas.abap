CLASS zcl_filetype_gz DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_gz IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool( xstrlen( iv_buffer ) >= 3
                           AND iv_buffer(3)          = '1F8B08' ).
  ENDMETHOD.
ENDCLASS.
