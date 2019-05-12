package com.sulake.room.object.visualization.utils
{
    import __AS3__.vec.Vector;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.assets.IAsset;
    import flash.display.BitmapData;
    import __AS3__.vec.*;

    public class GraphicAsset implements IGraphicAsset 
    {
        private static const _Str_4356:Vector.<GraphicAsset> = new Vector.<GraphicAsset>();

        private var _assetName:String;
        private var _Str_11397:String;
        private var _asset:BitmapDataAsset;
        private var _flipH:Boolean;
        private var _flipV:Boolean;
        private var _usesPalette:Boolean;
        private var _Str_2756:int;
        private var _Str_2543:int;
        private var _Str_1720:int;
        private var _height:int;
        private var _Str_2684:Boolean;


        public static function _Str_2363(k:String, _arg_2:String, _arg_3:IAsset, _arg_4:Boolean, _arg_5:Boolean, _arg_6:int, _arg_7:int, _arg_8:Boolean=false):GraphicAsset
        {
            var _local_9:GraphicAsset = ((_Str_4356.length > 0) ? _Str_4356.pop() : new (GraphicAsset)());
            _local_9._assetName = k;
            _local_9._Str_11397 = _arg_2;
            var _local_10:BitmapDataAsset = (_arg_3 as BitmapDataAsset);
            if (_local_10 != null)
            {
                _local_9._asset = _local_10;
                _local_9._Str_2684 = false;
            }
            else
            {
                _local_9._asset = null;
                _local_9._Str_2684 = true;
            }
            _local_9._flipH = _arg_4;
            _local_9._flipV = _arg_5;
            _local_9._Str_2756 = _arg_6;
            _local_9._Str_2543 = _arg_7;
            _local_9._usesPalette = _arg_8;
            return _local_9;
        }


        public function recycle():void
        {
            this._asset = null;
            _Str_4356.push(this);
        }

        private function initialize():void
        {
            var k:BitmapData;
            if (((!(this._Str_2684)) && (!(this._asset == null))))
            {
                k = (this._asset.content as BitmapData);
                if (k != null)
                {
                    this._Str_1720 = k.width;
                    this._height = k.height;
                }
                this._Str_2684 = true;
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
            return this._Str_1720;
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
            return this._Str_11397;
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
                return this._Str_2756;
            }
            return -(this.width + this._Str_2756);
        }

        public function get offsetY():int
        {
            if (!this._flipV)
            {
                return this._Str_2543;
            }
            return -(this.height + this._Str_2543);
        }

        public function get _Str_20249():int
        {
            return this._Str_2756;
        }

        public function get _Str_19351():int
        {
            return this._Str_2543;
        }
    }
}
