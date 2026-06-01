CLASS zcl_filetype_flac DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_flac IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool( xstrlen( iv_buffer ) > 3
                           AND iv_buffer(4)         = '664C6143' ).
  ENDMETHOD.
ENDCLASS.
