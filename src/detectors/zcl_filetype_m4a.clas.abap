CLASS zcl_filetype_m4a DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_m4a IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool( xstrlen( iv_buffer ) > 10
                           AND (    iv_buffer(4)   = '4D344120'
                                 OR iv_buffer+4(7) = '667479704D3441' ) ).
  ENDMETHOD.
ENDCLASS.
