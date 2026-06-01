CLASS zcl_filetype_epub DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_epub IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool( xstrlen( iv_buffer ) >= 32
                           AND iv_buffer(32)         = '504B03046D696D65747970656170706C69636174696F6E2F657075622B7A6970' ).
  ENDMETHOD.
ENDCLASS.
