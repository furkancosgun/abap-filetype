CLASS zcl_filetype_xls DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_xls IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool(
          xstrlen( iv_buffer ) > 3
      AND iv_buffer+0(4)       = 'D0CF11E0'
      AND xstrlen( iv_buffer ) > 513
      AND (    iv_buffer+512(2) = '0908'
            OR iv_buffer+512(2) = 'FDFF' ) ).
  ENDMETHOD.
ENDCLASS.
