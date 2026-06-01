CLASS zcl_filetype_xz DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_xz IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool(
          xstrlen( iv_buffer ) >= 6
      AND iv_buffer+0(6)        = 'FD377A585A00' ).
  ENDMETHOD.
ENDCLASS.
