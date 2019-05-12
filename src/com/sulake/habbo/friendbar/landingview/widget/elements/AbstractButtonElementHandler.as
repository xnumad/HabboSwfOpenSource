package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.IElementHandler;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.ILayoutNameProvider;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;

    public class AbstractButtonElementHandler implements IElementHandler, IDisposable, ILayoutNameProvider 
    {
        private var _landingView:HabboLandingView;
        private var _window:IWindow;


        public function get layoutName():String
        {
            return "element_button";
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

        public function initialize(k:HabboLandingView, _arg_2:IWindow, _arg_3:Array, _arg_4:GenericWidget):void
        {
            this._landingView = k;
            this._window = _arg_2;
            var _local_5:String = _arg_3[1];
            _arg_2.procedure = this._Str_17374;
            _arg_2.caption = (("${" + _local_5) + "}");
        }

        private function _Str_17374(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this.onClick();
            }
        }

        protected function onClick():void
        {
        }

        public function refresh():void
        {
        }

        public function get landingView():HabboLandingView
        {
            return this._landingView;
        }

        public function get window():IWindow
        {
            return this._window;
        }
    }
}
