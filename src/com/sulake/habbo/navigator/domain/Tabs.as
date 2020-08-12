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
        public static const TAB_EVENTS:int = 1;
        public static const TAB_ROOMS:int = 2;
        public static const TAB_ME:int = 3;
        public static const TAB_OFFICIAL:int = 4;
        public static const TAB_SEARCH:int = 5;
        public static const TAB_CATEGORIES:int = 6;
        private static const TAB_NAMES:Dictionary = new Dictionary();
        public static const SEARCHTYPE_POPULAR_ROOMS:int = 1;
        public static const SEARCHTYPE_ROOMS_WITH_HIGHEST_SCORE:int = 2;
        public static const SEARCHTYPE_MY_FRIENDS_ROOMS:int = 3;
        public static const SEARCHTYPE_ROOMS_WHERE_MY_FRIENDS_ARE:int = 4;
        public static const SEARCHTYPE_MY_ROOMS:int = 5;
        public static const SEARCHTYPE_MY_FAVOURITES:int = 6;
        public static const SEARCHTYPE_MY_HISTORY:int = 7;
        public static const SEARCHTYPE_TEXT_SEARCH:int = 8;
        public static const SEARCHTYPE_TAG_SEARCH:int = 9;
        public static const SEARCHTYPE_ROOM_NAME_SEARCH:int = 10;
        public static const SEARCHTYPE_OFFICIALROOMS:int = 11;
        public static const SEARCHTYPE_LATEST_EVENTS:int = 12;
        public static const SEARCHTYPE_GROUP_NAME_SEARCH:int = 13;
        public static const SEARCHTYPE_GUILD_BASES:int = 14;
        public static const SEARCHTYPE_COMPETITION_ROOMS:int = 15;
        public static const SEARCHTYPE_ROOM_ADS:int = 16;
        public static const SEARCHTYPE_NEW_ROOM_ADS:int = 17;
        public static const SEARCHTYPE_ROOMS_WITH_RIGHTS:int = 18;
        public static const SEARCHTYPE_MY_GUILD_BASES:int = 19;
        public static const SEARCHTYPE_BY_OWNER:int = 20;
        public static const SEARCHTYPE_CATEGORIES:int = 21;
        public static const SEARCHTYPE_RECOMMENDED_ROOMS:int = 22;
        public static const SEARCHTYPE_FREQUENT_HISTORY:int = 23;

        private var _tabs:Array;
        private var _navigator:HabboNavigator;

        {
            TAB_NAMES["popular"] = TAB_ROOMS;
            TAB_NAMES["official"] = TAB_OFFICIAL;
            TAB_NAMES["me"] = TAB_ME;
            TAB_NAMES["events"] = TAB_EVENTS;
            TAB_NAMES["search"] = TAB_SEARCH;
            TAB_NAMES["categories"] = TAB_CATEGORIES;
        }

        public function Tabs(k:HabboNavigator)
        {
            this._navigator = k;
            this._tabs = new Array();
            this._tabs.push(new Tab(this._navigator, TAB_EVENTS, SEARCHTYPE_ROOM_ADS, new EventsTabPageDecorator(this._navigator), MainViewCtrl.SEARCHMSG_SEARCH));
            this._tabs.push(new Tab(this._navigator, TAB_CATEGORIES, SEARCHTYPE_CATEGORIES, new CategoriesTabPageDecorator(this._navigator), MainViewCtrl.SEARCHMSG_CATEGORIESWITHUSERCOUNT));
            this._tabs.push(new Tab(this._navigator, TAB_ROOMS, SEARCHTYPE_POPULAR_ROOMS, new RoomsTabPageDecorator(this._navigator), MainViewCtrl.SEARCHMSG_SEARCH));
            this._tabs.push(new Tab(this._navigator, TAB_OFFICIAL, SEARCHTYPE_OFFICIALROOMS, new OfficialTabPageDecorator(this._navigator), MainViewCtrl.SEARCHMSG_OFFICIALROOMS));
            this._tabs.push(new Tab(this._navigator, TAB_ME, SEARCHTYPE_MY_ROOMS, new MyRoomsTabPageDecorator(this._navigator), MainViewCtrl.SEARCHMSG_SEARCH));
            this._tabs.push(new Tab(this._navigator, TAB_SEARCH, SEARCHTYPE_TEXT_SEARCH, new SearchTabPageDecorator(this._navigator), MainViewCtrl.SEARCHMSG_POPTAGS));
            this.setSelectedTab(TAB_EVENTS);
        }

        public static function tabIdFromName(k:String, _arg_2:int):int
        {
            return (k in TAB_NAMES) ? TAB_NAMES[k] : _arg_2;
        }


        public function onFrontPage():Boolean
        {
            return this.getSelected().id == TAB_OFFICIAL;
        }

        public function get tabs():Array
        {
            return this._tabs;
        }

        public function setSelectedTab(k:int):void
        {
            var _local_2:Tab = this.getTab(k);
            if (_local_2 != null)
            {
                this.clearSelected();
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

        private function clearSelected():void
        {
            var k:Tab;
            for each (k in this._tabs)
            {
                k.selected = false;
            }
        }

        public function getTab(k:int):Tab
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
