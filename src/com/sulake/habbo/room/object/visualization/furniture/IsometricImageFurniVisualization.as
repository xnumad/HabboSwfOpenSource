package com.sulake.habbo.room.object.visualization.furniture
{
    import flash.display.BitmapData;
    import com.sulake.room.object.visualization.utils.IGraphicAsset;
    import flash.display.Bitmap;
    import flash.geom.ColorTransform;
    import flash.geom.Matrix;

    public class IsometricImageFurniVisualization extends FurnitureAnimatedVisualization
    {
        protected static const THUMBNAIL:String = "THUMBNAIL";

        private var _thumbnailAssetNameSmall:String = null;
        private var _thumbnailAssetNameNormal:String = null;
        private var _hasOutline:Boolean = false;
        private var _thumbnailImageSmall:BitmapData;
        private var _thumbnailImageNormal:BitmapData;
        private var _thumbnailDirection:int;
        private var _thumbnailChanged:Boolean;


        public function set hasOutline(k:Boolean):void
        {
            this._hasOutline = k;
        }

        public function get hasThumbnailImage():Boolean
        {
            return !(this._thumbnailImageNormal == null);
        }

        public function setThumbnailImages(k:BitmapData, _arg_2:BitmapData=null):void
        {
            this._thumbnailImageNormal = k;
            this._thumbnailImageSmall = ((_arg_2 != null) ? _arg_2 : k);
            this._thumbnailChanged = true;
        }

        override protected function updateModel(k:Number):Boolean
        {
            var _local_2:Boolean = super.updateModel(k);
            if (!object)
            {
                return _local_2;
            }
            if (((!(this._thumbnailChanged)) && (this._thumbnailDirection == direction)))
            {
                return _local_2;
            }
            this.refreshThumbnail();
            return true;
        }

        private function refreshThumbnail():void
        {
            if (assetCollection == null)
            {
                return;
            }
            if (this._thumbnailImageNormal != null)
            {
                this.addThumbnailAsset(this._thumbnailImageNormal, 64);
                this.addThumbnailAsset(this._thumbnailImageSmall, 32);
            }
            else
            {
                assetCollection.disposeAsset(this.getThumbnailAssetName(64));
                assetCollection.disposeAsset(this.getThumbnailAssetName(32));
            }
            this._thumbnailChanged = false;
            this._thumbnailDirection = direction;
        }

        private function addThumbnailAsset(k:BitmapData, _arg_2:int):void
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
                        _local_6 = this.generateTransformedThumbnail(k, _local_5);
                        _local_7 = this.getThumbnailAssetName(_arg_2);
                        assetCollection.disposeAsset(_local_7);
                        assetCollection.addAsset(_local_7, _local_6, true, _local_5.offsetX, _local_5.offsetY);
                    }
                    return;
                }
                _local_3++;
            }
        }

        private function generateTransformedThumbnail(k:BitmapData, _arg_2:IGraphicAsset):BitmapData
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
            if (this._hasOutline)
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
            if (((this._thumbnailImageNormal == null) || (!(getSpriteTag(k, direction, _arg_2) == THUMBNAIL))))
            {
                return super.getSpriteAssetName(k, _arg_2);
            }
            return this.getThumbnailAssetName(k);
        }

        protected function getThumbnailAssetName(k:int):String
        {
            if (this._thumbnailAssetNameSmall == null)
            {
                this._thumbnailAssetNameSmall = this.getFullThumbnailAssetName(object.getId(), 32);
                this._thumbnailAssetNameNormal = this.getFullThumbnailAssetName(object.getId(), 64);
            }
            return (k == 32) ? this._thumbnailAssetNameSmall : this._thumbnailAssetNameNormal;
        }

        protected function getFullThumbnailAssetName(k:int, _arg_2:int):String
        {
            return [type, k, "thumb", _arg_2].join("_");
        }
    }
}
