CLASS zcl_filetype_detector DEFINITION PUBLIC FINAL CREATE PRIVATE.
  PUBLIC SECTION.
    TYPES:
      BEGIN OF ty_s_detector_entry,
        type     TYPE REF TO zcl_filetype_type,
        detector TYPE REF TO zif_filetype_detector,
      END OF ty_s_detector_entry,
      ty_t_detector_list TYPE STANDARD TABLE OF ty_s_detector_entry WITH EMPTY KEY.

    TYPES ty_t_type_list TYPE STANDARD TABLE OF REF TO zcl_filetype_type WITH EMPTY KEY.

    CLASS-METHODS class_constructor.

    CLASS-METHODS possible_types
      IMPORTING iv_buffer       TYPE xstring
      RETURNING VALUE(rt_types) TYPE ty_t_type_list.

    CLASS-METHODS detect
      IMPORTING iv_buffer      TYPE xstring
      RETURNING VALUE(ro_type) TYPE REF TO zcl_filetype_type.

    CLASS-METHODS get
      IMPORTING iv_data        TYPE xstring
      RETURNING VALUE(ro_type) TYPE REF TO zcl_filetype_type.

    CLASS-METHODS is_detected
      IMPORTING iv_buffer          TYPE xstring
      RETURNING VALUE(rv_detected) TYPE abap_bool.

    CLASS-METHODS is_image
      IMPORTING iv_buffer          TYPE xstring
      RETURNING VALUE(rv_detected) TYPE abap_bool.

    CLASS-METHODS is_video
      IMPORTING iv_buffer          TYPE xstring
      RETURNING VALUE(rv_detected) TYPE abap_bool.

    CLASS-METHODS is_audio
      IMPORTING iv_buffer          TYPE xstring
      RETURNING VALUE(rv_detected) TYPE abap_bool.

    CLASS-METHODS is_archive
      IMPORTING iv_buffer          TYPE xstring
      RETURNING VALUE(rv_detected) TYPE abap_bool.

    CLASS-METHODS is_document
      IMPORTING iv_buffer          TYPE xstring
      RETURNING VALUE(rv_detected) TYPE abap_bool.

    CLASS-METHODS is_font
      IMPORTING iv_buffer          TYPE xstring
      RETURNING VALUE(rv_detected) TYPE abap_bool.

    CLASS-METHODS is_application
      IMPORTING iv_buffer          TYPE xstring
      RETURNING VALUE(rv_detected) TYPE abap_bool.

    CLASS-METHODS is_supported
      IMPORTING iv_ext             TYPE string
      RETURNING VALUE(rv_detected) TYPE abap_bool.

    CLASS-METHODS is_mime_supported
      IMPORTING iv_mime            TYPE string
      RETURNING VALUE(rv_detected) TYPE abap_bool.

    CLASS-METHODS add_detector
      IMPORTING io_type     TYPE REF TO zcl_filetype_type
                io_detector TYPE REF TO zif_filetype_detector.

    CLASS-METHODS get_type
      IMPORTING iv_ext         TYPE string
      RETURNING VALUE(ro_type) TYPE REF TO zcl_filetype_type.

  PRIVATE SECTION.
    CLASS-DATA gt_detectors TYPE ty_t_detector_list.
ENDCLASS.


CLASS zcl_filetype_detector IMPLEMENTATION.
  METHOD class_constructor.
    "------------------------------------------------------------------
    " Image detectors
    "------------------------------------------------------------------
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'jpg'
                                                             iv_mime = 'image/jpeg' )
                  io_detector = NEW zcl_filetype_jpg( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'jp2'
                                                             iv_mime = 'image/jp2' )
                  io_detector = NEW zcl_filetype_jp2( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'png'
                                                             iv_mime = 'image/png' )
                  io_detector = NEW zcl_filetype_png( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'gif'
                                                             iv_mime = 'image/gif' )
                  io_detector = NEW zcl_filetype_gif( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'webp'
                                                             iv_mime = 'image/webp' )
                  io_detector = NEW zcl_filetype_webp( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'cr2'
                                                             iv_mime = 'image/x-canon-cr2' )
                  io_detector = NEW zcl_filetype_cr2( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'tif'
                                                             iv_mime = 'image/tiff' )
                  io_detector = NEW zcl_filetype_tif( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'bmp'
                                                             iv_mime = 'image/bmp' )
                  io_detector = NEW zcl_filetype_bmp( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'jxr'
                                                             iv_mime = 'image/vnd.ms-photo' )
                  io_detector = NEW zcl_filetype_jxr( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'psd'
                                                             iv_mime = 'image/vnd.adobe.photoshop' )
                  io_detector = NEW zcl_filetype_psd( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'ico'
                                                             iv_mime = 'image/vnd.microsoft.icon' )
                  io_detector = NEW zcl_filetype_ico( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'heif'
                                                             iv_mime = 'image/heif' )
                  io_detector = NEW zcl_filetype_heif( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'dwg'
                                                             iv_mime = 'image/vnd.dwg' )
                  io_detector = NEW zcl_filetype_dwg( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'exr'
                                                             iv_mime = 'image/x-exr' )
                  io_detector = NEW zcl_filetype_exr( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'avif'
                                                             iv_mime = 'image/avif' )
                  io_detector = NEW zcl_filetype_avif( ) ).

    "------------------------------------------------------------------
    " Video detectors
    "------------------------------------------------------------------
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'mp4'
                                                             iv_mime = 'video/mp4' )
                  io_detector = NEW zcl_filetype_mp4( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'm4v'
                                                             iv_mime = 'video/x-m4v' )
                  io_detector = NEW zcl_filetype_m4v( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'mkv'
                                                             iv_mime = 'video/x-matroska' )
                  io_detector = NEW zcl_filetype_mkv( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'webm'
                                                             iv_mime = 'video/webm' )
                  io_detector = NEW zcl_filetype_webm( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'mov'
                                                             iv_mime = 'video/quicktime' )
                  io_detector = NEW zcl_filetype_mov( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'avi'
                                                             iv_mime = 'video/x-msvideo' )
                  io_detector = NEW zcl_filetype_avi( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'wmv'
                                                             iv_mime = 'video/x-ms-wmv' )
                  io_detector = NEW zcl_filetype_wmv( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'mpg'
                                                             iv_mime = 'video/mpeg' )
                  io_detector = NEW zcl_filetype_mpg( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'flv'
                                                             iv_mime = 'video/x-flv' )
                  io_detector = NEW zcl_filetype_flv( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = '3gp'
                                                             iv_mime = 'video/3gpp' )
                  io_detector = NEW zcl_filetype_3gp( ) ).

    "------------------------------------------------------------------
    " Audio detectors
    "------------------------------------------------------------------
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'mid'
                                                             iv_mime = 'audio/midi' )
                  io_detector = NEW zcl_filetype_mid( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'mp3'
                                                             iv_mime = 'audio/mpeg' )
                  io_detector = NEW zcl_filetype_mp3( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'm4a'
                                                             iv_mime = 'audio/mp4' )
                  io_detector = NEW zcl_filetype_m4a( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'ogg'
                                                             iv_mime = 'audio/ogg' )
                  io_detector = NEW zcl_filetype_ogg( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'flac'
                                                             iv_mime = 'audio/x-flac' )
                  io_detector = NEW zcl_filetype_flac( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'wav'
                                                             iv_mime = 'audio/x-wav' )
                  io_detector = NEW zcl_filetype_wav( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'amr'
                                                             iv_mime = 'audio/amr' )
                  io_detector = NEW zcl_filetype_amr( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'aac'
                                                             iv_mime = 'audio/aac' )
                  io_detector = NEW zcl_filetype_aac( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'aiff'
                                                             iv_mime = 'audio/x-aiff' )
                  io_detector = NEW zcl_filetype_aiff( ) ).

    "------------------------------------------------------------------
    " Archive detectors
    "------------------------------------------------------------------
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'epub'
                                                             iv_mime = 'application/epub+zip' )
                  io_detector = NEW zcl_filetype_epub( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'zip'
                                                             iv_mime = 'application/zip' )
                  io_detector = NEW zcl_filetype_zip( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'tar'
                                                             iv_mime = 'application/x-tar' )
                  io_detector = NEW zcl_filetype_tar( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'rar'
                                                             iv_mime = 'application/vnd.rar' )
                  io_detector = NEW zcl_filetype_rar( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'gz'
                                                             iv_mime = 'application/gzip' )
                  io_detector = NEW zcl_filetype_gz( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'bz2'
                                                             iv_mime = 'application/x-bzip2' )
                  io_detector = NEW zcl_filetype_bz2( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = '7z'
                                                             iv_mime = 'application/x-7z-compressed' )
                  io_detector = NEW zcl_filetype_7z( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'xz'
                                                             iv_mime = 'application/x-xz' )
                  io_detector = NEW zcl_filetype_xz( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'zst'
                                                             iv_mime = 'application/zstd' )
                  io_detector = NEW zcl_filetype_zst( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'pdf'
                                                             iv_mime = 'application/pdf' )
                  io_detector = NEW zcl_filetype_pdf( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'exe'
                                                             iv_mime = 'application/vnd.microsoft.portable-executable' )
                  io_detector = NEW zcl_filetype_exe( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'swf'
                                                             iv_mime = 'application/x-shockwave-flash' )
                  io_detector = NEW zcl_filetype_swf( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'rtf'
                                                             iv_mime = 'application/rtf' )
                  io_detector = NEW zcl_filetype_rtf( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'eot'
                                                             iv_mime = 'application/octet-stream' )
                  io_detector = NEW zcl_filetype_eot( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'ps'
                                                             iv_mime = 'application/postscript' )
                  io_detector = NEW zcl_filetype_ps( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'sqlite'
                                                             iv_mime = 'application/vnd.sqlite3' )
                  io_detector = NEW zcl_filetype_sqlite( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'nes'
                                                             iv_mime = 'application/x-nintendo-nes-rom' )
                  io_detector = NEW zcl_filetype_nes( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'crx'
                                                             iv_mime = 'application/x-google-chrome-extension' )
                  io_detector = NEW zcl_filetype_crx( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'cab'
                                                             iv_mime = 'application/vnd.ms-cab-compressed' )
                  io_detector = NEW zcl_filetype_cab( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'deb'
                                                             iv_mime = 'application/vnd.debian.binary-package' )
                  io_detector = NEW zcl_filetype_deb( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'ar'
                                                             iv_mime = 'application/x-unix-archive' )
                  io_detector = NEW zcl_filetype_ar( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'Z'
                                                             iv_mime = 'application/x-compress' )
                  io_detector = NEW zcl_filetype_z( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'lz'
                                                             iv_mime = 'application/x-lzip' )
                  io_detector = NEW zcl_filetype_lz( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'rpm'
                                                             iv_mime = 'application/x-rpm' )
                  io_detector = NEW zcl_filetype_rpm( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'elf'
                                                             iv_mime = 'application/x-executable' )
                  io_detector = NEW zcl_filetype_elf( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'dcm'
                                                             iv_mime = 'application/dicom' )
                  io_detector = NEW zcl_filetype_dcm( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'iso'
                                                             iv_mime = 'application/x-iso9660-image' )
                  io_detector = NEW zcl_filetype_iso( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'macho'
                                                             iv_mime = 'application/x-mach-binary' )
                  io_detector = NEW zcl_filetype_macho( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'parquet'
                                                             iv_mime = 'application/vnd.apache.parquet' )
                  io_detector = NEW zcl_filetype_parquet( ) ).

    "------------------------------------------------------------------
    " Document detectors
    "------------------------------------------------------------------
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'doc'
                                                             iv_mime = 'application/msword' )
                  io_detector = NEW zcl_filetype_doc( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type(
                      iv_ext  = 'docx'
                      iv_mime = 'application/vnd.openxmlformats-officedocument.wordprocessingml.document' )
                  io_detector = NEW zcl_filetype_docx( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'xls'
                                                             iv_mime = 'application/vnd.ms-excel' )
                  io_detector = NEW zcl_filetype_xls( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type(
                                    iv_ext  = 'xlsx'
                                    iv_mime = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' )
                  io_detector = NEW zcl_filetype_xlsx( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'ppt'
                                                             iv_mime = 'application/vnd.ms-powerpoint' )
                  io_detector = NEW zcl_filetype_ppt( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type(
                      iv_ext  = 'pptx'
                      iv_mime = 'application/vnd.openxmlformats-officedocument.presentationml.presentation' )
                  io_detector = NEW zcl_filetype_pptx( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type(
                                    iv_ext  = 'odp'
                                    iv_mime = 'application/vnd.oasis.opendocument.presentation' )
                  io_detector = NEW zcl_filetype_odp( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type(
                                    iv_ext  = 'ods'
                                    iv_mime = 'application/vnd.oasis.opendocument.spreadsheet' )
                  io_detector = NEW zcl_filetype_ods( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'odt'
                                                             iv_mime = 'application/vnd.oasis.opendocument.text' )
                  io_detector = NEW zcl_filetype_odt( ) ).

    "------------------------------------------------------------------
    " Font detectors
    "------------------------------------------------------------------
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'woff'
                                                             iv_mime = 'application/font-woff' )
                  io_detector = NEW zcl_filetype_woff( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'woff2'
                                                             iv_mime = 'application/font-woff' )
                  io_detector = NEW zcl_filetype_woff2( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'ttf'
                                                             iv_mime = 'application/font-sfnt' )
                  io_detector = NEW zcl_filetype_ttf( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'otf'
                                                             iv_mime = 'application/font-sfnt' )
                  io_detector = NEW zcl_filetype_otf( ) ).

    "------------------------------------------------------------------
    " Application detectors
    "------------------------------------------------------------------
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'wasm'
                                                             iv_mime = 'application/wasm' )
                  io_detector = NEW zcl_filetype_wasm( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'dex'
                                                             iv_mime = 'application/vnd.android.dex' )
                  io_detector = NEW zcl_filetype_dex( ) ).
    add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'dey'
                                                             iv_mime = 'application/vnd.android.dey' )
                  io_detector = NEW zcl_filetype_dey( ) ).
  ENDMETHOD.

  METHOD add_detector.
    DATA ls_entry LIKE LINE OF gt_detectors.

    ls_entry-type     = io_type.
    ls_entry-detector = io_detector.
    INSERT ls_entry INTO gt_detectors INDEX 1.
  ENDMETHOD.

  METHOD possible_types.
    FIELD-SYMBOLS <fs_detector> LIKE LINE OF gt_detectors.

    IF xstrlen( iv_buffer ) = 0.
      RETURN.
    ENDIF.

    LOOP AT gt_detectors ASSIGNING <fs_detector>.
      IF <fs_detector>-detector->detect( iv_buffer ) = abap_true.
        INSERT <fs_detector>-type INTO TABLE rt_types.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD detect.
    FIELD-SYMBOLS <fs_detector> LIKE LINE OF gt_detectors.

    IF xstrlen( iv_buffer ) = 0.
      RETURN.
    ENDIF.

    LOOP AT gt_detectors ASSIGNING <fs_detector>.
      IF <fs_detector>-detector->detect( iv_buffer ) = abap_true.
        ro_type = <fs_detector>-type.
        RETURN.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD get.
    ro_type = detect( iv_data ).
  ENDMETHOD.

  METHOD is_detected.
    rv_detected = xsdbool( detect( iv_buffer ) IS BOUND ).
  ENDMETHOD.

  METHOD is_image.
    DATA lo_type TYPE REF TO zcl_filetype_type.

    lo_type = detect( iv_buffer ).
    rv_detected = xsdbool( lo_type IS BOUND AND lo_type->is_image( ) = abap_true ).
  ENDMETHOD.

  METHOD is_video.
    DATA lo_type TYPE REF TO zcl_filetype_type.

    lo_type = detect( iv_buffer ).
    rv_detected = xsdbool( lo_type IS BOUND AND lo_type->is_video( ) = abap_true ).
  ENDMETHOD.

  METHOD is_audio.
    DATA lo_type TYPE REF TO zcl_filetype_type.

    lo_type = detect( iv_buffer ).
    rv_detected = xsdbool( lo_type IS BOUND AND lo_type->is_audio( ) = abap_true ).
  ENDMETHOD.

  METHOD is_archive.
    DATA lo_type TYPE REF TO zcl_filetype_type.

    lo_type = detect( iv_buffer ).
    rv_detected = xsdbool( lo_type IS BOUND AND lo_type->is_archive( ) = abap_true ).
  ENDMETHOD.

  METHOD is_document.
    DATA lo_type TYPE REF TO zcl_filetype_type.

    lo_type = detect( iv_buffer ).
    rv_detected = xsdbool( lo_type IS BOUND AND lo_type->is_document( ) = abap_true ).
  ENDMETHOD.

  METHOD is_font.
    DATA lo_type TYPE REF TO zcl_filetype_type.

    lo_type = detect( iv_buffer ).
    rv_detected = xsdbool( lo_type IS BOUND AND lo_type->is_font( ) = abap_true ).
  ENDMETHOD.

  METHOD is_application.
    DATA lo_type TYPE REF TO zcl_filetype_type.

    lo_type = detect( iv_buffer ).
    rv_detected = xsdbool( lo_type IS BOUND AND lo_type->is_application( ) = abap_true ).
  ENDMETHOD.

  METHOD is_supported.
    FIELD-SYMBOLS <fs_detector> LIKE LINE OF gt_detectors.
    DATA lv_ext TYPE string.

    lv_ext = to_lower( iv_ext ).

    LOOP AT gt_detectors ASSIGNING <fs_detector>.
      IF <fs_detector>-type->get_extension( ) = lv_ext.
        rv_detected = abap_true.
        RETURN.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD is_mime_supported.
    FIELD-SYMBOLS <fs_detector> LIKE LINE OF gt_detectors.
    DATA lv_mime TYPE string.

    lv_mime = to_lower( iv_mime ).

    LOOP AT gt_detectors ASSIGNING <fs_detector>.
      IF <fs_detector>-type->get_mime_type( ) = lv_mime.
        rv_detected = abap_true.
        RETURN.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD get_type.
    FIELD-SYMBOLS <fs_detector> LIKE LINE OF gt_detectors.
    DATA lv_ext TYPE string.

    lv_ext = to_lower( iv_ext ).

    LOOP AT gt_detectors ASSIGNING <fs_detector>.
      IF <fs_detector>-type->get_extension( ) = lv_ext.
        ro_type = <fs_detector>-type.
        RETURN.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
