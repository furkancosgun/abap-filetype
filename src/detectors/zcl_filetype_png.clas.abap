CLASS zcl_filetype_png DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_png IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool(
          xstrlen( iv_buffer ) >= 4
      AND iv_buffer+0(4)        = '89504E47' ).
  ENDMETHOD.
ENDCLASS.
