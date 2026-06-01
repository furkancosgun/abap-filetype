CLASS zcl_filetype_ps DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_ps IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool(
          xstrlen( iv_buffer ) >= 2
      AND iv_buffer+0(2)        = '2521' ).
  ENDMETHOD.
ENDCLASS.
