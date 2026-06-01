CLASS zcl_filetype_amr DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_amr IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool( xstrlen( iv_buffer ) > 11
                           AND iv_buffer(6)         = '2321414D520A' ).
  ENDMETHOD.
ENDCLASS.
