CLASS zcl_filetype_3gp DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.
ENDCLASS.


CLASS zcl_filetype_3gp IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool( xstrlen( iv_buffer ) > 10
                           AND iv_buffer+4(7)       = '66747970336770' ).
  ENDMETHOD.
ENDCLASS.
