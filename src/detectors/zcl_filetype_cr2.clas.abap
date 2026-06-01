CLASS zcl_filetype_cr2 DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_cr2 IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    CONSTANTS lc_tiff_le TYPE x LENGTH 4 VALUE '49492A00'.
    CONSTANTS lc_tiff_be TYPE x LENGTH 4 VALUE '4D4D002A'.
    CONSTANTS lc_cr2_tag TYPE x LENGTH 3 VALUE '435202'.

    rv_detected = xsdbool(
          xstrlen( iv_buffer ) >= 11
      AND ( iv_buffer+0(4) = lc_tiff_le OR iv_buffer+0(4) = lc_tiff_be )
      AND iv_buffer+8(3) = lc_cr2_tag ).
  ENDMETHOD.
ENDCLASS.
