package com.sulake.habbo.navigator.domain
{
    import flash.utils.Dictionary;
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
    import com.sulake.habbo.navigator.mainview.MainViewCtrl;
    import com.sulake.habbo.navigator.mainview.tabpagedecorators.CategoriesTabPageDecorator;
    import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
    import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
    import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
    import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
    import com.sulake.habbo.navigator.mainview.*;
    import com.sulake.habbo.navigator.mainview.tabpagedecorators.*;

    public class Tabs 
    {
        public static const _Str_6209:int = 1;
        public static const _Str_3866:int = 2;
        public static const _Str_5203:int = 3;
        public static const _Str_6250:int = 4;
        public static const _Str_3813:int = 5;
        public static const _Str_7172:int = 6;
        private static const _Str_5586:Dictionary = new Dictionary();
        public static const _Str_5348:int = 1;
        public static const _Str_9593:int = 2;
        public static const _Str_9161:int = 3;
        public static const _Str_8473:int = 4;
        public static const _Str_4869:int = 5;
        public static const _Str_8122:int = 6;
        public static const _Str_8161:int = 7;
        public static const _Str_5622:int = 8;
        public static const _Str_5383:int = 9;
        public static const _Str_9523:int = 10;
        public static const _Str_8698:int = 11;
        public static const _Str_16397:int = 12;
        public static const _Str_8671:int = 13;
        public static const _Str_10120:int = 14;
        public static const _Str_9891:int = 15;
        public static const _Str_6358:int = 16;
        public static const _Str_12070:int = 17;
        public static const _Str_12236:int = 18;
        public static const _Str_10261:int = 19;
        public static const _Str_9661:int = 20;
        public static const _Str_10877:int = 21;
        public static const _Str_9699:int = 22;
        public static const _Str_7094:int = 23;

        private var _tabs:Array;
        private var _navigator:HabboNavigator;

        {
            _Str_5586["popular"] = _Str_3866;
            _Str_5586["official"] = _Str_6250;
            _Str_5586["me"] = _Str_5203;
            _Str_5586["events"] = _Str_6209;
            _Str_5586["search"] = _Str_3813;
            _Str_5586["categories"] = _Str_7172;
        }

        public function Tabs(k:HabboNavigator)
        {
            this._navigator = k;
            this._tabs = new Array();
            this._tabs.push(new Tab(this._navigator, _Str_6209, _Str_6358, new EventsTabPageDecorator(this._navigator), MainViewCtrl._Str_8485));
            this._tabs.push(new Tab(this._navigator, _Str_7172, _Str_10877, new CategoriesTabPageDecorator(this._navigator), MainViewCtrl._Str_13989));
            this._tabs.push(new Tab(this._navigator, _Str_3866, _Str_5348, new RoomsTabPageDecorator(this._navigator), MainViewCtrl._Str_8485));
            this._tabs.push(new Tab(this._navigator, _Str_6250, _Str_8698, new OfficialTabPageDecorator(this._navigator), MainViewCtrl._Str_15148));
            this._tabs.push(new Tab(this._navigator, _Str_5203, _Str_4869, new MyRoomsTabPageDecorator(this._navigator), MainViewCtrl._Str_8485));
            this._tabs.push(new Tab(this._navigator, _Str_3813, _Str_5622, new SearchTabPageDecorator(this._navigator), MainViewCtrl._Str_14620));
            this._Str_13005(_Str_6209);
        }

        public static function _Str_20758(k:String, _arg_2:int):int
        {
            return (k in _Str_5586) ? _Str_5586[k] : _arg_2;
        }


        public function _Str_25916():Boolean
        {
            return this.getSelected().id == _Str_6250;
        }

        public function get tabs():Array
        {
            return this._tabs;
        }

        public function _Str_13005(k:int):void
        {
            var _local_2:Tab = this._Str_9436(k);
            if (_local_2 != null)
            {
                this._Str_25691();
                _local_2.selected = true;
            }
        }

        public function getSelected():Tab
        {
            var k:Tab;
            for each (k in this._tabs)
            {
                if (k.selected)
                {
                    return k;
                }
            }
            return null;
        }

        private function _Str_25691():void
        {
            var k:Tab;
            for each (k in this._tabs)
            {
                k.selected = false;
            }
        }

        public function _Str_9436(k:int):Tab
        {
            var _local_2:Tab;
            for each (_local_2 in this._tabs)
            {
                if (_local_2.id == k)
                {
                    return _local_2;
                }
            }
            return null;
        }
    }
}
