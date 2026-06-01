CLASS zcl_filetype_odp DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.
ENDCLASS.


CLASS zcl_filetype_odp IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    CONSTANTS lc_zip_header TYPE x LENGTH 4  VALUE '504B0304'.
    CONSTANTS lc_mimetype   TYPE x LENGTH 8  VALUE '6D696D6574797065'.
    CONSTANTS lc_odp_text   TYPE x LENGTH 47
                            VALUE '6170706C69636174696F6E2F766E642E6F617369732E6F70656E646F63756D656E742E70726573656E746174696F6E'.

    IF xstrlen( iv_buffer ) < 94 OR iv_buffer+0(4) <> lc_zip_header.
      RETURN.
    ENDIF.

    rv_detected = xsdbool(
          iv_buffer+30(8)  = lc_mimetype
      AND iv_buffer+47(47) = lc_odp_text ).
  ENDMETHOD.
ENDCLASS.
