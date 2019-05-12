package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.IElementHandler;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.IFloatingElement;
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.ILayoutNameProvider;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.widgets._Str_2961;

    public class AbstractTimerElementHandler implements IElementHandler, IDisposable, IFloatingElement, ILayoutNameProvider 
    {
        private var _landingView:HabboLandingView;
        private var _window:IWindowContainer;
        private var _floating:Boolean;
        private var _timeRemainingKey:String;
        private var _expiredKey:String;


        public function get layoutName():String
        {
            return "element_timer";
        }

        public function _Str_7806(k:Boolean):Boolean
        {
            return this._floating;
        }

        public function dispose():void
        {
            this._landingView = null;
            this._window = null;
        }

        public function get disposed():Boolean
        {
            return this._landingView == null;
        }

        public function refresh():void
        {
        }

        public function initialize(k:HabboLandingView, _arg_2:IWindow, _arg_3:Array, _arg_4:GenericWidget):void
        {
            this._landingView = k;
            this._window = IWindowContainer(_arg_2);
            this._floating = (_arg_3[1] == "true");
            this._timeRemainingKey = _arg_3[4];
            this._expiredKey = _arg_3[5];
            this._Str_4180(null);
            if (this._floating)
            {
                this._window.x = int(_arg_3[2]);
                this._window.y = int(_arg_3[3]);
            }
        }

        protected function _Str_14169(k:int):void
        {
            var _local_2:IWidgetWindow = IWidgetWindow(this._window.findChildByName("countdown_widget"));
            _local_2.visible = (k > 0);
            var _local_3:_Str_2961 = _Str_2961(_local_2.widget);
            _local_3.seconds = k;
            this._Str_4180(((k > 0) ? this._timeRemainingKey : this._expiredKey));
        }

        private function _Str_4180(k:String):void
        {
            var _local_2:IWindow = this._window.findChildByName("timer_caption_txt");
            var _local_3:Boolean = ((!(k == null)) && (!(k == "")));
            _local_2.visible = _local_3;
            if (_local_3)
            {
                _local_2.caption = (("${" + k) + "}");
            }
        }

        public function get landingView():HabboLandingView
        {
            return this._landingView;
        }
    }
}
