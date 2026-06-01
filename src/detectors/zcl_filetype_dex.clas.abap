CLASS zcl_filetype_dex DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_dex IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool( xstrlen( iv_buffer ) >= 37
                           AND iv_buffer(4)          = '6465780A'
                           AND iv_buffer+36(1)       = '70' ).
  ENDMETHOD.
ENDCLASS.
