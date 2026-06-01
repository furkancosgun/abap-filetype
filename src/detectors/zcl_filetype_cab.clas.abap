CLASS zcl_filetype_cab DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_cab IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool( xstrlen( iv_buffer ) > 3
                           AND (    iv_buffer+0(4) = '4D534346'
                                 OR iv_buffer+0(4) = '49536328' ) ).
  ENDMETHOD.
ENDCLASS.
