CLASS zcl_filetype_tif DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_tif IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    DATA lv_header TYPE x LENGTH 4.

    IF xstrlen( iv_buffer ) < 11.
      RETURN.
    ENDIF.

    lv_header = iv_buffer+0(4).
    rv_detected = xsdbool(
         ( lv_header = '49492A00' OR lv_header = '4D4D002A' )
         AND iv_buffer+8(3) <> '435202' ).
  ENDMETHOD.
ENDCLASS.
