CLASS zcl_filetype_avi DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_avi IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool( xstrlen( iv_buffer ) > 10
                           AND iv_buffer(4)         = '52494646'
                           AND iv_buffer+8(3)       = '415649' ).
  ENDMETHOD.
ENDCLASS.
