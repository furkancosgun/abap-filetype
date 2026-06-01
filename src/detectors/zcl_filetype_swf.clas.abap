CLASS zcl_filetype_swf DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_swf IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    DATA lv_first TYPE x LENGTH 1.

    IF xstrlen( iv_buffer ) <= 2.
      RETURN.
    ENDIF.

    lv_first = iv_buffer+0(1).
    rv_detected = xsdbool(
         ( lv_first = '43' OR lv_first = '46' )
         AND iv_buffer+1(2) = '5753' ).
  ENDMETHOD.
ENDCLASS.
