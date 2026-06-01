CLASS zcl_filetype_dwg DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_dwg IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool( xstrlen( iv_buffer ) >= 4
                           AND iv_buffer(4)          = '41433130' ).
  ENDMETHOD.
ENDCLASS.
