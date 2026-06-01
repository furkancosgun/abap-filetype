CLASS zcl_filetype_parquet DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_parquet IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool(
          xstrlen( iv_buffer ) >= 4
      AND iv_buffer+0(4)        = '50415231' ).
  ENDMETHOD.
ENDCLASS.
