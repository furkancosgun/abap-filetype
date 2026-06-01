CLASS zcl_filetype_jpg DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_jpg IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool( xstrlen( iv_buffer ) >= 3
                           AND iv_buffer(3)          = 'FFD8FF' ).
  ENDMETHOD.
ENDCLASS.
