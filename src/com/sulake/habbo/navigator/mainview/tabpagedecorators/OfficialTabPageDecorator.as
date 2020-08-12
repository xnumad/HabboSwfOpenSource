package com.sulake.habbo.navigator.mainview.tabpagedecorators
{
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.navigator.domain.Tabs;
    import com.sulake.habbo.navigator.mainview.MainViewCtrl;

    public class OfficialTabPageDecorator implements ITabPageDecorator 
    {
        private var _navigator:HabboNavigator;

        public function OfficialTabPageDecorator(k:HabboNavigator)
        {
            this._navigator = k;
        }

        public function refreshCustomContent(k:IWindowContainer):void
        {
        }

        public function tabSelected():void
        {
        }

        public function refreshFooter(k:IWindowContainer):void
        {
            this._navigator.officialRoomEntryManager._Str_21717(k);
        }

        public function navigatorOpenedWhileInTab():void
        {
            this._navigator.mainViewCtrl.startSearch(Tabs.TAB_OFFICIAL, Tabs.SEARCHTYPE_OFFICIALROOMS, "-1", MainViewCtrl.SEARCHMSG_OFFICIALROOMS);
        }

        public function get filterCategory():String
        {
            return null;
        }

        public function setSubSelection(k:int):void
        {
        }

        public function processSearchParam(k:String):String
        {
            return k;
        }
    }
}
