# ABAP File Type Detector

An ABAP file type detection library that identifies file formats by reading **magic byte** signatures. Detects 75+ formats and classifies them into categories (image, video, audio, archive, document, font, application).

## Features

- **75+ file format** support
- Magic byte/signature based detection
- MIME type and category classification
- Static API - no instance required
- Extensible architecture (custom detectors can be added)
- Pure ABAP Objects

## Usage

```abap
" Detect file type
DATA(lo_type) = zcl_filetype_detector=>detect( lv_buffer ).

" Get extension
DATA(lv_ext) = lo_type->get_extension( ).  " 'jpg', 'png', 'pdf'...

" Get MIME type
DATA(lv_mime) = lo_type->get_mime_type( ). " 'image/jpeg'

" Category checks
lo_type->is_image( )
lo_type->is_video( )
lo_type->is_audio( )
lo_type->is_archive( )
lo_type->is_document( )
lo_type->is_font( )
lo_type->is_application( )

" Convenience methods
zcl_filetype_detector=>is_image( lv_buffer )
zcl_filetype_detector=>is_detected( lv_buffer )

" Extension/MIME query
zcl_filetype_detector=>is_supported( 'jpg' )
zcl_filetype_detector=>is_mime_supported( 'image/jpeg' )
zcl_filetype_detector=>get_type( 'jpg' )

" List all possible types (multiple matches possible)
lt_types = zcl_filetype_detector=>possible_types( lv_buffer )
```

## Supported Formats

| Category | Formats |
|----------|---------|
| **Image** | AVIF, BMP, CR2, DWG, EXR, GIF, HEIF, ICO, JP2, JPG, JXR, PNG, PSD, TIF, WebP |
| **Video** | 3GP, AVI, FLV, M4V, MKV, MOV, MP4, MPG, WebM, WMV |
| **Audio** | AAC, AIFF, AMR, FLAC, M4A, MID, MP3, OGG, WAV |
| **Archive** | 7Z, AR, BZ2, CAB, CRX, DEB, EPUB, GZ, ISO, LZ, Mach-O, NES, PARQUET, RAR, RPM, TAR, XZ, Z, ZIP, ZST |
| **Document** | DOC, DOCX, ODP, ODS, ODT, PDF, PPT, PPTX, PS, RTF, XLS, XLSX |
| **Font** | EOT, OTF, TTF, WOFF, WOFF2 |
| **Application** | DEX, DEY, ELF, EXE, Mach-O, SWF, SQLite, WASM |

## Development

### Requirements

- Node.js 16+
- npm

### Setup

```bash
npm install
```

### Lint

```bash
npm run lint
```

### Test

```bash
npm run unit
```

## Extending

To add a new file type:

1. Create a class implementing `zif_filetype_detector`
2. Register the detector in `zcl_filetype_detector=>class_constructor`

```abap
CLASS zcl_filetype_xyz DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES zif_filetype_detector.
ENDCLASS.

CLASS zcl_filetype_xyz IMPLEMENTATION.
  METHOD zif_filetype_detector~detect.
    rv_detected = xsdbool( iv_buffer+0(4) = 'XXXXXX' ).
  ENDMETHOD.
ENDCLASS.
```

```abap
" Inside class_constructor:
add_detector( io_type     = zcl_filetype_type=>new_type( iv_ext  = 'xyz'
                                                         iv_mime = 'application/x-xyz' )
              io_detector = NEW zcl_filetype_xyz( ) ).
```

## License

MIT
