CLASS zcl_filetype_wmv DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_wmv IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool(
          xstrlen( iv_buffer ) > 9
      AND iv_buffer+0(10)      = '3026B2758E66CF11A6D9' ).
  ENDMETHOD.
ENDCLASS.
