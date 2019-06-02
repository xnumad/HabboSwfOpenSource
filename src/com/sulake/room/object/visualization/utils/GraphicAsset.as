package com.sulake.room.object.visualization.utils
{
    import __AS3__.vec.Vector;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.assets.IAsset;
    import flash.display.BitmapData;
    import __AS3__.vec.*;

    public class GraphicAsset implements IGraphicAsset 
    {
        private static const _POOL:Vector.<GraphicAsset> = new Vector.<GraphicAsset>();

        private var _assetName:String;
        private var _libraryAssetName:String;
        private var _asset:BitmapDataAsset;
        private var _flipH:Boolean;
        private var _flipV:Boolean;
        private var _usesPalette:Boolean;
        private var _offsetX:int;
        private var _offsetY:int;
        private var _width:int;
        private var _height:int;
        private var _initialized:Boolean;


        public static function _Str_2363(k:String, _arg_2:String, _arg_3:IAsset, _arg_4:Boolean, _arg_5:Boolean, _arg_6:int, _arg_7:int, _arg_8:Boolean=false):GraphicAsset
        {
            var _local_9:GraphicAsset = ((_POOL.length > 0) ? _POOL.pop() : new (GraphicAsset)());
            _local_9._assetName = k;
            _local_9._libraryAssetName = _arg_2;
            var _local_10:BitmapDataAsset = (_arg_3 as BitmapDataAsset);
            if (_local_10 != null)
            {
                _local_9._asset = _local_10;
                _local_9._initialized = false;
            }
            else
            {
                _local_9._asset = null;
                _local_9._initialized = true;
            }
            _local_9._flipH = _arg_4;
            _local_9._flipV = _arg_5;
            _local_9._offsetX = _arg_6;
            _local_9._offsetY = _arg_7;
            _local_9._usesPalette = _arg_8;
            return _local_9;
        }


        public function recycle():void
        {
            this._asset = null;
            _POOL.push(this);
        }

        private function initialize():void
        {
            var k:BitmapData;
            if (((!(this._initialized)) && (!(this._asset == null))))
            {
                k = (this._asset.content as BitmapData);
                if (k != null)
                {
                    this._width = k.width;
                    this._height = k.height;
                }
                this._initialized = true;
            }
        }

        public function get flipV():Boolean
        {
            return this._flipV;
        }

        public function get flipH():Boolean
        {
            return this._flipH;
        }

        public function get width():int
        {
            this.initialize();
            return this._width;
        }

        public function get height():int
        {
            this.initialize();
            return this._height;
        }

        public function get assetName():String
        {
            return this._assetName;
        }

        public function get _Str_3582():String
        {
            return this._libraryAssetName;
        }

        public function get asset():IAsset
        {
            return this._asset;
        }

        public function get usesPalette():Boolean
        {
            return this._usesPalette;
        }

        public function get offsetX():int
        {
            if (!this._flipH)
            {
                return this._offsetX;
            }
            return -(this.width + this._offsetX);
        }

        public function get offsetY():int
        {
            if (!this._flipV)
            {
                return this._offsetY;
            }
            return -(this.height + this._offsetY);
        }

        public function get _Str_20249():int
        {
            return this._offsetX;
        }

        public function get _Str_19351():int
        {
            return this._offsetY;
        }
    }
}
