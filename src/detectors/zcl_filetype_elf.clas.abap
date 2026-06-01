CLASS zcl_filetype_elf DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_elf IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool( xstrlen( iv_buffer ) > 52
                           AND iv_buffer+0(4)       = '7F454C46' ).
  ENDMETHOD.
ENDCLASS.
