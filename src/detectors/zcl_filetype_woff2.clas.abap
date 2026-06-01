CLASS zcl_filetype_woff2 DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_woff2 IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool(
          xstrlen( iv_buffer ) > 7
      AND iv_buffer+0(8)       = '774F463200010000' ).
  ENDMETHOD.
ENDCLASS.
