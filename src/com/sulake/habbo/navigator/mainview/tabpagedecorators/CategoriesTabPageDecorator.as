package com.sulake.habbo.navigator.mainview.tabpagedecorators
{
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.navigator.domain.Tabs;

    public class CategoriesTabPageDecorator implements ITabPageDecorator 
    {
        private var _navigator:HabboNavigator;

        public function CategoriesTabPageDecorator(k:HabboNavigator)
        {
            this._navigator = k;
        }

        public function refreshCustomContent(k:IWindowContainer):void
        {
        }

        public function tabSelected():void
        {
        }

        public function navigatorOpenedWhileInTab():void
        {
            this._navigator.mainViewCtrl.startSearch(Tabs.TAB_CATEGORIES, Tabs.SEARCHTYPE_CATEGORIES);
        }

        public function refreshFooter(k:IWindowContainer):void
        {
        }

        public function setSubSelection(k:int):void
        {
        }

        public function get filterCategory():String
        {
            return null;
        }

        public function processSearchParam(k:String):String
        {
            return "";
        }
    }
}
