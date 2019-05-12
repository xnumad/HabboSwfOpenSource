package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.IElementHandler;
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.IFloatingElement;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;

    public class TitleElementHandler implements IElementHandler, IFloatingElement 
    {
        private var _floatingEnabled:Boolean = false;


        public function initialize(k:HabboLandingView, _arg_2:IWindow, _arg_3:Array, _arg_4:GenericWidget):void
        {
            var _local_5:IWindowContainer = IWindowContainer(_arg_2);
            var _local_6:String = _arg_3[1];
            this._floatingEnabled = ((_arg_3.length > 2) ? (_arg_3[2] == "true") : false);
            _local_5.findChildByName("title_txt").caption = (("${" + _local_6) + "}");
            HabboLandingView._Str_9079(_local_5, "title_txt", "hdr_line");
        }

        public function _Str_7806(k:Boolean):Boolean
        {
            return (k) || (this._floatingEnabled);
        }

        public function refresh():void
        {
        }
    }
}
