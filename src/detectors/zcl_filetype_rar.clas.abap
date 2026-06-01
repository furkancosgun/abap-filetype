CLASS zcl_filetype_rar DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_rar IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool(
          xstrlen( iv_buffer ) > 6
      AND iv_buffer+0(6)       = '526172211A07'
      AND ( iv_buffer+6(1) = '00' OR iv_buffer+6(1) = '01' ) ).
  ENDMETHOD.
ENDCLASS.
