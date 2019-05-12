package com.sulake.habbo.inventory.common
{
    import flash.display.BitmapData;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.inventory.IThumbListDrawableItem;
    import flash.geom.Point;
    import flash.geom.Rectangle;

    public class ThumbListManager 
    {
        private var _dataProvider:IThumbListDataProvider;
        private var _columnsMax:int;
        private var _rowCount:int = 1;
        private var _listImage:BitmapData;
        private var _listItemHeight:int;
        private var _listItemWidth:int;
        private var _viewWidth:int;
        private var _viewHeight:int;
        private var _thumbWidth:int;
        private var _thumbHeight:int;
        private var _itemBgImage:BitmapData;
        private var _itemBgImageSelected:BitmapData;

        public function ThumbListManager(k:IAssetLibrary, _arg_2:IThumbListDataProvider, _arg_3:String, _arg_4:String, _arg_5:int, _arg_6:int)
        {
            this._dataProvider = _arg_2;
            var _local_7:BitmapDataAsset = BitmapDataAsset(k.getAssetByName(_arg_3));
            if (_local_7 != null)
            {
                this._itemBgImage = BitmapData(_local_7.content);
            }
            var _local_8:BitmapDataAsset = BitmapDataAsset(k.getAssetByName(_arg_4));
            if (_local_8 != null)
            {
                this._itemBgImageSelected = BitmapData(_local_8.content);
            }
            this._thumbWidth = this._itemBgImage.width;
            this._thumbHeight = this._itemBgImage.height;
            this._viewWidth = _arg_5;
            this._viewHeight = _arg_6;
            this._columnsMax = Math.floor((this._viewWidth / this._thumbWidth));
            this._listImage = new BitmapData(this._viewWidth, this._viewHeight);
        }

        public function dispose():void
        {
            this._dataProvider = null;
            this._listImage = null;
        }

        public function _Str_20886():void
        {
            var _local_4:int;
            var _local_5:IThumbListDrawableItem;
            var _local_6:BitmapData;
            this._rowCount = this._Str_25115();
            if (this._rowCount == 0)
            {
                this._listImage = new BitmapData(this._viewWidth, this._viewHeight);
                return;
            }
            this._listImage = new BitmapData(Math.max((this._columnsMax * this._thumbWidth), this._viewWidth), Math.max((this._rowCount * this._thumbHeight), this._viewHeight), true, 0xFFFFFF);
            this._listImage.fillRect(this._listImage.rect, 0xFFFFFFFF);
            var k:int;
            var _local_2:Array = this._Str_11037();
            var _local_3:int;
            while (_local_3 < this._rowCount)
            {
                _local_4 = 0;
                while (_local_4 < this._columnsMax)
                {
                    if (k < _local_2.length)
                    {
                        _local_5 = _local_2[k];
                        if (_local_5 != null)
                        {
                            _local_6 = this._Str_18563(_local_5._Str_3093, _local_5._Str_2365);
                            this._listImage.copyPixels(_local_6, _local_6.rect, new Point((_local_4 * this._thumbWidth), (_local_3 * this._thumbHeight)), null, null, true);
                        }
                        k++;
                    }
                    _local_4++;
                }
                _local_3++;
            }
        }

        public function _Str_26080(k:IThumbListDrawableItem):void
        {
            var _local_2:BitmapData;
            var _local_4:Rectangle;
            if (k == null)
            {
                return;
            }
            var _local_3:Point = this._Str_24897();
            if (((_local_3.x == this._columnsMax) && (this._listImage.height < (_local_3.y * this._thumbHeight))))
            {
                _local_2 = new BitmapData(this._listImage.width, (this._listImage.height + this._thumbHeight));
            }
            else
            {
                _local_2 = new BitmapData(this._listImage.width, this._listImage.height);
            }
            var _local_5:BitmapData = this._Str_18563(k._Str_3093, k._Str_2365);
            _local_2.copyPixels(_local_5, _local_5.rect, new Point(0, 0), null, null, true);
            _local_4 = new Rectangle(0, 0, (this._thumbWidth * (this._columnsMax - 1)), this._thumbHeight);
            _local_2.copyPixels(this._listImage, _local_4, new Point(this._thumbWidth, 0), null, null, true);
            _local_4 = new Rectangle((this._thumbWidth * (this._columnsMax - 1)), 0, this._thumbWidth, this._listImage.height);
            _local_2.copyPixels(this._listImage, _local_4, new Point(0, this._thumbHeight), null, null, true);
            _local_4 = new Rectangle(0, this._thumbHeight, (this._thumbWidth * (this._columnsMax - 1)), (this._listImage.height - this._thumbHeight));
            _local_2.copyPixels(this._listImage, _local_4, new Point(this._thumbWidth, this._thumbHeight), null, null, true);
            this._listImage = _local_2;
        }

        public function _Str_23391(k:int, _arg_2:IThumbListDrawableItem):void
        {
            if (_arg_2 == null)
            {
                return;
            }
            var _local_3:Point = this._Str_13073(k);
            var _local_4:Point = new Point((_local_3.x * this._thumbWidth), (_local_3.y * this._thumbHeight));
            var _local_5:BitmapData = this._Str_18563(_arg_2._Str_3093, _arg_2._Str_2365);
            this._listImage.copyPixels(_local_5, _local_5.rect, _local_4, null, null, true);
        }

        public function _Str_21400():BitmapData
        {
            return this._listImage;
        }

        public function _Str_26003(k:int):void
        {
            var _local_2:Point = this._Str_13073(k);
            this._Str_20524(_local_2);
        }

        public function _Str_25974(k:Point):void
        {
            var _local_2:Point = this._Str_20871(k);
            this._Str_20524(_local_2);
        }

        public function _Str_10311(k:int):void
        {
            var _local_2:IThumbListDrawableItem = this._Str_23357(k);
            this._Str_23391(k, _local_2);
        }

        private function _Str_11037():Array
        {
            var k:Array;
            if (this._dataProvider != null)
            {
                k = this._dataProvider._Str_22161();
            }
            return (k) ? k : new Array();
        }

        private function _Str_23357(k:int):IThumbListDrawableItem
        {
            var _local_2:Array = this._Str_11037();
            if (((k >= 0) && (k < _local_2.length)))
            {
                return _local_2[k] as IThumbListDrawableItem;
            }
            return null;
        }

        private function _Str_25115():int
        {
            var k:Array = this._Str_11037();
            var _local_2:int = Math.ceil((k.length / this._columnsMax));
            return _local_2;
        }

        private function _Str_24897():Point
        {
            var k:Array = this._Str_11037();
            var _local_2:Point = this._Str_13073((k.length - 1));
            return _local_2;
        }

        public function _Str_21083(k:Point):int
        {
            var _local_2:Point = this._Str_20871(k);
            var _local_3:int = ((_local_2.y * this._columnsMax) + _local_2.x);
            return _local_3;
        }

        private function _Str_20871(k:Point):Point
        {
            var _local_2:int = Math.floor((k.y / this._thumbHeight));
            var _local_3:int = Math.floor((k.x / this._thumbWidth));
            return new Point(_local_3, _local_2);
        }

        private function _Str_13073(k:int):Point
        {
            var _local_2:int = Math.floor((k / this._columnsMax));
            var _local_3:int = (k % this._columnsMax);
            return new Point(_local_3, _local_2);
        }

        private function _Str_20524(k:Point):void
        {
            var _local_2:Rectangle;
            var _local_3:Point;
            var _local_7:int;
            var _local_8:int;
            var _local_9:BitmapData;
            var _local_10:BitmapData;
            var _local_11:BitmapData;
            var _local_12:BitmapData;
            if (k.x >= this._columnsMax)
            {
                return;
            }
            if (k.y >= this._rowCount)
            {
                return;
            }
            var _local_4:int = ((this._columnsMax - k.x) - 1);
            _local_2 = new Rectangle(((k.x + 1) * this._thumbWidth), (k.y * this._thumbHeight), (_local_4 * this._thumbWidth), this._thumbHeight);
            _local_3 = new Point((k.x * this._thumbWidth), (k.y * this._thumbHeight));
            var _local_5:BitmapData = new BitmapData((_local_2.width + this._thumbWidth), _local_2.height);
            _local_5.fillRect(_local_5.rect, 0xFFFFFFFF);
            _local_5.copyPixels(this._listImage, _local_2, new Point(0, 0), null, null, true);
            this._listImage.copyPixels(_local_5, _local_5.rect, _local_3, null, null, true);
            if (k.y < (this._rowCount - 1))
            {
                _local_7 = (this._listImage.width - this._thumbWidth);
                _local_8 = (this._listImage.height - ((k.y + 1) * this._thumbHeight));
                _local_9 = new BitmapData(_local_7, _local_8);
                _local_2 = new Rectangle(this._thumbWidth, ((k.y + 1) * this._thumbHeight), _local_9.width, _local_9.height);
                _local_9.copyPixels(this._listImage, _local_2, new Point(0, 0), null, null, true);
                _local_10 = new BitmapData(this._thumbWidth, _local_2.height);
                _local_2.x = 0;
                _local_2.width = this._thumbWidth;
                _local_10.copyPixels(this._listImage, _local_2, new Point(0, 0), null, null, true);
                this._listImage.fillRect(new Rectangle(0, (this._listImage.height - this._thumbHeight), this._listImage.width, this._thumbHeight), 0xFFFFFFFF);
                _local_3 = new Point((this._listImage.width - this._thumbWidth), (_local_2.y - this._thumbHeight));
                this._listImage.copyPixels(_local_10, _local_10.rect, _local_3, null, null, true);
                _local_3 = new Point(0, _local_2.y);
                this._listImage.copyPixels(_local_9, _local_9.rect, _local_3, null, null, true);
            }
            var _local_6:int = (this._Str_11037().length - 1);
            if (_local_6 > 0)
            {
                k = this._Str_13073(_local_6);
                if (k.x == (this._columnsMax - 1))
                {
                    _local_11 = new BitmapData(this._listImage.width, (this._listImage.height - this._thumbHeight));
                    _local_2 = new Rectangle(0, 0, this._listImage.width, (this._listImage.height - this._thumbHeight));
                    _local_11.copyPixels(this._listImage, _local_2, new Point(0, 0), null, null, true);
                    this._listImage = _local_11;
                    this._rowCount--;
                }
            }
            if (this._listImage.height < this._viewHeight)
            {
                _local_12 = new BitmapData(this._listImage.width, this._viewHeight);
                _local_12.fillRect(_local_12.rect, 0xFFFFFFFF);
                _local_12.copyPixels(this._listImage, this._listImage.rect, new Point(0, 0), null, null, true);
                this._listImage = _local_12;
            }
        }

        private function _Str_18563(k:BitmapData=null, _arg_2:Boolean=false):BitmapData
        {
            var _local_4:Point;
            var _local_3:BitmapData = new BitmapData(this._itemBgImage.width, this._itemBgImage.height);
            if (_arg_2)
            {
                _local_3.copyPixels(this._itemBgImageSelected, this._itemBgImage.rect, new Point(0, 0), null, null, false);
            }
            else
            {
                _local_3.copyPixels(this._itemBgImage, this._itemBgImage.rect, new Point(0, 0), null, null, false);
            }
            if (k != null)
            {
                _local_4 = new Point(((_local_3.width - k.width) / 2), ((_local_3.height - k.height) / 2));
                _local_3.copyPixels(k, k.rect, _local_4, null, null, true);
            }
            return _local_3;
        }
    }
}
