package com.sulake.habbo.window.utils
{
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IButtonWindow;

    public class _Str_12599 extends _Str_4045 implements _Str_10548 
    {
        protected var _Str_17547:String = "";
        protected var _Str_15928:String = "";

        public function _Str_12599(k:IHabboWindowManager, _arg_2:XML, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:String, _arg_7:uint, _arg_8:Function)
        {
            super(k, _arg_2, _arg_3, _arg_4, _arg_7, _arg_8, false);
            this.linkTitle = _arg_5;
            this.linkUrl = _arg_6;
        }

        override protected function dialogEventProc(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case "_alert_button_link":
                        HabboWebTools.navigateToURL(this._Str_15928, "_empty");
                        return;
                }
            }
            super.dialogEventProc(k, _arg_2);
        }

        public function set linkTitle(k:String):void
        {
            this._Str_17547 = k;
            if (window)
            {
                IButtonWindow(window.findChildByTag("LINK")).caption = this._Str_17547;
            }
        }

        public function get linkTitle():String
        {
            return this._Str_17547;
        }

        public function set linkUrl(k:String):void
        {
            this._Str_15928 = k;
        }

        public function get linkUrl():String
        {
            return this._Str_15928;
        }
    }
}
