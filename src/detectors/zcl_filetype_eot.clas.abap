CLASS zcl_filetype_eot DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.
ENDCLASS.


CLASS zcl_filetype_eot IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    CONSTANTS lc_eot_magic TYPE x LENGTH 2 VALUE '4C50'.
    CONSTANTS lc_ver_101   TYPE x LENGTH 3 VALUE '020001'.
    CONSTANTS lc_ver_100   TYPE x LENGTH 3 VALUE '010000'.
    CONSTANTS lc_ver_102   TYPE x LENGTH 3 VALUE '020002'.

    rv_detected = xsdbool(
          xstrlen( iv_buffer ) > 35
      AND iv_buffer+34(2)      = lc_eot_magic
      AND (    iv_buffer+8(3) = lc_ver_101
            OR iv_buffer+8(3) = lc_ver_100
            OR iv_buffer+8(3) = lc_ver_102 ) ).
  ENDMETHOD.
ENDCLASS.
