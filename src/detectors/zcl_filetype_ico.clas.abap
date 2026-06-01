CLASS zcl_filetype_ico DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_ico IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool( xstrlen( iv_buffer ) >= 4
                           AND iv_buffer(4)          = '00000100' ).
  ENDMETHOD.
ENDCLASS.
