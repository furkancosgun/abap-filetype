CLASS zcl_filetype_aac DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.
ENDCLASS.


CLASS zcl_filetype_aac IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool( xstrlen( iv_buffer ) > 1
                           AND (    (     iv_buffer(1)   = 'FF'
                                      AND iv_buffer+1(1) = 'F1' )
                                 OR (     iv_buffer(1)   = 'FF'
                                      AND iv_buffer+1(1) = 'F9' ) ) ).
  ENDMETHOD.
ENDCLASS.
