CLASS zcl_filetype_ppt DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.
ENDCLASS.


CLASS zcl_filetype_ppt IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    CONSTANTS lc_ole_header TYPE x LENGTH 4 VALUE 'D0CF11E0'.
    CONSTANTS lc_ppt_magic  TYPE x LENGTH 2 VALUE 'A046'.
    DATA lv_len TYPE i.

    lv_len = xstrlen( iv_buffer ).

    IF lv_len < 4 OR iv_buffer+0(4) <> lc_ole_header.
      RETURN.
    ENDIF.

    rv_detected = xsdbool(
         ( lv_len >= 514 AND iv_buffer+512(2) = lc_ppt_magic )
      OR lv_len < 514 ).
  ENDMETHOD.
ENDCLASS.
