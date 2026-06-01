CLASS zcl_filetype_avif DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_avif IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    CONSTANTS lc_ftyp TYPE x LENGTH 4 VALUE '66747970'.
    CONSTANTS lc_avif TYPE x LENGTH 4 VALUE '61766966'.
    CONSTANTS lc_mif1 TYPE x LENGTH 4 VALUE '6D696631'.
    CONSTANTS lc_msf1 TYPE x LENGTH 4 VALUE '6D736631'.

    DATA lv_len TYPE i.

    lv_len = xstrlen( iv_buffer ).

    IF lv_len < 12 OR iv_buffer+4(4) <> lc_ftyp.
      RETURN.
    ENDIF.

    rv_detected = xsdbool(
         iv_buffer+8(4) = lc_avif
      OR (     ( iv_buffer+8(4) = lc_mif1 OR iv_buffer+8(4) = lc_msf1 )
           AND lv_len >= 16 AND iv_buffer+12(4) = lc_avif ) ).
  ENDMETHOD.
ENDCLASS.
