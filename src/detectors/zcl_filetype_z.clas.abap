CLASS zcl_filetype_z DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_z IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool(
          xstrlen( iv_buffer ) > 1
      AND (    ( iv_buffer(1) = '1F' AND iv_buffer+1(1) = 'A0' )
            OR ( iv_buffer(1) = '1F' AND iv_buffer+1(1) = '9D' ) ) ).
  ENDMETHOD.
ENDCLASS.
