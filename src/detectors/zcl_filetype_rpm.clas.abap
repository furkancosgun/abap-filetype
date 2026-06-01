CLASS zcl_filetype_rpm DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_rpm IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool(
          xstrlen( iv_buffer ) > 96
      AND iv_buffer+0(4)       = 'EDABEEDB' ).
  ENDMETHOD.
ENDCLASS.
