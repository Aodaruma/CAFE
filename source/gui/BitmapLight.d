/+ ------------------------------------------------------------ +
 + Author : aoitofu <aoitofu@dr.com>                            +
 + This is part of CAFE ( https://github.com/aoitofu/CAFE ).    +
 + ------------------------------------------------------------ +
 + Please see /LICENSE.                                         +
 + ------------------------------------------------------------ +/
module cafe.gui.BitmapLight;
import cafe.renderer.graphics.Bitmap,
       cafe.renderer.graphics.Color,
       cafe.gui.ColorDrawBufNoGC;
import std.conv;
import dlangui;

debug = 0;

/+ BMPViewerコンポーネントに直接渡せるBitmapクラス +/
class BitmapLight : ColorDrawBufNoGC
{
    public:
        /+ 通常のBMPから生成 +/
        this ( BMP src )
        {
            super( src.width.to!int, src.height.to!int );

            auto len = src.width * src.height;
            auto bmp = src.bitmap.ptr;
            for ( auto i = 0; i < len; i++ )
                _buf[i] = bmp[i].toHex;
            invertAlpha;
        }
}
