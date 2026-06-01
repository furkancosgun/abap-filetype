CLASS zcl_filetype_zst DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_zst IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool(
          xstrlen( iv_buffer ) >= 4
      AND iv_buffer+0(4)        = '28B52FFD' ).
  ENDMETHOD.
ENDCLASS.
