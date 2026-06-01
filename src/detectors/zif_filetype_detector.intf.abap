INTERFACE zif_filetype_detector PUBLIC.
  METHODS detect
    IMPORTING iv_buffer          TYPE xstring
    RETURNING VALUE(rv_detected) TYPE abap_bool.
ENDINTERFACE.
