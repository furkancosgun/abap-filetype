CLASS zcl_filetype_tar DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_tar IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool(
          xstrlen( iv_buffer ) > 261
      AND iv_buffer+257(5)     = '7573746172' ).
  ENDMETHOD.
ENDCLASS.
