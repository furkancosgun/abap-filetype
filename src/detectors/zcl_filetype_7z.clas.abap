CLASS zcl_filetype_7z DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.
ENDCLASS.


CLASS zcl_filetype_7z IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool( xstrlen( iv_buffer ) >= 6
                           AND iv_buffer(6)          = '377ABCAF271C' ).
  ENDMETHOD.
ENDCLASS.
