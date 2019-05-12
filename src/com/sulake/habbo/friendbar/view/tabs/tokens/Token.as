package com.sulake.habbo.friendbar.view.tabs.tokens
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.game.IHabboGameManager;
    import flash.geom.Rectangle;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.friendbar.data.IFriendNotification;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.core.window.enum.WindowStyle;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.motion.Motions;
    import com.sulake.core.window.motion.DropBounce;

    public class Token implements IDisposable 
    {
        protected static var _Str_12043:IHabboWindowManager;
        protected static var _Str_18375:IAssetLibrary;
        protected static var _Str_9155:IHabboGameManager;
        protected static const TITLE:String = "title";
        protected static const MESSAGE:String = "message";
        protected static const ICON_RECTANGLE:Rectangle = new Rectangle(0, 0, 25, 25);

        protected var _icon:IRegionWindow;
        protected var window:IWindowContainer;
        protected var _disposed:Boolean;
        protected var _Str_4287:IFriendNotification;

        public function Token(k:IFriendNotification)
        {
            this._Str_4287 = k;
        }

        public static function set _Str_3684(k:IHabboWindowManager):void
        {
            _Str_12043 = k;
        }

        public static function set _Str_2787(k:IAssetLibrary):void
        {
            _Str_18375 = k;
        }

        public static function set GAMES(k:IHabboGameManager):void
        {
            _Str_9155 = k;
        }


        public function get _Str_3293():int
        {
            return this._Str_4287._Str_3293;
        }

        public function get _Str_6239():Boolean
        {
            return this._Str_4287._Str_6239;
        }

        public function get notification():IFriendNotification
        {
            return this._Str_4287;
        }

        public function get _Str_3614():IWindow
        {
            return this._icon;
        }

        public function get _Str_21233():IWindow
        {
            return this.window;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (this.window)
            {
                this.window.dispose();
                this.window = null;
            }
            if (this._icon)
            {
                this._icon.dispose();
                this._icon = null;
            }
            this._Str_4287 = null;
            this._disposed = true;
        }

        protected function prepare(k:String, _arg_2:String, _arg_3:String, _arg_4:String):void
        {
            this.window = (_Str_12043.buildFromXML((_Str_18375.getAssetByName(_arg_3).content as XML)) as IWindowContainer);
            this.window.findChildByName(TITLE).caption = k;
            this.window.findChildByName(MESSAGE).caption = ((_arg_2) ? _arg_2 : "");
            this._icon = (_Str_12043.create(("ICON_" + this._Str_3293), WindowType.WINDOW_TYPE_REGION, WindowStyle.WINDOW_STYLE_DEFAULT, WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR, Token.ICON_RECTANGLE) as IRegionWindow);
            this._icon.mouseThreshold = 0;
            var _local_5:IStaticBitmapWrapperWindow = (_Str_12043.create(("BITMAP_" + this._Str_3293), WindowType.WINDOW_TYPE_STATIC_BITMAP_WRAPPER, WindowStyle.WINDOW_STYLE_DEFAULT, WindowParam.WINDOW_PARAM_NULL, Token.ICON_RECTANGLE) as IStaticBitmapWrapperWindow);
            _local_5.assetUri = _arg_4;
            this._icon.addChild(_local_5);
            if (Motions._Str_9810(this._icon) == null)
            {
                Motions._Str_4598(new DropBounce(this._icon, 600, 32));
            }
        }
    }
}
