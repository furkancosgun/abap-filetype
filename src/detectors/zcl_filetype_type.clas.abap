CLASS zcl_filetype_type DEFINITION PUBLIC FINAL CREATE PRIVATE.
  PUBLIC SECTION.
    METHODS constructor
      IMPORTING iv_ext  TYPE string
                iv_mime TYPE string.

    METHODS is_image
      RETURNING VALUE(rv_is_image) TYPE abap_bool.

    METHODS is_video
      RETURNING VALUE(rv_is_video) TYPE abap_bool.

    METHODS is_audio
      RETURNING VALUE(rv_is_audio) TYPE abap_bool.

    METHODS is_archive
      RETURNING VALUE(rv_is_archive) TYPE abap_bool.

    METHODS is_document
      RETURNING VALUE(rv_is_document) TYPE abap_bool.

    METHODS is_font
      RETURNING VALUE(rv_is_font) TYPE abap_bool.

    METHODS is_application
      RETURNING VALUE(rv_is_application) TYPE abap_bool.

    METHODS to_string
      RETURNING VALUE(rv_string) TYPE string.

    METHODS get_extension
      RETURNING VALUE(rv_extension) TYPE string.

    METHODS get_mime_type
      RETURNING VALUE(rv_mime_type) TYPE string.

    METHODS get_mime_kind
      RETURNING VALUE(rv_mime_kind) TYPE string.

    METHODS get_mime_sub
      RETURNING VALUE(rv_mime_sub) TYPE string.

    CLASS-METHODS new_type
      IMPORTING iv_ext         TYPE string
                iv_mime        TYPE string
      RETURNING VALUE(ro_type) TYPE REF TO zcl_filetype_type.

  PRIVATE SECTION.
    DATA mv_extension TYPE string.
    DATA mv_mime_type TYPE string.
    DATA mv_mime_kind TYPE string.
    DATA mv_mime_sub  TYPE string.

    TYPES: BEGIN OF ty_s_registry,
             ext      TYPE string,
             instance TYPE REF TO zcl_filetype_type,
           END OF ty_s_registry.
    TYPES ty_t_registry TYPE HASHED TABLE OF ty_s_registry WITH UNIQUE KEY ext.

    CLASS-DATA gt_registry TYPE ty_t_registry.
ENDCLASS.


CLASS zcl_filetype_type IMPLEMENTATION.
  METHOD constructor.
    mv_extension = iv_ext.
    mv_mime_type = iv_mime.

    FIND REGEX '^([^/]+)/(.+)$' IN iv_mime SUBMATCHES mv_mime_kind mv_mime_sub.
    IF sy-subrc <> 0.
      mv_mime_kind = iv_mime.
      mv_mime_sub  = ''.
    ENDIF.
  ENDMETHOD.

  METHOD new_type.
    FIELD-SYMBOLS <fs_registry> LIKE LINE OF gt_registry.
    DATA lv_ext  TYPE string.
    DATA lv_mime TYPE string.

    lv_ext  = to_lower( iv_ext ).
    lv_mime = to_lower( iv_mime ).

    ASSIGN gt_registry[ ext = lv_ext ] TO <fs_registry>.
    IF sy-subrc <> 0.
      INSERT VALUE #( ext      = lv_ext
                      instance = NEW #( iv_ext  = lv_ext
                                        iv_mime = lv_mime ) )
             INTO TABLE gt_registry ASSIGNING <fs_registry>.
    ENDIF.

    ro_type = <fs_registry>-instance.
  ENDMETHOD.

  METHOD is_image.
    rv_is_image = xsdbool( mv_mime_kind = 'image' ).
  ENDMETHOD.

  METHOD is_video.
    rv_is_video = xsdbool( mv_mime_kind = 'video' ).
  ENDMETHOD.

  METHOD is_audio.
    rv_is_audio = xsdbool( mv_mime_kind = 'audio' ).
  ENDMETHOD.

  METHOD is_archive.
    rv_is_archive = xsdbool( mv_mime_type = 'application/x-tar'
                             OR mv_mime_type = 'application/zip'
                             OR mv_mime_type = 'application/gzip'
                             OR mv_mime_type = 'application/x-bzip2'
                             OR mv_mime_type = 'application/x-7z-compressed'
                             OR mv_mime_type = 'application/x-xz'
                             OR mv_mime_type = 'application/zstd'
                             OR mv_mime_type = 'application/vnd.rar'
                             OR mv_mime_type = 'application/epub+zip'
                             OR mv_mime_type = 'application/x-compress'
                             OR mv_mime_type = 'application/x-lzip'
                             OR mv_mime_type = 'application/x-rpm'
                             OR mv_mime_type = 'application/x-unix-archive'
                             OR mv_mime_type = 'application/x-nintendo-nes-rom'
                             OR mv_mime_type = 'application/x-google-chrome-extension'
                             OR mv_mime_type = 'application/vnd.ms-cab-compressed'
                             OR mv_mime_type = 'application/vnd.debian.binary-package'
                             OR mv_mime_type = 'application/x-iso9660-image'
                             OR mv_mime_type = 'application/x-mach-binary'
                             OR mv_mime_type = 'application/vnd.apache.parquet' ).
  ENDMETHOD.

  METHOD is_document.
    rv_is_document = xsdbool( mv_mime_kind  = 'text'
                              OR mv_mime_type CP 'application/msword*'
                              OR mv_mime_type CP 'application/vnd.ms-excel*'
                              OR mv_mime_type CP 'application/vnd.ms-powerpoint*'
                              OR mv_mime_type CP 'application/vnd.openxmlformats-officedocument*'
                              OR mv_mime_type CP 'application/vnd.oasis.opendocument*'
                              OR mv_mime_type  = 'application/pdf'
                              OR mv_mime_type  = 'application/rtf' ).
  ENDMETHOD.

  METHOD is_font.
    rv_is_font = xsdbool( mv_mime_kind  = 'font'
                          OR mv_mime_type CP 'application/font-*'
                          OR mv_mime_type  = 'application/font-sfnt' ).
  ENDMETHOD.

  METHOD is_application.
    rv_is_application = xsdbool( mv_mime_type  = 'application/wasm'
                                 OR mv_mime_type CP 'application/vnd.android.*' ).
  ENDMETHOD.

  METHOD to_string.
    rv_string = |{ mv_extension } ({ mv_mime_type })|.
  ENDMETHOD.

  METHOD get_extension.
    rv_extension = mv_extension.
  ENDMETHOD.

  METHOD get_mime_type.
    rv_mime_type = mv_mime_type.
  ENDMETHOD.

  METHOD get_mime_kind.
    rv_mime_kind = mv_mime_kind.
  ENDMETHOD.

  METHOD get_mime_sub.
    rv_mime_sub = mv_mime_sub.
  ENDMETHOD.
ENDCLASS.
