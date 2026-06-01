CLASS zcl_filetype_aiff DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_aiff IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool( xstrlen( iv_buffer ) > 11
                           AND iv_buffer(4)         = '464F524D'
                           AND iv_buffer+8(4)       = '41494646' ).
  ENDMETHOD.
ENDCLASS.
