CLASS zcl_filetype_doc DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.
ENDCLASS.


CLASS zcl_filetype_doc IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    CONSTANTS lc_ole_header TYPE x LENGTH 4 VALUE 'D0CF11E0'.
    CONSTANTS lc_doc_magic  TYPE x LENGTH 2 VALUE 'ECA5'.

    rv_detected = xsdbool(
          xstrlen( iv_buffer ) >= 4
      AND iv_buffer+0(4)        = lc_ole_header
      AND ( xstrlen( iv_buffer ) < 514 OR iv_buffer+512(2) = lc_doc_magic ) ).
  ENDMETHOD.
ENDCLASS.
