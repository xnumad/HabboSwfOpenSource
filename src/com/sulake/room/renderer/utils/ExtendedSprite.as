package com.sulake.room.renderer.utils
{
    import flash.display.Bitmap;
    import flash.geom.Point;
    import flash.display.BitmapData;

    public class ExtendedSprite extends Bitmap 
    {
        private var _Str_14842:int = 128;
        private var _Str_24201:Point;
        private var _tag:String = "";
        private var _identifier:String = "";
        private var _clickHandling:Boolean = false;
        private var _Str_8253:Boolean = false;
        private var _bitmapData:ExtendedBitmapData = null;
        private var _width:int = 0;
        private var _height:int = 0;
        private var _updateID1:int = -1;
        private var _updateID2:int = -1;
        private var _Str_21169:int = 0;
        private var _Str_19420:int = 0;

        public function ExtendedSprite():void
        {
            this._Str_24201 = new Point();
            cacheAsBitmap = false;
        }

        public function get _Str_4023():int
        {
            return this._Str_14842;
        }

        public function set _Str_4023(k:int):void
        {
            this._Str_14842 = k;
        }

        public function get tag():String
        {
            return this._tag;
        }

        public function set tag(k:String):void
        {
            this._tag = k;
        }

        public function get identifier():String
        {
            return this._identifier;
        }

        public function set identifier(k:String):void
        {
            this._identifier = k;
        }

        public function get _Str_4593():Boolean
        {
            return this._Str_8253;
        }

        public function set _Str_4593(k:Boolean):void
        {
            this._Str_8253 = k;
        }

        public function get _Str_4530():Boolean
        {
            return this._clickHandling;
        }

        public function set _Str_4530(k:Boolean):void
        {
            this._clickHandling = k;
        }

        public function get _Str_14797():int
        {
            return this._Str_21169;
        }

        public function set _Str_14797(k:int):void
        {
            this._Str_21169 = k;
        }

        public function get _Str_13379():int
        {
            return this._Str_19420;
        }

        public function set _Str_13379(k:int):void
        {
            this._Str_19420 = k;
        }

        public function dispose():void
        {
            if (this._bitmapData != null)
            {
                this._bitmapData.dispose();
                this._bitmapData = null;
            }
        }

        override public function set bitmapData(k:BitmapData):void
        {
            var _local_2:ExtendedBitmapData;
            if (k == bitmapData)
            {
                return;
            }
            if (this._bitmapData != null)
            {
                this._bitmapData.dispose();
                this._bitmapData = null;
            }
            if (k != null)
            {
                this._width = k.width;
                this._height = k.height;
                _local_2 = (k as ExtendedBitmapData);
                if (_local_2 != null)
                {
                    _local_2._Str_9215();
                    this._bitmapData = _local_2;
                }
            }
            else
            {
                this._width = 0;
                this._height = 0;
                this._updateID1 = -1;
                this._updateID2 = -1;
            }
            super.bitmapData = k;
        }

        public function _Str_17574(k:int, _arg_2:int):Boolean
        {
            if (((!(k == this._updateID1)) || (!(_arg_2 == this._updateID2))))
            {
                this._updateID1 = k;
                this._updateID2 = _arg_2;
                return true;
            }
            if (((!(this._bitmapData == null)) && (this._bitmapData.disposed)))
            {
                return true;
            }
            return false;
        }

        override public function hitTestPoint(k:Number, _arg_2:Number, _arg_3:Boolean=false):Boolean
        {
            return this.hitTest(k, _arg_2);
        }

        public function hitTest(k:int, _arg_2:int):Boolean
        {
            if (((this._Str_14842 > 0xFF) || (bitmapData == null)))
            {
                return false;
            }
            if (((((k < 0) || (_arg_2 < 0)) || (k >= this._width)) || (_arg_2 >= this._height)))
            {
                return false;
            }
            return this.hitTestBitmapData(k, _arg_2);
        }

        private function hitTestBitmapData(k:int, _arg_2:int):Boolean
        {
            var _local_4:uint;
            var _local_3:Boolean;
            try
            {
                _local_4 = bitmapData.getPixel32(k, _arg_2);
                _local_4 = (_local_4 >> 24);
                _local_3 = (_local_4 > this._Str_14842);
            }
            catch(e:Error)
            {
            }
            return _local_3;
        }
    }
}
