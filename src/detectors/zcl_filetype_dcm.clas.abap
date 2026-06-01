CLASS zcl_filetype_dcm DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_dcm IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool( xstrlen( iv_buffer ) >= 132
                           AND iv_buffer+128(4)      = '4449434D' ).
  ENDMETHOD.
ENDCLASS.
