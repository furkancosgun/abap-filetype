CLASS zcl_filetype_ods DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.

ENDCLASS.


CLASS zcl_filetype_ods IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool(
          xstrlen( iv_buffer ) >= 38
      AND iv_buffer+0(4)        = '504B0304'
      AND iv_buffer+30(8)       = '6D696D6574797065'
      AND iv_buffer+38(37)      = '6170706C69636174696F6E2F766E642E6F617369732E6F70656E646F63756D656E742E7370726561647368656574' ).
  ENDMETHOD.
ENDCLASS.
