CLASS zcl_filetype_rtf DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_rtf IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool(
          xstrlen( iv_buffer ) >= 5
      AND iv_buffer+0(5)        = '7B5C727466' ).
  ENDMETHOD.
ENDCLASS.
