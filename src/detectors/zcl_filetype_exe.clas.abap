CLASS zcl_filetype_exe DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_exe IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool( xstrlen( iv_buffer ) >= 2
                           AND iv_buffer(2)          = '4D5A' ).
  ENDMETHOD.
ENDCLASS.
