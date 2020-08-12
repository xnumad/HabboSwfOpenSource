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

        public function _Str_6883():void
        {
        }

        public function _Str_5920(k:IWindowContainer):void
        {
            this._navigator.officialRoomEntryManager._Str_21717(k);
        }

        public function _Str_8146():void
        {
            this._navigator.mainViewCtrl.startSearch(Tabs.TAB_OFFICIAL, Tabs.SEARCHTYPE_OFFICIALROOMS, "-1", MainViewCtrl._Str_15148);
        }

        public function get _Str_5960():String
        {
            return null;
        }

        public function _Str_8025(k:int):void
        {
        }

        public function _Str_8512(k:String):String
        {
            return k;
        }
    }
}
