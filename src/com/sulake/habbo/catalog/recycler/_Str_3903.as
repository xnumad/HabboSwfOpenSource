package com.sulake.habbo.catalog.recycler
{
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.room.IRoomEngine;

    public class _Str_3903 extends PrizeItemContainer 
    {
        private var _Str_6780:String;
        private var _Str_6222:int;
        private var _Str_21793:int;
        private var _Str_2509:IFurnitureData;
        private var _gridItem:PrizeItemContainer;

        public function _Str_3903(k:String, _arg_2:int, _arg_3:IFurnitureData, _arg_4:int, _arg_5:HabboCatalog)
        {
            super(_arg_5);
            this._Str_6780 = k;
            this._Str_6222 = _arg_2;
            this._Str_2509 = _arg_3;
            this._Str_21793 = _arg_4;
        }

        public function setIcon(k:IRoomEngine):void
        {
            if (((k == null) || (this._Str_2509 == null)))
            {
                return;
            }
            initProductIcon(k, this._Str_2509.type, this._Str_6222);
        }

        public function get _Str_7585():String
        {
            return this._Str_6780;
        }

        public function get _Str_6270():int
        {
            return this._Str_6222;
        }

        public function get gridItem():PrizeItemContainer
        {
            return this._gridItem;
        }

        public function get _Str_21913():int
        {
            return this._Str_21793;
        }

        public function get title():String
        {
            if (this._Str_2509 == null)
            {
                return "";
            }
            return this._Str_2509.localizedName;
        }
    }
}
