package com.sulake.habbo.ui.widget.avatarinfo
{
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.IWindowContainer;

    public class NewUserHelpView extends AvatarContextInfoButtonView 
    {
        private var _caption:String = "";

        public function NewUserHelpView(k:AvatarInfoWidget)
        {
            super(k);
            this._caption = k.localization.getLocalization("room.enter.infostand.caption", "");
            _Str_12637 = k.configuration.getInteger("room.enter.infostand.fade.start.delay", 5000);
        }

        public static function setup(k:AvatarContextInfoButtonView, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:int):void
        {
            AvatarContextInfoButtonView.setup(k, _arg_2, _arg_3, _arg_4, _arg_5, false);
        }


        override protected function updateWindow():void
        {
            var k:XML;
            var _local_2:IWindow;
            if ((((!(_Str_2268)) || (!(_Str_2268.assets))) || (!(_Str_2268.windowManager))))
            {
                return;
            }
            if (!window)
            {
                k = (_Str_2268.assets.getAssetByName("new_user_help").content as XML);
                _window = (_Str_2268.windowManager.buildFromXML(k, 0) as IWindowContainer);
                if (!window)
                {
                    return;
                }
                _local_2 = window.findChildByName("help");
                _local_2.caption = this._caption;
                _window.invalidate();
            }
            activeView = _window;
        }

        public function get widget():AvatarInfoWidget
        {
            return _Str_2268 as AvatarInfoWidget;
        }
    }
}



