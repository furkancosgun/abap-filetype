CLASS zcl_filetype_mid DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_mid IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool( xstrlen( iv_buffer ) > 3
                           AND iv_buffer(4)         = '4D546864' ).
  ENDMETHOD.
ENDCLASS.
