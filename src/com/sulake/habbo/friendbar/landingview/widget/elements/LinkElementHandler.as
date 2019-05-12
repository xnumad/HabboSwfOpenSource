package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.IElementHandler;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.core.window.events.WindowEvent;

    public class LinkElementHandler implements IElementHandler, IDisposable 
    {
        private var _landingView:HabboLandingView;
        private var _url:String;


        public function dispose():void
        {
            this._landingView = null;
        }

        public function get disposed():Boolean
        {
            return this._landingView == null;
        }

        public function initialize(k:HabboLandingView, _arg_2:IWindow, _arg_3:Array, _arg_4:GenericWidget):void
        {
            this._landingView = k;
            var _local_5:String = _arg_3[1];
            this._url = _arg_3[2];
            _arg_2.procedure = this._Str_23111;
            IWindowContainer(_arg_2).findChildByName("link_txt").caption = (("${" + _local_5) + "}");
        }

        private function _Str_23111(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._landingView.windowManager.alert("${catalog.alert.external.link.title}", "${catalog.alert.external.link.desc}", 0, null);
                HabboWebTools.openWebPage(this._url);
                this._landingView.tracking.trackGoogle("landingView", "click_link");
            }
        }

        public function refresh():void
        {
        }
    }
}
