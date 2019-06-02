package com.sulake.habbo.navigator.view
{
    import com.sulake.habbo.navigator.HabboNewNavigator;
    import com.sulake.core.window.components.ITabButtonWindow;
    import com.sulake.core.window.components.ITabContextWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class TopViewSelector 
    {
        private var _navigator:HabboNewNavigator;
        private var _template:ITabButtonWindow;
        private var _tabContext:ITabContextWindow;

        public function TopViewSelector(k:HabboNewNavigator)
        {
            this._navigator = k;
        }

        public function set template(k:ITabButtonWindow):void
        {
            this._template = k;
        }

        public function set _Str_23159(k:ITabContextWindow):void
        {
            this._tabContext = k;
        }

        public function refresh():void
        {
            var _local_2:String;
            var _local_3:ITabButtonWindow;
            this._Str_17441();
            var k:int;
            while (k < this._navigator._Str_7014._Str_9965().length)
            {
                _local_2 = this._navigator._Str_7014._Str_9965()[k];
                _local_3 = ITabButtonWindow(this._template.clone());
                _local_3.caption = (("${navigator.toplevelview." + _local_2) + "}");
                _local_3.id = k;
                _local_3.procedure = this._Str_18312;
                this._tabContext._Str_5377(_local_3);
                k++;
            }
        }

        public function _Str_12925(k:int):void
        {
            this._tabContext.selector.setSelected(this._tabContext._Str_3363(k));
        }

        private function _Str_17441():void
        {
            var k:int;
            while (k < this._tabContext._Str_4277)
            {
                this._tabContext._Str_5897(this._tabContext._Str_3363(0));
                k++;
            }
        }

        private function _Str_18312(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                if (this._navigator._Str_7014._Str_9965().length > _arg_2.id)
                {
                    this._navigator._Str_3310(this._navigator._Str_7014._Str_9965()[_arg_2.id], "", this._navigator.view._Str_24940());
                }
            }
        }
    }
}
