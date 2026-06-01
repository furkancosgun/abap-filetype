CLASS zcl_filetype_flv DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_flv IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool( xstrlen( iv_buffer ) > 3
                           AND iv_buffer(4)         = '464C5601' ).
  ENDMETHOD.
ENDCLASS.
