CLASS zcl_filetype_dey DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.
ENDCLASS.


CLASS zcl_filetype_dey IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    CONSTANTS lc_dey_head TYPE x LENGTH 4 VALUE '6465790A'.
    CONSTANTS lc_dex_head TYPE x LENGTH 4 VALUE '6465780A'.
    CONSTANTS lc_dex_flag TYPE x LENGTH 1 VALUE '70'.

    rv_detected = xsdbool(
          xstrlen( iv_buffer ) > 100
      AND iv_buffer+0(4)       = lc_dey_head
      AND iv_buffer+40(4)      = lc_dex_head
      AND iv_buffer+76(1)      = lc_dex_flag ).
  ENDMETHOD.
ENDCLASS.
