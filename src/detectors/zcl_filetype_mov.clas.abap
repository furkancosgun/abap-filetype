CLASS zcl_filetype_mov DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_mov IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool(
          xstrlen( iv_buffer ) > 15
      AND (    (     ( iv_buffer+0(4) = '00000014' OR iv_buffer+0(4) = '00000020' )
                 AND iv_buffer+4(4)  = '66747970' AND iv_buffer+8(4) = '71742020' )
            OR (     iv_buffer+4(4)  = '6D6F6F76'
                 OR iv_buffer+4(4)  = '6D646174'
                 OR iv_buffer+12(4) = '6D646174' ) ) ).
  ENDMETHOD.
ENDCLASS.
