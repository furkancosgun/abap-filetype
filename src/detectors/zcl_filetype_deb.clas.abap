CLASS zcl_filetype_deb DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_deb IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool( xstrlen( iv_buffer ) >= 21
                           AND iv_buffer(21)         = '213C617263683E0A64656269616E2D62696E617279' ).
  ENDMETHOD.
ENDCLASS.
