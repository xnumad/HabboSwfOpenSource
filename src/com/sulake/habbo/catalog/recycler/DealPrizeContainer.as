package com.sulake.habbo.catalog.recycler
{
    import com.sulake.habbo.catalog.HabboCatalog;
    import flash.display.BitmapData;
    import com.sulake.habbo.communication.messages.incoming._Str_329._Str_6068;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.geom.Point;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.room.IRoomEngine;

    public class DealPrizeContainer extends _Str_3903 
    {
        private var _Str_7699:Array;
        private var _Str_16536:Array;
        private var _habboCatalog:HabboCatalog;
        private var _Str_3370:XML;
        private var _Str_5577:BitmapData;

        public function DealPrizeContainer(k:Array, _arg_2:int, _arg_3:HabboCatalog)
        {
            var _local_4:int;
            var _local_7:_Str_6068;
            var _local_8:IFurnitureData;
            this._Str_16536 = [];
            this._habboCatalog = _arg_3;
            this._Str_7699 = k;
            while (_local_4 < k.length)
            {
                _local_7 = k[_local_4];
                _local_8 = _arg_3.getFurnitureData(_local_7._Str_6270, _local_7._Str_7585);
                this._Str_16536.push(_local_8);
                _local_4++;
            }
            var _local_5:XmlAsset = (_arg_3.assets.getAssetByName("gridItem") as XmlAsset);
            this._Str_3370 = (_local_5.content as XML);
            var _local_6:BitmapDataAsset = (_arg_3.assets.getAssetByName("ctlg_pic_deal_icon_narrow") as BitmapDataAsset);
            this._Str_5577 = BitmapData(_local_6.content);
            super("deal", -1, null, _arg_2, _arg_3);
        }

        override public function setIcon(k:IRoomEngine):void
        {
            var _local_2:IBitmapWrapperWindow = IBitmapWrapperWindow(view.findChildByName("image"));
            _local_2.bitmap = new BitmapData(_local_2.width, _local_2.height, true, 0);
            _local_2.bitmap.copyPixels(this._Str_5577, this._Str_5577.rect, new Point(((_local_2.width - this._Str_5577.width) / 2), ((_local_2.height - this._Str_5577.height) / 2)));
            ITextWindow(view.findChildByName("bundleCounter")).text = this._Str_7699.length.toString();
        }

        override public function get title():String
        {
            return "";
        }

        public function get _Str_9475():Array
        {
            return this._Str_7699;
        }

        public function get _Str_26087():Array
        {
            return this._Str_16536;
        }
    }
}
