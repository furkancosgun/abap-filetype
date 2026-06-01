CLASS zcl_filetype_wasm DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_wasm IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool(
          xstrlen( iv_buffer ) >= 8
      AND iv_buffer+0(8)        = '0061736D01000000' ).
  ENDMETHOD.
ENDCLASS.
