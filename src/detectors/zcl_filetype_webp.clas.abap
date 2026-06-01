CLASS zcl_filetype_webp DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_webp IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool(
          xstrlen( iv_buffer ) >= 12
      AND iv_buffer+8(4)        = '57454250' ).
  ENDMETHOD.
ENDCLASS.
