CLASS zcl_filetype_ogg DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_ogg IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool( xstrlen( iv_buffer ) > 3
                           AND iv_buffer+0(4)       = '4F676753' ).
  ENDMETHOD.
ENDCLASS.
