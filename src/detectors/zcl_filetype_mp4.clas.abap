CLASS zcl_filetype_mp4 DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.
ENDCLASS.


CLASS zcl_filetype_mp4 IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    CONSTANTS lc_ftyp TYPE x LENGTH 4 VALUE '66747970'.
    CONSTANTS lc_avc1 TYPE x LENGTH 4 VALUE '61766331'.
    CONSTANTS lc_dash TYPE x LENGTH 4 VALUE '64617368'.
    CONSTANTS lc_isom TYPE x LENGTH 4 VALUE '69736F6D'.
    CONSTANTS lc_mp42 TYPE x LENGTH 4 VALUE '6D703432'.
    CONSTANTS lc_mp41 TYPE x LENGTH 4 VALUE '6D703431'.
    CONSTANTS lc_mp4v TYPE x LENGTH 4 VALUE '6D703476'.
    CONSTANTS lc_mp71 TYPE x LENGTH 4 VALUE '6D703731'.
    CONSTANTS lc_is02 TYPE x LENGTH 4 VALUE '69736F32'.
    CONSTANTS lc_is03 TYPE x LENGTH 4 VALUE '69736F33'.
    CONSTANTS lc_is04 TYPE x LENGTH 4 VALUE '69736F34'.
    CONSTANTS lc_is05 TYPE x LENGTH 4 VALUE '69736F35'.
    CONSTANTS lc_is06 TYPE x LENGTH 4 VALUE '69736F36'.

    IF xstrlen( iv_buffer ) < 12 OR iv_buffer+4(4) <> lc_ftyp.
      RETURN.
    ENDIF.

    rv_detected = xsdbool(
            iv_buffer+8(4) = lc_avc1 OR iv_buffer+8(4) = lc_dash
         OR iv_buffer+8(4) = lc_isom OR iv_buffer+8(4) = lc_mp42
         OR iv_buffer+8(4) = lc_mp41 OR iv_buffer+8(4) = lc_mp4v
         OR iv_buffer+8(4) = lc_mp71 OR iv_buffer+8(4) = lc_is02
         OR iv_buffer+8(4) = lc_is03 OR iv_buffer+8(4) = lc_is04
         OR iv_buffer+8(4) = lc_is05 OR iv_buffer+8(4) = lc_is06 ).
  ENDMETHOD.
ENDCLASS.
