CLASS zcl_filetype_macho DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_macho IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool(
          xstrlen( iv_buffer ) > 3
      AND (    iv_buffer(4) = 'FEEDFACF' OR iv_buffer(4) = 'FEEDFACE'
            OR iv_buffer(4) = 'BEBAFECA' OR iv_buffer(4) = 'CFFAEDFE'
            OR iv_buffer(4) = 'CEFAEDFE' OR iv_buffer(4) = 'CAFEBABE' ) ).
  ENDMETHOD.
ENDCLASS.
