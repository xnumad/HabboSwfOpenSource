package com.sulake.room.object.visualization.utils
{
    import flash.utils.ByteArray;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import flash.display.BitmapDataChannel;

    public class GraphicAssetPalette 
    {
        private static var _Str_4808:Array = [];

        private var _palette:Array;
        private var _primaryColor:int = 0;
        private var _secondaryColor:int = 0;

        public function GraphicAssetPalette(k:ByteArray, _arg_2:int, _arg_3:int)
        {
            var _local_4:uint;
            var _local_5:uint;
            var _local_6:uint;
            var _local_7:uint;
            this._palette = [];
            super();
            k.position = 0;
            while (k.bytesAvailable >= 3)
            {
                _local_4 = k.readUnsignedByte();
                _local_5 = k.readUnsignedByte();
                _local_6 = k.readUnsignedByte();
                _local_7 = ((((0xFF << 24) | (_local_4 << 16)) | (_local_5 << 8)) | _local_6);
                this._palette.push(_local_7);
            }
            while (this._palette.length < 0x0100)
            {
                this._palette.push(0);
            }
            while (_Str_4808.length < 0x0100)
            {
                _Str_4808.push(0);
            }
            this._primaryColor = _arg_2;
            this._secondaryColor = _arg_3;
        }

        public function get _Str_5845():int
        {
            return this._primaryColor;
        }

        public function get _Str_6659():int
        {
            return this._secondaryColor;
        }

        public function dispose():void
        {
            this._palette = [];
        }

        public function colorizeBitmap(k:BitmapData):void
        {
            var _local_2:BitmapData = k.clone();
            k.paletteMap(k, k.rect, new Point(0, 0), _Str_4808, this._palette, _Str_4808, _Str_4808);
            k.copyChannel(_local_2, k.rect, new Point(0, 0), BitmapDataChannel.ALPHA, BitmapDataChannel.ALPHA);
            _local_2.dispose();
        }
    }
}
