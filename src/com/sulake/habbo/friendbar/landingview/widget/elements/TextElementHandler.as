package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.IElementHandler;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;

    public class TextElementHandler implements IElementHandler 
    {
        private var _window:ITextWindow;


        public function initialize(k:HabboLandingView, _arg_2:IWindow, _arg_3:Array, _arg_4:GenericWidget):void
        {
            this._window = (_arg_2 as ITextWindow);
            var _local_5:String = _arg_3[1];
            this._window.caption = (("${" + _local_5) + "}");
            if (_arg_3.length > 2)
            {
                this._window.width = parseInt(_arg_3[2]);
            }
            if (((_arg_3.length > 3) && (_arg_3[3] == "true")))
            {
                this._window.border = true;
            }
        }

        public function refresh():void
        {
        }

        public function set _Str_14499(k:String):void
        {
            this._window.caption = (("${" + k) + "}");
        }
    }
}
