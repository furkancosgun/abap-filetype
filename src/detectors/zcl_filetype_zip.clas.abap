CLASS zcl_filetype_zip DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.
ENDCLASS.


CLASS zcl_filetype_zip IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    CONSTANTS lc_zip_local   TYPE x LENGTH 4 VALUE '504B0304'.
    CONSTANTS lc_zip_empty   TYPE x LENGTH 4 VALUE '504B0506'.
    CONSTANTS lc_zip_spanned TYPE x LENGTH 4 VALUE '504B0708'.

    IF xstrlen( iv_buffer ) < 4.
      RETURN.
    ENDIF.

    rv_detected = xsdbool(
         iv_buffer+0(4) = lc_zip_local
      OR iv_buffer+0(4) = lc_zip_empty
      OR iv_buffer+0(4) = lc_zip_spanned ).
  ENDMETHOD.
ENDCLASS.
