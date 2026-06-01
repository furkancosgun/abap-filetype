CLASS zcl_filetype_mp3 DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_mp3 IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool(
          xstrlen( iv_buffer ) > 2
      AND ( iv_buffer+0(3) = '494433' OR (     iv_buffer+0(1) = 'FF'
                                           AND iv_buffer+1(1) = 'FB' ) ) ).
  ENDMETHOD.
ENDCLASS.
