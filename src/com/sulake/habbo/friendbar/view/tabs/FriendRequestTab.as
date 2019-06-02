package com.sulake.habbo.friendbar.view.tabs
{
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.habbo.friendbar.data.FriendEntity;
    import com.sulake.habbo.friendbar.data.IFriendRequest;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components.IBubbleWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.core.window.enum.WindowStyle;
    import com.sulake.core.window.enum.WindowParam;
    import flash.geom.Rectangle;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IIconWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.friendbar.data.FriendRequest;

    public class FriendRequestTab extends FriendEntityTab 
    {
        protected static const FRIEND_REQUEST_TAB_XML:String = "friend_request_tab_xml";
        protected static const BUBBLE:String = "bubble";
        protected static const MESSAGE:String = "message";
        protected static const BUTTON_ACCEPT:String = "button_accept";
        protected static const BUTTON_CLOSE:String = "button_close";
        protected static const CLICK_REGION_REJECT:String = "click_region_reject";
        protected static const LINK_REJECT:String = "link_reject";
        private static const DEFAULT_COLOR:uint = 16435481;
        private static const _Str_2841:uint = 16767334;
        private static const _Str_5223:uint = 16770666;
        private static const _Str_5225:uint = 0xFFFFFF;
        private static var _Str_4254:FriendRequestTab;

        private var _Str_23728:String;

        public function FriendRequestTab()
        {
            _window = this._Str_17362();
            if (_window)
            {
                _window.findChildByName(BUBBLE).visible = false;
            }
        }

        public static function _Str_2363(k:IFriendRequest):FriendRequestTab
        {
            var _local_3:IBitmapWrapperWindow;
            var _local_2:FriendRequestTab = ((_Str_4254) ? _Str_4254 : new (FriendRequestTab)());
            _local_2._Str_2638 = false;
            if (_local_2.friend)
            {
                if (_local_2.friend.figure != k.figure)
                {
                    _local_3 = IBitmapWrapperWindow(_local_2.window.findChildByName(CANVAS));
                    _local_3.bitmap = _Str_3553.getAvatarFaceBitmap(k.figure);
                }
            }
            _local_2.friend = new FriendEntity(k.id, k.name, null, null, -1, false, false, k.figure, 0, null);
            return _local_2;
        }


        override public function dispose():void
        {
            if (_window)
            {
                this._Str_18446(_window);
                _window = null;
            }
            super.dispose();
        }

        override public function recycle():void
        {
            if (!disposed)
            {
                if (!_Str_2638)
                {
                    _Str_2568 = null;
                    _Str_2638 = true;
                    _Str_4254 = this;
                }
            }
        }

        override public function select(k:Boolean):void
        {
            var _local_2:IWindow;
            if (!selected)
            {
                if (_window)
                {
                    _local_2 = _window.findChildByName(BUBBLE);
                    if (_local_2)
                    {
                        _local_2.visible = true;
                    }
                }
                super.select(k);
            }
        }

        override public function deselect(k:Boolean):void
        {
            var _local_2:IWindow;
            if (selected)
            {
                if (_window)
                {
                    _local_2 = _window.findChildByName(BUBBLE);
                    if (_local_2)
                    {
                        _local_2.visible = false;
                    }
                }
                super.deselect(k);
            }
        }

        override protected function expose():void
        {
            super.expose();
            _window.color = ((_Str_3341) ? _Str_2841 : DEFAULT_COLOR);
        }

        override protected function conceal():void
        {
            super.conceal();
            _window.color = ((_Str_3341) ? _Str_2841 : DEFAULT_COLOR);
        }

        private function _Str_17362():IWindowContainer
        {
            var _local_7:BitmapDataAsset;
            var k:IWindowContainer = (_Str_3684.buildFromXML((_Str_2787.getAssetByName(FRIEND_REQUEST_TAB_XML).content as XML)) as IWindowContainer);
            var _local_2:IBitmapWrapperWindow = IBitmapWrapperWindow(k.findChildByName(CANVAS));
            var _local_3:IRegionWindow = IRegionWindow(k.findChildByName(HEADER));
            var _local_4:IRegionWindow = IRegionWindow(k.findChildByName(REGION_PROFILE));
            var _local_5:IWindow = k.findChildByName(ICONS);
            var _local_6:IBubbleWindow = (k.findChildByName(BUBBLE) as IBubbleWindow);
            k.x = 0;
            k.y = 0;
            k.width = WIDTH;
            k.height = HEIGHT;
            k.addEventListener(WindowMouseEvent.CLICK, onMouseClick);
            k.addEventListener(WindowMouseEvent.OVER, onMouseOver);
            k.addEventListener(WindowMouseEvent.OUT, onMouseOut);
            _local_3.addEventListener(WindowMouseEvent.CLICK, onMouseClick);
            _local_3.addEventListener(WindowMouseEvent.OVER, onMouseOver);
            _local_3.addEventListener(WindowMouseEvent.OUT, onMouseOut);
            _local_4.addEventListener(WindowMouseEvent.CLICK, _Str_5926);
            _local_4._Str_2613 = _Str_3840.getLocalization("infostand.profile.link.tooltip", "");
            _local_4._Str_3099 = 100;
            _local_5.addEventListener(WindowMouseEvent.CLICK, onMouseClick);
            _local_5.addEventListener(WindowMouseEvent.OVER, onMouseOver);
            _local_5.addEventListener(WindowMouseEvent.OUT, onMouseOut);
            _local_2.disposesBitmap = true;
            _local_6.procedure = this._Str_5860;
            _local_6.y = (-(_local_6.height - (_local_6.height - _local_6.margins.bottom)) - 1);
            var _local_8:IRegionWindow = (_Str_3684.create("ICON", WindowType.WINDOW_TYPE_REGION, WindowStyle.WINDOW_STYLE_DEFAULT, WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR, new Rectangle(0, 0, 25, 25)) as IRegionWindow);
            _local_8.mouseThreshold = 0;
            var _local_9:IBitmapWrapperWindow = (_Str_3684.create("BITMAP", WindowType.WINDOW_TYPE_BITMAP_WRAPPER, WindowStyle.WINDOW_STYLE_DEFAULT, WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT, new Rectangle(0, 0, 25, 25)) as IBitmapWrapperWindow);
            _local_9.disposesBitmap = false;
            _local_7 = (_Str_2787.getAssetByName("plus_friend_icon_png") as BitmapDataAsset);
            if (_local_7)
            {
                _local_9.bitmap = (_local_7.content as BitmapData);
            }
            _local_8.addChild(_local_9);
            IItemListWindow(k.findChildByName(ICONS)).addListItemAt(_local_8, 0);
            return k;
        }

        private function _Str_18446(k:IWindowContainer):void
        {
            var _local_2:IRegionWindow;
            var _local_3:IWindow;
            var _local_4:IRegionWindow;
            var _local_5:IBitmapWrapperWindow;
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
                _local_3 = k.findChildByName(ICONS);
                _local_3.removeEventListener(WindowMouseEvent.CLICK, onMouseClick);
                _local_3.removeEventListener(WindowMouseEvent.OVER, onMouseClick);
                _local_3.removeEventListener(WindowMouseEvent.OUT, onMouseClick);
                _local_4 = IRegionWindow(k.findChildByName(REGION_PROFILE));
                _local_4.removeEventListener(WindowMouseEvent.CLICK, _Str_5926);
                k.width = WIDTH;
                k.height = HEIGHT;
                k.color = DEFAULT_COLOR;
                _local_5 = IBitmapWrapperWindow(k.findChildByName(CANVAS));
                _local_5.bitmap = null;
                ITextWindow(k.findChildByTag("label")).underline = false;
            }
        }

        private function _Str_5860(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case BUTTON_ACCEPT:
                        _Str_2925.acceptFriendRequest(_Str_2568.id);
                        break;
                    case BUTTON_CLOSE:
                        if (selected)
                        {
                            _Str_3553.deSelect(true);
                        }
                        break;
                    case BUTTON_PROFILE:
                        _Str_4533.trackGoogle("extendedProfile", "friendBar_friendRequestButton");
                        _Str_2925.showProfile(_Str_2568.id);
                        break;
                    case CLICK_REGION_REJECT:
                        _Str_2925.declineFriendRequest(_Str_2568.id);
                        break;
                }
            }
            else
            {
                if (k.type == WindowMouseEvent.OVER)
                {
                    if (_arg_2.name == CLICK_REGION_REJECT)
                    {
                        ITextWindow(IWindowContainer(_arg_2).getChildByName(LINK_REJECT)).textColor = _Str_5223;
                    }
                    if (_arg_2.name == BUTTON_PROFILE)
                    {
                        IIconWindow(IWindowContainer(_arg_2).findChildByName("icon")).style = 22;
                    }
                    if (_arg_2.name == REGION_PROFILE)
                    {
                        ITextWindow(IWindowContainer(_arg_2).getChildByName("name")).underline = true;
                    }
                }
                else
                {
                    if (k.type == WindowMouseEvent.OUT)
                    {
                        if (_arg_2.name == CLICK_REGION_REJECT)
                        {
                            ITextWindow(IWindowContainer(_arg_2).getChildByName(LINK_REJECT)).textColor = _Str_5225;
                        }
                        if (_arg_2.name == BUTTON_PROFILE)
                        {
                            IIconWindow(IWindowContainer(_arg_2).findChildByName("icon")).style = 21;
                        }
                        if (_arg_2.name == REGION_PROFILE)
                        {
                            ITextWindow(IWindowContainer(_arg_2).getChildByName("name")).underline = false;
                        }
                    }
                }
            }
        }

        public function _Str_840(k:FriendRequest, _arg_2:BitmapData):void
        {
            var _local_3:IBitmapWrapperWindow;
            var _local_4:BitmapData;
            if (!disposed)
            {
                if (friend)
                {
                    if (friend.figure == k.figure)
                    {
                        _local_3 = (_window.findChildByName(CANVAS) as IBitmapWrapperWindow);
                        if (_local_3)
                        {
                            _local_4 = _Str_3553.getAvatarFaceBitmap(k.figure);
                            if (_local_4)
                            {
                                _local_3.bitmap = _local_4;
                                _local_3.width = _local_4.width;
                                _local_3.height = _local_4.height;
                            }
                        }
                    }
                }
            }
        }
    }
}
