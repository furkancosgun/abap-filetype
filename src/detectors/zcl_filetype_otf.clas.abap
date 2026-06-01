CLASS zcl_filetype_otf DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_otf IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool(
          xstrlen( iv_buffer ) > 4
      AND iv_buffer+0(5)       = '4F54544F00' ).
  ENDMETHOD.
ENDCLASS.
