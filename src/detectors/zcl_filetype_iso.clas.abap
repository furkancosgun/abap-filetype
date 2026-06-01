CLASS zcl_filetype_iso DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_iso IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool( xstrlen( iv_buffer ) > 32773
                           AND iv_buffer+32769(5)   = '4344303031' ).
  ENDMETHOD.
ENDCLASS.
