CLASS ltcl_test_detector DEFINITION FOR TESTING.
  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.
ENDCLASS.


CLASS ltcl_test_detector IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool( iv_buffer = 'AABB' ).
  ENDMETHOD.
ENDCLASS.


CLASS ltcl_zcl_filetype_detector DEFINITION FINAL
  FOR TESTING RISK LEVEL HARMLESS DURATION SHORT.

  PRIVATE SECTION.
    " Image types
    METHODS test_detect_jpg        FOR TESTING.
    METHODS test_detect_png        FOR TESTING.
    METHODS test_detect_gif        FOR TESTING.
    METHODS test_detect_bmp        FOR TESTING.
    METHODS test_detect_psd        FOR TESTING.
    METHODS test_detect_ico        FOR TESTING.
    METHODS test_detect_dwg        FOR TESTING.
    METHODS test_detect_exr        FOR TESTING.
    METHODS test_detect_jp2        FOR TESTING.
    METHODS test_detect_jxr        FOR TESTING.
    METHODS test_detect_webp       FOR TESTING.
    METHODS test_detect_cr2        FOR TESTING.
    METHODS test_detect_tif        FOR TESTING.
    METHODS test_detect_heif       FOR TESTING.
    METHODS test_detect_avif       FOR TESTING.
    " Video types
    METHODS test_detect_mp4        FOR TESTING.
    METHODS test_detect_m4v        FOR TESTING.
    METHODS test_detect_mkv        FOR TESTING.
    METHODS test_detect_webm       FOR TESTING.
    METHODS test_detect_mov        FOR TESTING.
    METHODS test_detect_avi        FOR TESTING.
    METHODS test_detect_wmv        FOR TESTING.
    METHODS test_detect_mpg        FOR TESTING.
    METHODS test_detect_flv        FOR TESTING.
    METHODS test_detect_3gp        FOR TESTING.
    " Audio types
    METHODS test_detect_mid        FOR TESTING.
    METHODS test_detect_mp3        FOR TESTING.
    METHODS test_detect_m4a        FOR TESTING.
    METHODS test_detect_ogg        FOR TESTING.
    METHODS test_detect_flac       FOR TESTING.
    METHODS test_detect_wav        FOR TESTING.
    METHODS test_detect_amr        FOR TESTING.
    METHODS test_detect_aac        FOR TESTING.
    METHODS test_detect_aiff       FOR TESTING.
    " Archive types
    METHODS test_detect_zip        FOR TESTING.
    METHODS test_detect_rar        FOR TESTING.
    METHODS test_detect_gz         FOR TESTING.
    METHODS test_detect_bz2        FOR TESTING.
    METHODS test_detect_7z         FOR TESTING.
    METHODS test_detect_xz         FOR TESTING.
    METHODS test_detect_zst        FOR TESTING.
    " Application / document types
    METHODS test_detect_pdf        FOR TESTING.
    METHODS test_detect_exe        FOR TESTING.
    METHODS test_detect_swf        FOR TESTING.
    METHODS test_detect_rtf        FOR TESTING.
    METHODS test_detect_ps         FOR TESTING.
    METHODS test_detect_sqlite     FOR TESTING.
    METHODS test_detect_nes        FOR TESTING.
    METHODS test_detect_crx        FOR TESTING.
    METHODS test_detect_cab        FOR TESTING.
    METHODS test_detect_ar         FOR TESTING.
    METHODS test_detect_z          FOR TESTING.
    METHODS test_detect_lz         FOR TESTING.
    METHODS test_detect_rpm        FOR TESTING.
    METHODS test_detect_elf        FOR TESTING.
    METHODS test_detect_macho      FOR TESTING.
    METHODS test_detect_parquet    FOR TESTING.
    METHODS test_detect_ppt        FOR TESTING.
    METHODS test_detect_dcm        FOR TESTING.
    METHODS test_detect_dex        FOR TESTING.
    METHODS test_detect_doc        FOR TESTING.
    METHODS test_detect_tar        FOR TESTING.
    METHODS test_detect_eot        FOR TESTING.
    " Font types
    METHODS test_detect_woff       FOR TESTING.
    METHODS test_detect_woff2      FOR TESTING.
    METHODS test_detect_ttf        FOR TESTING.
    METHODS test_detect_otf        FOR TESTING.
    METHODS test_detect_wasm       FOR TESTING.
    " General
    METHODS test_unknown           FOR TESTING.
    METHODS test_is_image          FOR TESTING.
    METHODS test_is_document       FOR TESTING.
    METHODS test_is_supported      FOR TESTING.
    METHODS test_is_mime_supported FOR TESTING.
    METHODS test_get_type          FOR TESTING.
    METHODS test_custom_detector   FOR TESTING.
    METHODS test_possible_types    FOR TESTING.
ENDCLASS.


CLASS ltcl_zcl_filetype_detector IMPLEMENTATION.
  METHOD test_detect_jpg.
    cl_abap_unit_assert=>assert_equals( exp = 'jpg'
                                        act = zcl_filetype_detector=>detect( 'FFD8FF' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_png.
    cl_abap_unit_assert=>assert_equals( exp = 'png'
                                        act = zcl_filetype_detector=>detect( '89504E47' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_gif.
    cl_abap_unit_assert=>assert_equals( exp = 'gif'
                                        act = zcl_filetype_detector=>detect( '474946' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_bmp.
    cl_abap_unit_assert=>assert_equals( exp = 'bmp'
                                        act = zcl_filetype_detector=>detect( '424D' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_psd.
    cl_abap_unit_assert=>assert_equals( exp = 'psd'
                                        act = zcl_filetype_detector=>detect( '38425053' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_ico.
    cl_abap_unit_assert=>assert_equals( exp = 'ico'
                                        act = zcl_filetype_detector=>detect( '00000100' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_dwg.
    cl_abap_unit_assert=>assert_equals( exp = 'dwg'
                                        act = zcl_filetype_detector=>detect( '41433130' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_exr.
    cl_abap_unit_assert=>assert_equals( exp = 'exr'
                                        act = zcl_filetype_detector=>detect( '762F3101' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_jp2.
    cl_abap_unit_assert=>assert_equals(
        exp = 'jp2'
        act = zcl_filetype_detector=>detect( '0000000C6A5020200D0A870A00' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_jxr.
    cl_abap_unit_assert=>assert_equals( exp = 'jxr'
                                        act = zcl_filetype_detector=>detect( '494942' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_webp.
    cl_abap_unit_assert=>assert_equals(
        exp = 'webp'
        act = zcl_filetype_detector=>detect( '000000000000000057454250' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_cr2.
    cl_abap_unit_assert=>assert_equals(
        exp = 'cr2'
        act = zcl_filetype_detector=>detect( '49492A0000000000435202' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_tif.
    cl_abap_unit_assert=>assert_equals(
        exp = 'tif'
        act = zcl_filetype_detector=>detect( '4D4D002A0000000000000000' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_heif.
    cl_abap_unit_assert=>assert_equals(
        exp = 'heif'
        act = zcl_filetype_detector=>detect( '000000006674797068656963' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_avif.
    cl_abap_unit_assert=>assert_equals(
        exp = 'avif'
        act = zcl_filetype_detector=>detect( '000000006674797061766966' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_mp4.
    cl_abap_unit_assert=>assert_equals(
        exp = 'mp4'
        act = zcl_filetype_detector=>detect( '000000006674797061766331' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_m4v.
    cl_abap_unit_assert=>assert_equals(
        exp = 'm4v'
        act = zcl_filetype_detector=>detect( '00000000667479704D345600' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_mkv.
    cl_abap_unit_assert=>assert_equals(
        exp = 'mkv'
        act = zcl_filetype_detector=>detect( '1A45DFA36D6174726F736B61' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_webm.
    cl_abap_unit_assert=>assert_equals(
        exp = 'webm'
        act = zcl_filetype_detector=>detect( '1A45DFA3000000007765626D' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_mov.
    cl_abap_unit_assert=>assert_equals(
        exp = 'mov'
        act = zcl_filetype_detector=>detect( '00000014667479707174202000000000' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_avi.
    cl_abap_unit_assert=>assert_equals(
        exp = 'avi'
        act = zcl_filetype_detector=>detect( '5249464600000000415649' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_wmv.
    cl_abap_unit_assert=>assert_equals(
        exp = 'wmv'
        act = zcl_filetype_detector=>detect( '3026B2758E66CF11A6D9' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_mpg.
    cl_abap_unit_assert=>assert_equals( exp = 'mpg'
                                        act = zcl_filetype_detector=>detect( '000001BA' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_flv.
    cl_abap_unit_assert=>assert_equals( exp = 'flv'
                                        act = zcl_filetype_detector=>detect( '464C5601' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_3gp.
    cl_abap_unit_assert=>assert_equals(
        exp = '3gp'
        act = zcl_filetype_detector=>detect( '0000000066747970336770' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_mid.
    cl_abap_unit_assert=>assert_equals( exp = 'mid'
                                        act = zcl_filetype_detector=>detect( '4D546864' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_mp3.
    cl_abap_unit_assert=>assert_equals( exp = 'mp3'
                                        act = zcl_filetype_detector=>detect( '494433' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_m4a.
    cl_abap_unit_assert=>assert_equals(
        exp = 'm4a'
        act = zcl_filetype_detector=>detect( '00000000667479704D344100' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_ogg.
    cl_abap_unit_assert=>assert_equals( exp = 'ogg'
                                        act = zcl_filetype_detector=>detect( '4F676753' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_flac.
    cl_abap_unit_assert=>assert_equals( exp = 'flac'
                                        act = zcl_filetype_detector=>detect( '664C6143' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_wav.
    cl_abap_unit_assert=>assert_equals(
        exp = 'wav'
        act = zcl_filetype_detector=>detect( '524946460000000057415645' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_amr.
    cl_abap_unit_assert=>assert_equals(
        exp = 'amr'
        act = zcl_filetype_detector=>detect( '2321414D520A000000000000' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_aac.
    cl_abap_unit_assert=>assert_equals( exp = 'aac'
                                        act = zcl_filetype_detector=>detect( 'FFF1' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_aiff.
    cl_abap_unit_assert=>assert_equals(
        exp = 'aiff'
        act = zcl_filetype_detector=>detect( '464F524D0000000041494646' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_zip.
    cl_abap_unit_assert=>assert_equals( exp = 'zip'
                                        act = zcl_filetype_detector=>detect( '504B0304' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_rar.
    cl_abap_unit_assert=>assert_equals( exp = 'rar'
                                        act = zcl_filetype_detector=>detect( '526172211A0700' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_gz.
    cl_abap_unit_assert=>assert_equals( exp = 'gz'
                                        act = zcl_filetype_detector=>detect( '1F8B08' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_bz2.
    cl_abap_unit_assert=>assert_equals( exp = 'bz2'
                                        act = zcl_filetype_detector=>detect( '425A68' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_7z.
    cl_abap_unit_assert=>assert_equals( exp = '7z'
                                        act = zcl_filetype_detector=>detect( '377ABCAF271C' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_xz.
    cl_abap_unit_assert=>assert_equals( exp = 'xz'
                                        act = zcl_filetype_detector=>detect( 'FD377A585A00' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_zst.
    cl_abap_unit_assert=>assert_equals( exp = 'zst'
                                        act = zcl_filetype_detector=>detect( '28B52FFD' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_pdf.
    cl_abap_unit_assert=>assert_equals( exp = 'pdf'
                                        act = zcl_filetype_detector=>detect( '25504446' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_exe.
    cl_abap_unit_assert=>assert_equals( exp = 'exe'
                                        act = zcl_filetype_detector=>detect( '4D5A' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_swf.
    cl_abap_unit_assert=>assert_equals( exp = 'swf'
                                        act = zcl_filetype_detector=>detect( '435753' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_rtf.
    cl_abap_unit_assert=>assert_equals( exp = 'rtf'
                                        act = zcl_filetype_detector=>detect( '7B5C727466' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_ps.
    cl_abap_unit_assert=>assert_equals( exp = 'ps'
                                        act = zcl_filetype_detector=>detect( '2521' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_sqlite.
    cl_abap_unit_assert=>assert_equals( exp = 'sqlite'
                                        act = zcl_filetype_detector=>detect( '53514C69' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_nes.
    cl_abap_unit_assert=>assert_equals( exp = 'nes'
                                        act = zcl_filetype_detector=>detect( '4E45531A' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_crx.
    cl_abap_unit_assert=>assert_equals( exp = 'crx'
                                        act = zcl_filetype_detector=>detect( '43723234' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_cab.
    cl_abap_unit_assert=>assert_equals( exp = 'cab'
                                        act = zcl_filetype_detector=>detect( '49536328' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_ar.
    cl_abap_unit_assert=>assert_equals( exp = 'ar'
                                        act = zcl_filetype_detector=>detect( '213C617263683E' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_z.
    cl_abap_unit_assert=>assert_equals( exp = 'z'
                                        act = zcl_filetype_detector=>detect( '1FA0' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_lz.
    cl_abap_unit_assert=>assert_equals( exp = 'lz'
                                        act = zcl_filetype_detector=>detect( '4C5A4950' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_rpm.
    DATA lv_data TYPE xstring.

    lv_data = 'EDABEEDB'.
    DO 93 TIMES.
      lv_data = |{ lv_data }00|.
    ENDDO.
    cl_abap_unit_assert=>assert_equals( exp = 'rpm'
                                        act = zcl_filetype_detector=>detect( lv_data )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_elf.
    DATA lv_data TYPE xstring.

    lv_data = '7F454C46'.
    DO 49 TIMES.
      lv_data = |{ lv_data }00|.
    ENDDO.
    cl_abap_unit_assert=>assert_equals( exp = 'elf'
                                        act = zcl_filetype_detector=>detect( lv_data )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_macho.
    cl_abap_unit_assert=>assert_equals( exp = 'macho'
                                        act = zcl_filetype_detector=>detect( 'FEEDFACF' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_parquet.
    cl_abap_unit_assert=>assert_equals( exp = 'parquet'
                                        act = zcl_filetype_detector=>detect( '50415231' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_ppt.
    cl_abap_unit_assert=>assert_equals( exp = 'ppt'
                                        act = zcl_filetype_detector=>detect( 'D0CF11E0' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_dcm.
    DATA lv_dcm_data TYPE xstring.
    DATA lv_pad      TYPE x LENGTH 128.

    lv_dcm_data = |{ lv_pad }4449434D|.
    cl_abap_unit_assert=>assert_equals( exp = 'dcm'
                                        act = zcl_filetype_detector=>detect( lv_dcm_data )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_dex.
    DATA lv_dex_data TYPE xstring.

    lv_dex_data = '6465780A000000000000000000000000000000000000000000000000000000000000000070'.
    cl_abap_unit_assert=>assert_equals( exp = 'dex'
                                        act = zcl_filetype_detector=>detect( lv_dex_data )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_woff.
    cl_abap_unit_assert=>assert_equals( exp = 'woff'
                                        act = zcl_filetype_detector=>detect( '774F464600010000' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_woff2.
    cl_abap_unit_assert=>assert_equals( exp = 'woff2'
                                        act = zcl_filetype_detector=>detect( '774F463200010000' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_ttf.
    cl_abap_unit_assert=>assert_equals( exp = 'ttf'
                                        act = zcl_filetype_detector=>detect( '0001000000' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_otf.
    cl_abap_unit_assert=>assert_equals( exp = 'otf'
                                        act = zcl_filetype_detector=>detect( '4F54544F00' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_wasm.
    cl_abap_unit_assert=>assert_equals( exp = 'wasm'
                                        act = zcl_filetype_detector=>detect( '0061736D01000000' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_unknown.
    cl_abap_unit_assert=>assert_initial( zcl_filetype_detector=>detect( '00000000' ) ).
  ENDMETHOD.

  METHOD test_is_image.
    cl_abap_unit_assert=>assert_true( zcl_filetype_detector=>is_image( 'FFD8FF' ) ).
    cl_abap_unit_assert=>assert_false( zcl_filetype_detector=>is_image( '25504446' ) ).
  ENDMETHOD.

  METHOD test_is_document.
    cl_abap_unit_assert=>assert_true( zcl_filetype_detector=>is_document( '25504446' ) ).
    cl_abap_unit_assert=>assert_false( zcl_filetype_detector=>is_document( 'FFD8FF' ) ).
  ENDMETHOD.

  METHOD test_is_supported.
    cl_abap_unit_assert=>assert_true( zcl_filetype_detector=>is_supported( 'jpg' ) ).
    cl_abap_unit_assert=>assert_true( zcl_filetype_detector=>is_supported( 'PNG' ) ).
    cl_abap_unit_assert=>assert_false( zcl_filetype_detector=>is_supported( 'xyz' ) ).
  ENDMETHOD.

  METHOD test_is_mime_supported.
    cl_abap_unit_assert=>assert_true( zcl_filetype_detector=>is_mime_supported( 'image/jpeg' ) ).
    cl_abap_unit_assert=>assert_false( zcl_filetype_detector=>is_mime_supported( 'image/unknown' ) ).
  ENDMETHOD.

  METHOD test_get_type.
    cl_abap_unit_assert=>assert_equals( exp = 'jpg'
                                        act = zcl_filetype_detector=>get_type( 'jpg' )->get_extension( ) ).
    cl_abap_unit_assert=>assert_not_initial( zcl_filetype_detector=>get_type( 'JPG' ) ).
    cl_abap_unit_assert=>assert_initial( zcl_filetype_detector=>get_type( 'unknown' ) ).
  ENDMETHOD.

  METHOD test_custom_detector.
    DATA(lo_type) = zcl_filetype_type=>new_type( iv_ext  = 'test'
                                                 iv_mime = 'application/x-test' ).
    zcl_filetype_detector=>add_detector( io_type     = lo_type
                                         io_detector = NEW ltcl_test_detector( ) ).

    cl_abap_unit_assert=>assert_equals( exp = 'test'
                                        act = zcl_filetype_detector=>detect( 'AABB' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_doc.
    DATA lv_header TYPE x LENGTH 4   VALUE 'D0CF11E0'.
    DATA lv_pad    TYPE x LENGTH 508.
    DATA lv_end    TYPE x LENGTH 2   VALUE 'ECA5'.
    DATA lv_data   TYPE xstring.

    lv_data = lv_header && lv_pad && lv_end.
    cl_abap_unit_assert=>assert_equals( exp = 'doc'
                                        act = zcl_filetype_detector=>detect( lv_data )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_tar.
    DATA lv_pad  TYPE x LENGTH 257.
    DATA lv_end  TYPE x LENGTH 5 VALUE '7573746172'.
    DATA lv_data TYPE xstring.

    lv_data = lv_pad && lv_end.
    cl_abap_unit_assert=>assert_equals( exp = 'tar'
                                        act = zcl_filetype_detector=>detect( lv_data )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_detect_eot.
    cl_abap_unit_assert=>assert_equals(
        exp = 'eot'
        act = zcl_filetype_detector=>detect( '000000000000000002000100000000000000000000000000000000000000000000004C50' )->get_extension( ) ).
  ENDMETHOD.

  METHOD test_possible_types.
    DATA lt_types TYPE zcl_filetype_detector=>ty_t_type_list.

    lt_types = zcl_filetype_detector=>possible_types( 'D0CF11E0' ).
    cl_abap_unit_assert=>assert_equals( exp = 2
                                        act = lines( lt_types ) ).

    lt_types = zcl_filetype_detector=>possible_types( 'FFD8FFE0' ).
    cl_abap_unit_assert=>assert_equals( exp = 1
                                        act = lines( lt_types ) ).

    lt_types = zcl_filetype_detector=>possible_types( '00' ).
    cl_abap_unit_assert=>assert_equals( exp = 0
                                        act = lines( lt_types ) ).
  ENDMETHOD.
ENDCLASS.
