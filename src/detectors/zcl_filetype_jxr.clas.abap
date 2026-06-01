CLASS zcl_filetype_jxr DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_jxr IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool( xstrlen( iv_buffer ) >= 3
                           AND iv_buffer(3)          = '494942' ).
  ENDMETHOD.
ENDCLASS.
