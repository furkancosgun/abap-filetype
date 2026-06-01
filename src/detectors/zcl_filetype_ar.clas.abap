CLASS zcl_filetype_ar DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_ar IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool( xstrlen( iv_buffer ) >= 7
                           AND iv_buffer(7)          = '213C617263683E' ).
  ENDMETHOD.
ENDCLASS.
