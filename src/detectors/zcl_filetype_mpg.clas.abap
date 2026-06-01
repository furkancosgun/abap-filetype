CLASS zcl_filetype_mpg DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_mpg IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    DATA lv_last TYPE x LENGTH 1.

    IF xstrlen( iv_buffer ) <= 3
        OR iv_buffer+0(3) <> '000001'.
      RETURN.
    ENDIF.

    lv_last = iv_buffer+3(1).
    rv_detected = xsdbool( lv_last >= 'B0' AND lv_last <= 'BF' ).
  ENDMETHOD.
ENDCLASS.
