package com.sulake.habbo.friendbar.view.tabs
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.display.BitmapData;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.motion.Motions;
    import com.sulake.core.window.motion.Combo;
    import com.sulake.core.window.motion.EaseOut;
    import com.sulake.core.window.motion.ResizeTo;
    import com.sulake.core.window.motion.MoveBy;
    import com.sulake.core.window.components.ITextWindow;

    public class AddFriendsTab extends Tab 
    {
        protected static const ICON:String = "icon";
        protected static const TEXT:String = "text";
        protected static const HEADER:String = "header";
        protected static const LABEL:String = "label";
        protected static const BUTTON:String = "button";
        private static const ADD_FRIENDS_TAB_XML:String = "add_friends_tab_xml";
        private static const FIND_FRIENDS_ICON_PNG:String = "find_friends_icon_png";
        private static var _Str_6265:int = -1;
        private static const DEFAULT_COLOR:uint = 8374494;
        private static const _Str_2841:uint = 9560569;
        private static const POOL:Array = [];
        private static const _Str_4440:Array = [];


        public static function _Str_2363():AddFriendsTab
        {
            var k:AddFriendsTab = ((POOL.length > 0) ? POOL.pop() : new (AddFriendsTab)());
            k._Str_2638 = false;
            k._window = k._Str_18310();
            return k;
        }


        public function _Str_18310():IWindowContainer
        {
            var k:IWindowContainer = ((_Str_4440.length > 0) ? _Str_4440.pop() : (_Str_3684.buildFromXML((_Str_2787.getAssetByName(ADD_FRIENDS_TAB_XML).content as XML)) as IWindowContainer));
            var _local_2:IRegionWindow = IRegionWindow(k.findChildByName(HEADER));
            k.addEventListener(WindowMouseEvent.CLICK, onMouseClick);
            k.addEventListener(WindowMouseEvent.OVER, onMouseOver);
            k.addEventListener(WindowMouseEvent.OUT, onMouseOut);
            _local_2.addEventListener(WindowMouseEvent.CLICK, onMouseClick);
            _local_2.addEventListener(WindowMouseEvent.OVER, onMouseOver);
            _local_2.addEventListener(WindowMouseEvent.OUT, onMouseOut);
            if (_Str_6265 < 0)
            {
                _Str_6265 = k.height;
            }
            k.height = HEIGHT;
            var _local_3:IBitmapWrapperWindow = (k.findChildByName(ICON) as IBitmapWrapperWindow);
            _local_3.disposesBitmap = false;
            if (_Str_2787.getAssetByName(FIND_FRIENDS_ICON_PNG) != null)
            {
                _local_3.bitmap = (_Str_2787.getAssetByName(FIND_FRIENDS_ICON_PNG).content as BitmapData);
            }
            var _local_4:IWindow = k.findChildByName(BUTTON);
            _local_4.addEventListener(WindowMouseEvent.CLICK, this._Str_3369);
            var _local_5:IWindow = k.findChildByName(TEXT);
            _local_5.visible = false;
            return k;
        }

        private function _Str_18874(k:IWindowContainer):void
        {
            var _local_2:IRegionWindow;
            if (((k) && (!(k.disposed))))
            {
                k.procedure = null;
                k.removeEventListener(WindowMouseEvent.CLICK, onMouseClick);
                k.removeEventListener(WindowMouseEvent.OVER, onMouseOver);
                k.removeEventListener(WindowMouseEvent.OUT, onMouseOut);
                _local_2 = IRegionWindow(k.findChildByName(HEADER));
                _local_2.removeEventListener(WindowMouseEvent.CLICK, onMouseClick);
                _local_2.removeEventListener(WindowMouseEvent.OVER, onMouseOver);
                _local_2.removeEventListener(WindowMouseEvent.OUT, onMouseOut);
                k.findChildByName(BUTTON).removeEventListener(WindowMouseEvent.CLICK, this._Str_3369);
                k.findChildByName(TEXT).visible = false;
                k.width = WIDTH;
                k.height = HEIGHT;
                if (_Str_4440.indexOf(k) == -1)
                {
                    _Str_4440.push(k);
                }
            }
        }

        override public function select(k:Boolean):void
        {
            if (!selected)
            {
                if ((((k) && (_Str_11139)) && (Motions._Str_9810(window) == null)))
                {
                    Motions._Str_4598(new Combo(new EaseOut(new ResizeTo(window, _Str_6722, window.width, _Str_6265), _Str_6252), new EaseOut(new MoveBy(window, _Str_6722, window.x, -(_Str_6265 - HEIGHT)), _Str_6252)));
                }
                else
                {
                    window.height = _Str_6265;
                    window.y = (window.y - (window.height - HEIGHT));
                }
                window.findChildByName(TEXT).visible = true;
                super.select(k);
            }
        }

        override public function deselect(k:Boolean):void
        {
            if (selected)
            {
                window.y = 0;
                window.height = HEIGHT;
                window.findChildByName(TEXT).visible = false;
                super.deselect(k);
            }
        }

        override public function recycle():void
        {
            if (!disposed)
            {
                if (!_Str_2638)
                {
                    if (_window)
                    {
                        this._Str_18874(_window);
                        _window = null;
                    }
                    _Str_2638 = true;
                    POOL.push(this);
                }
            }
        }

        override protected function expose():void
        {
            super.expose();
            ITextWindow(window.findChildByTag(LABEL)).underline = _Str_3341;
            window.color = ((_Str_3341) ? _Str_2841 : DEFAULT_COLOR);
        }

        override protected function conceal():void
        {
            super.conceal();
            ITextWindow(window.findChildByTag(LABEL)).underline = _Str_3341;
            window.color = ((_Str_3341) ? _Str_2841 : DEFAULT_COLOR);
        }

        private function _Str_3369(k:WindowMouseEvent):void
        {
            if (((!(disposed)) && (!(_Str_6044))))
            {
                _Str_2925.findNewFriends();
                this.deselect(true);
            }
        }
    }
}




