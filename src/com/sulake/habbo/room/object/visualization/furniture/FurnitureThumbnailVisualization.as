package com.sulake.habbo.room.object.visualization.furniture
{
    import flash.display.BitmapData;
    import com.sulake.room.object.visualization.utils.IGraphicAsset;
    import flash.display.Bitmap;
    import flash.geom.ColorTransform;
    import flash.geom.Matrix;

    public class FurnitureThumbnailVisualization extends FurnitureAnimatedVisualization 
    {
        protected static const THUMBNAIL:String = "THUMBNAIL";

        private var _Str_17030:String = null;
        private var _Str_22237:String = null;
        private var _Str_21351:Boolean = false;
        private var _Str_20721:BitmapData;
        private var _Str_10040:BitmapData;
        private var _Str_21698:int;
        private var _Str_16232:Boolean;


        public function set _Str_20445(k:Boolean):void
        {
            this._Str_21351 = k;
        }

        public function get _Str_23660():Boolean
        {
            return !(this._Str_10040 == null);
        }

        public function _Str_6645(k:BitmapData, _arg_2:BitmapData=null):void
        {
            this._Str_10040 = k;
            this._Str_20721 = ((_arg_2 != null) ? _arg_2 : k);
            this._Str_16232 = true;
        }

        override protected function updateModel(k:Number):Boolean
        {
            var _local_2:Boolean = super.updateModel(k);
            if (!object)
            {
                return _local_2;
            }
            if (((!(this._Str_16232)) && (this._Str_21698 == direction)))
            {
                return _local_2;
            }
            this._Str_25236();
            return true;
        }

        private function _Str_25236():void
        {
            if (assetCollection == null)
            {
                return;
            }
            if (this._Str_10040 != null)
            {
                this._Str_20857(this._Str_10040, 64);
                this._Str_20857(this._Str_20721, 32);
            }
            else
            {
                assetCollection.disposeAsset(this._Str_15493(64));
                assetCollection.disposeAsset(this._Str_15493(32));
            }
            this._Str_16232 = false;
            this._Str_21698 = direction;
        }

        private function _Str_20857(k:BitmapData, _arg_2:int):void
        {
            var _local_4:String;
            var _local_5:IGraphicAsset;
            var _local_6:BitmapData;
            var _local_7:String;
            var _local_3:int;
            while (_local_3 < spriteCount)
            {
                if (getSpriteTag(_arg_2, direction, _local_3) == THUMBNAIL)
                {
                    _local_4 = (getSpriteAssetNameWithoutFrame(_arg_2, _local_3, false) + getFrameNumber(_arg_2, _local_3));
                    _local_5 = getAsset(_local_4, _local_3);
                    if (_local_5 != null)
                    {
                        _local_6 = this._Str_25562(k, _local_5);
                        _local_7 = this._Str_15493(_arg_2);
                        assetCollection.disposeAsset(_local_7);
                        assetCollection.addAsset(_local_7, _local_6, true, _local_5.offsetX, _local_5.offsetY);
                    }
                    return;
                }
                _local_3++;
            }
        }

        private function _Str_25562(k:BitmapData, _arg_2:IGraphicAsset):BitmapData
        {
            var _local_6:BitmapData;
            var _local_7:Bitmap;
            var _local_8:ColorTransform;
            var _local_3:Number = 1.1;
            var _local_4:Matrix = new Matrix();
            var _local_5:Number = (_arg_2.width / k.width);
            switch (direction)
            {
                case 2:
                    _local_4.a = _local_5;
                    _local_4.b = (-0.5 * _local_5);
                    _local_4.c = 0;
                    _local_4.d = (_local_5 * _local_3);
                    _local_4.tx = 0;
                    _local_4.ty = ((0.5 * _local_5) * k.width);
                    break;
                case 0:
                case 4:
                    _local_4.a = _local_5;
                    _local_4.b = (0.5 * _local_5);
                    _local_4.c = 0;
                    _local_4.d = (_local_5 * _local_3);
                    _local_4.tx = 0;
                    _local_4.ty = 0;
                    break;
                default:
                    _local_4.a = _local_5;
                    _local_4.b = 0;
                    _local_4.c = 0;
                    _local_4.d = _local_5;
                    _local_4.tx = 0;
                    _local_4.ty = 0;
            }
            if (this._Str_21351)
            {
                _local_6 = new BitmapData((_arg_2.width + 2), (_arg_2.height + 2), true, 0);
                _local_7 = new Bitmap(k);
                _local_8 = new ColorTransform();
                _local_8.color = 0;
                _local_6.draw(_local_7, _local_4, _local_8);
                _local_4.tx = (_local_4.tx + 1);
                _local_4.ty--;
                _local_6.draw(_local_7, _local_4, _local_8);
                _local_4.ty = (_local_4.ty + 2);
                _local_6.draw(_local_7, _local_4, _local_8);
                _local_4.tx = (_local_4.tx + 1);
                _local_4.ty--;
                _local_6.draw(_local_7, _local_4, _local_8);
                _local_4.tx--;
                _local_6.draw(_local_7, _local_4);
            }
            else
            {
                _local_6 = new BitmapData(_arg_2.width, _arg_2.height, true, 0);
                _local_6.draw(k, _local_4);
            }
            return _local_6;
        }

        override protected function getSpriteAssetName(k:int, _arg_2:int):String
        {
            if (((this._Str_10040 == null) || (!(getSpriteTag(k, direction, _arg_2) == THUMBNAIL))))
            {
                return super.getSpriteAssetName(k, _arg_2);
            }
            return this._Str_15493(k);
        }

        protected function _Str_15493(k:int):String
        {
            if (this._Str_17030 == null)
            {
                this._Str_17030 = this._Str_12961(object.getId(), 32);
                this._Str_22237 = this._Str_12961(object.getId(), 64);
            }
            return (k == 32) ? this._Str_17030 : this._Str_22237;
        }

        protected function _Str_12961(k:int, _arg_2:int):String
        {
            return [type, k, "thumb", _arg_2].join("_");
        }
    }
}
