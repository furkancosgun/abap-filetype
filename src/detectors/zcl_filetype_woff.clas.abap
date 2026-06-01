CLASS zcl_filetype_woff DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_woff IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool(
          xstrlen( iv_buffer ) > 7
      AND iv_buffer+0(8)       = '774F464600010000' ).
  ENDMETHOD.
ENDCLASS.
