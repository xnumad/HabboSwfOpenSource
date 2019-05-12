package com.sulake.habbo.navigator
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IFrameWindow;

    public class SimpleAlertView extends AlertView 
    {
        private var _text:String;

        public function SimpleAlertView(k:IHabboTransitionalNavigator, _arg_2:String, _arg_3:String)
        {
            super(k, "nav_simple_alert", _arg_2);
            this._text = _arg_3;
        }

        override internal function setupAlertWindow(k:IFrameWindow):void
        {
            var _local_2:IWindowContainer = k.content;
            ITextWindow(_local_2.findChildByName("body_text")).text = this._text;
            var _local_3:IWindow = _local_2.findChildByName("ok");
            if (_local_3 != null)
            {
                _local_3.addEventListener(WindowMouseEvent.CLICK, this._Str_6167);
            }
            k.tags.push("SimpleAlertView");
        }

        private function _Str_6167(k:WindowMouseEvent):void
        {
            dispose();
        }
    }
}

