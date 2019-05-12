package com.sulake.habbo.navigator.domain
{
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.core.window.components.ITabButtonWindow;
    import com.sulake.habbo.navigator.mainview.tabpagedecorators.ITabPageDecorator;

    public class Tab 
    {
        private var _navigator:HabboNavigator;
        private var _id:int;
        private var _defaultSearchType:int;
        private var _button:ITabButtonWindow;
        private var _tabPageDecorator:ITabPageDecorator;
        private var _selected:Boolean;
        private var _searchMsg:int;

        public function Tab(k:HabboNavigator, _arg_2:int, _arg_3:int, _arg_4:ITabPageDecorator, _arg_5:int=1)
        {
            this._navigator = k;
            this._id = _arg_2;
            this._defaultSearchType = _arg_3;
            this._tabPageDecorator = _arg_4;
            this._searchMsg = _arg_5;
        }

        public function _Str_25329():void
        {
            var k:Boolean = this._navigator.context.configuration.getBoolean("navigator.2014.personalized.navigator");
            if (((k) && (this.id == Tabs._Str_3866)))
            {
                this._defaultSearchType = Tabs._Str_9699;
            }
            this._navigator._Str_2813._Str_2798(this._id, this._defaultSearchType, "-1", this._searchMsg);
        }

        public function set selected(k:Boolean):void
        {
            this._selected = k;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get _Str_22642():int
        {
            return this._defaultSearchType;
        }

        public function get selected():Boolean
        {
            return this._selected;
        }

        public function get _Str_5252():ITabPageDecorator
        {
            return this._tabPageDecorator;
        }

        public function get _Str_26289():int
        {
            return this._searchMsg;
        }

        public function get button():ITabButtonWindow
        {
            return this._button;
        }

        public function set button(k:ITabButtonWindow):void
        {
            this._button = k;
        }
    }
}
