CLASS zcl_filetype_exr DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_exr IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool( xstrlen( iv_buffer ) >= 4
                           AND iv_buffer(4)          = '762F3101' ).
  ENDMETHOD.
ENDCLASS.
