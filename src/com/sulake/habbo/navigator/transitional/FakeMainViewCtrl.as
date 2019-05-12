package com.sulake.habbo.navigator.transitional
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
                case Tabs._Str_5348:
                    return "popular";
                case Tabs._Str_9593:
                    return "highest_score";
                case Tabs._Str_9161:
                    return "friends_rooms";
                case Tabs._Str_8473:
                    return "with_friends";
                case Tabs._Str_4869:
                    return "my";
                case Tabs._Str_8122:
                    return "favorites";
                case Tabs._Str_8161:
                    return "history";
                case Tabs._Str_5622:
                    return "query";
                case Tabs._Str_5383:
                    return "query";
                case Tabs._Str_9523:
                    return "query";
                case Tabs._Str_8698:
                    return "official";
                case Tabs._Str_16397:
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
            this._newNavigator._Str_3310(this._Str_22867(_arg_2), _arg_3);
        }

        public function update(k:uint):void
        {
        }

        public function get _Str_6414():TextSearchInputs
        {
            return this._oldNavigator._Str_2813._Str_6414;
        }

        public function _Str_20903(k:Point):void
        {
            return this._newNavigator.open();
        }

        public function get _Str_13071():Boolean
        {
            return this._oldNavigator._Str_2813._Str_13071;
        }
    }
}
