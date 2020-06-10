﻿package com.sulake.habbo.navigator.transitional
{
    import com.sulake.habbo.navigator.mainview.ITransitionalMainViewCtrl;
    import com.sulake.habbo.navigator.HabboNewNavigator;
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.habbo.navigator.domain.Tabs;
    import com.sulake.habbo.navigator.TextSearchInputs;
    import flash.geom.Point;

    public class FakeMainViewCtrl implements ITransitionalMainViewCtrl 
    {
        private var _newNavigator:HabboNewNavigator;
        private var _oldNavigator:HabboNavigator;

        public function FakeMainViewCtrl(k:HabboNewNavigator, _arg_2:HabboNavigator)
        {
            this._newNavigator = k;
            this._oldNavigator = _arg_2;
        }

        public function get disposed():Boolean
        {
            return (this._newNavigator == null) && (this._oldNavigator == null);
        }

        public function _Str_18392():void
        {
            this._newNavigator.toggle();
        }

        public function dispose():void
        {
            this._newNavigator = null;
            this._oldNavigator = null;
        }

        public function open():void
        {
            this._newNavigator.open();
        }

        public function isOpen():Boolean
        {
            return false;
        }

        public function close():void
        {
            this._newNavigator.close();
        }

        public function get mainWindow():IFrameWindow
        {
            return this._newNavigator.mainWindow;
        }

        public function refresh():void
        {
            this._newNavigator.refresh();
        }

        public function _Str_8316(k:int):Boolean
        {
            this._newNavigator.refresh();
            return true;
        }

        private function _Str_22867(k:int):String
        {
            switch (k)
            {
                case Tabs.SEARCHTYPE_POPULAR_ROOMS:
                    return "popular";
                case Tabs.SEARCHTYPE_ROOMS_WITH_HIGHEST_SCORE:
                    return "highest_score";
                case Tabs.SEARCHTYPE_MY_FRIENDS_ROOMS:
                    return "friends_rooms";
                case Tabs.SEARCHTYPE_ROOMS_WHERE_MY_FRIENDS_ARE:
                    return "with_friends";
                case Tabs.SEARCHTYPE_MY_ROOMS:
                    return "my";
                case Tabs.SEARCHTYPE_MY_FAVOURITES:
                    return "favorites";
                case Tabs.SEARCHTYPE_MY_HISTORY:
                    return "history";
                case Tabs.SEARCHTYPE_TEXT_SEARCH:
                    return "query";
                case Tabs.SEARCHTYPE_TAG_SEARCH:
                    return "query";
                case Tabs.SEARCHTYPE_ROOM_NAME_SEARCH:
                    return "query";
                case Tabs.SEARCHTYPE_OFFICIALROOMS:
                    return "official";
                case Tabs.SEARCHTYPE_LATEST_EVENTS:
                    return "new_ads";
                case Tabs._Str_8671:
                    return "groups";
                case Tabs._Str_10120:
                    return "groups";
                case Tabs._Str_9891:
                    return "competition";
                case Tabs._Str_6358:
                    return "top_promotions";
                case Tabs._Str_12070:
                    return "new_ads";
                case Tabs._Str_12236:
                    return "with_rights";
                case Tabs._Str_10261:
                    return "my_groups";
                case Tabs._Str_9661:
                    return "query";
                case Tabs._Str_10877:
                    return "all_categories";
                case Tabs._Str_9699:
                    return "recommended";
                case Tabs._Str_7094:
                    return "history_freq";
                default:
                    return "query";
            }
        }

        public function _Str_2798(k:int, _arg_2:int, _arg_3:String="-1", _arg_4:int=1):void
        {
            this._newNavigator.performSearch(this._Str_22867(_arg_2), _arg_3);
        }

        public function update(k:uint):void
        {
        }

        public function get _Str_6414():TextSearchInputs
        {
            return this._oldNavigator.mainViewCtrl._Str_6414;
        }

        public function _Str_20903(k:Point):void
        {
            return this._newNavigator.open();
        }

        public function get _Str_13071():Boolean
        {
            return this._oldNavigator.mainViewCtrl._Str_13071;
        }
    }
}
