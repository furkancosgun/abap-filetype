CLASS zcl_filetype_wav DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_wav IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool(
          xstrlen( iv_buffer ) > 11
      AND iv_buffer+0(4)       = '52494646'
      AND iv_buffer+8(4)       = '57415645' ).
  ENDMETHOD.
ENDCLASS.
