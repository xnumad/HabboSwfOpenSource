package com.sulake.habbo.friendbar.view.tabs
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IBubbleWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.friendbar.data.FriendRequest;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.display.BitmapData;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;

    public class FriendRequestsTab extends Tab 
    {
        protected static const FRIEND_REQUESTS_TAB_XML:String = "friend_requests_tab_xml";
        protected static const ICON:String = "icon";
        protected static const LABEL:String = "label";
        protected static const HEADER:String = "header";
        protected static const CANVAS:String = "canvas";
        protected static const BUBBLE:String = "bubble";
        protected static const REQUEST_ENTITY_LIST:String = "request_entity_list";
        protected static const NAME:String = "name";
        protected static const BADGE_COUNTER:String = "badge_counter";
        protected static const REGION_PROFILE:String = "region_profile";
        protected static const REGION_PROFILE_NAME:String = "region_profile_name";
        protected static const BUTTON_ACCEPT_ALL:String = "button_accept_all";
        protected static const CLICK_AREA_DISCARD_ALL:String = "click_area_discard_all";
        protected static const BUTTON_CLOSE:String = "button_close";
        protected static const BUTTON_ACCEPT:String = "button_accept";
        protected static const CLICK_AREA_DISCARD:String = "click_area_discard";
        protected static const TEXT_DISCARD:String = "text_discard";
        private static var _Str_4254:FriendRequestsTab;
        private static const DEFAULT_COLOR:uint = 4294625561;
        private static const _Str_2841:uint = 0xFFFFD966;
        private static const _Str_16055:uint = 4289431312;
        private static const _Str_16914:uint = 4290616362;
        private static const _Str_5223:uint = 16770666;
        private static const _Str_5225:uint = 0xFFFFFF;

        private var _Str_3000:Array;
        private var _Str_16213:Boolean = false;
        private var _Str_12138:IWindowContainer;

        public function FriendRequestsTab()
        {
            _window = this._Str_24108();
        }

        public static function _Str_2363(k:Array):FriendRequestsTab
        {
            var _local_2:FriendRequestsTab = ((_Str_4254) ? _Str_4254 : new (FriendRequestsTab)());
            _local_2._Str_2638 = false;
            _local_2._Str_3000 = k;
            _local_2._window.findChildByName(BADGE_COUNTER).caption = String(k.length);
            return _local_2;
        }


        override public function dispose():void
        {
            if (_window)
            {
                this._Str_25079(_window);
                _window = null;
            }
            if (this._Str_12138)
            {
                this._Str_12138.dispose();
                this._Str_12138 = null;
            }
            super.dispose();
        }

        override public function recycle():void
        {
            var k:IBubbleWindow;
            var _local_2:IItemListWindow;
            if (!disposed)
            {
                if (!_Str_2638)
                {
                    if (window)
                    {
                        k = (window.findChildByName(BUBBLE) as IBubbleWindow);
                        if (k)
                        {
                            _local_2 = (k.content.getChildByName(REQUEST_ENTITY_LIST) as IItemListWindow);
                            if (_local_2)
                            {
                                while (_local_2.numListItems > 0)
                                {
                                    _local_2.removeListItemAt(0).dispose();
                                }
                            }
                        }
                    }
                    this._Str_16213 = false;
                    this._Str_3000 = null;
                    _Str_2638 = true;
                    _Str_4254 = this;
                }
            }
        }

        override public function select(k:Boolean):void
        {
            var _local_2:IBubbleWindow;
            var _local_3:IItemListWindow;
            var _local_4:IWindowContainer;
            var _local_5:FriendRequest;
            var _local_6:IBitmapWrapperWindow;
            var _local_7:int;
            var _local_8:int;
            var _local_9:BitmapData;
            if (!selected)
            {
                if (window)
                {
                    _local_2 = (window.findChildByName(BUBBLE) as IBubbleWindow);
                    if (_local_2)
                    {
                        _local_2.visible = true;
                        if (!this._Str_16213)
                        {
                            _local_3 = (_local_2.content.getChildByName(REQUEST_ENTITY_LIST) as IItemListWindow);
                            if (_local_3)
                            {
                                _local_7 = 0;
                                _local_8 = 0;
                                while (_local_8 < this._Str_3000.length)
                                {
                                    _local_4 = (this._Str_12138.clone() as IWindowContainer);
                                    _local_4.color = (((_local_8 % 2) == 0) ? _Str_16055 : _Str_16914);
                                    _local_5 = this._Str_3000[_local_8];
                                    _local_4.id = _local_5.id;
                                    _local_4.findChildByName(NAME).caption = _local_5.name;
                                    _local_6 = (_local_4.findChildByName(CANVAS) as IBitmapWrapperWindow);
                                    _local_9 = _Str_3553.getAvatarFaceBitmap(_local_5.figure);
                                    if (_local_9)
                                    {
                                        _local_6.disposesBitmap = false;
                                        _local_6.bitmap = _local_9;
                                        _local_6.width = _local_9.width;
                                        _local_6.height = _local_9.height;
                                        _local_6.disposesBitmap = true;
                                    }
                                    _local_3.addListItem(_local_4);
                                    _local_7 = (_local_7 + (_local_4.height + _local_3.spacing));
                                    _local_8++;
                                }
                                _local_3.height = _local_7;
                            }
                        }
                        this._Str_16213 = true;
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
                if (window)
                {
                    _local_2 = window.findChildByName(BUBBLE);
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
            window.color = ((_Str_3341) ? _Str_2841 : DEFAULT_COLOR);
            ITextWindow(window.findChildByTag(LABEL)).underline = _Str_3341;
        }

        override protected function conceal():void
        {
            super.conceal();
            window.color = ((_Str_3341) ? _Str_2841 : DEFAULT_COLOR);
            ITextWindow(window.findChildByTag(LABEL)).underline = _Str_3341;
        }

        private function _Str_24108():IWindowContainer
        {
            var _local_7:BitmapDataAsset;
            var k:IWindowContainer = (_Str_3684.buildFromXML((_Str_2787.getAssetByName(FRIEND_REQUESTS_TAB_XML).content as XML)) as IWindowContainer);
            var _local_2:IBitmapWrapperWindow = IBitmapWrapperWindow(k.findChildByName(CANVAS));
            var _local_3:IRegionWindow = IRegionWindow(k.findChildByName(HEADER));
            var _local_4:IRegionWindow = IRegionWindow(k.findChildByName(REGION_PROFILE));
            var _local_5:IRegionWindow = IRegionWindow(k.findChildByName(REGION_PROFILE_NAME));
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
            _local_4._Str_2613 = _Str_3840.getLocalization("infostand.profile.link.tooltip", "");
            _local_4._Str_3099 = 100;
            _local_5._Str_2613 = _Str_3840.getLocalization("infostand.profile.link.tooltip", "");
            _local_5._Str_3099 = 100;
            _local_2.disposesBitmap = true;
            _local_6.visible = false;
            _local_6.y = (-(_local_6.height - (_local_6.height - _local_6.margins.bottom)) - 1);
            _local_6.procedure = this._Str_5860;
            _local_7 = (_Str_2787.getAssetByName("add_friends_icon_png") as BitmapDataAsset);
            var _local_8:IBitmapWrapperWindow = (k.findChildByName(ICON) as IBitmapWrapperWindow);
            _local_8.disposesBitmap = false;
            _local_8.bitmap = (_local_7.content as BitmapData);
            var _local_9:IItemListWindow = (_local_6.content.getChildByName(REQUEST_ENTITY_LIST) as IItemListWindow);
            this._Str_12138 = (_local_9.removeListItemAt(0) as IWindowContainer);
            return k;
        }

        private function _Str_25079(k:IWindowContainer):void
        {
            var _local_2:IRegionWindow;
            var _local_3:IBitmapWrapperWindow;
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
                k.width = WIDTH;
                k.height = HEIGHT;
                k.color = DEFAULT_COLOR;
                _local_3 = IBitmapWrapperWindow(k.findChildByName(CANVAS));
                if (_local_3)
                {
                    _local_3.bitmap = null;
                }
                ITextWindow(k.findChildByTag(LABEL)).underline = false;
            }
        }

        private function _Str_5860(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case BUTTON_CLOSE:
                        if (selected)
                        {
                            _Str_3553.deSelect(true);
                        }
                        break;
                    case BUTTON_ACCEPT_ALL:
                        _Str_2925.acceptAllFriendRequests();
                        break;
                    case CLICK_AREA_DISCARD_ALL:
                        _Str_2925.declineAllFriendRequests();
                        break;
                    case BUTTON_ACCEPT:
                        _Str_2925.acceptFriendRequest(_arg_2.parent.id);
                        break;
                    case CLICK_AREA_DISCARD:
                        _Str_2925.declineFriendRequest(_arg_2.parent.id);
                        break;
                    case REGION_PROFILE:
                        _Str_4533.trackGoogle("extendedProfile", "friendBar_multipleFriendRequestsAvatar");
                        _Str_2925.showProfile(_arg_2.parent.id);
                        break;
                    case REGION_PROFILE_NAME:
                        _Str_4533.trackGoogle("extendedProfile", "friendBar_multipleFriendRequestsName");
                        _Str_2925.showProfile(_arg_2.parent.id);
                        break;
                }
            }
            else
            {
                if (k.type == WindowMouseEvent.OVER)
                {
                    if (_arg_2.name == CLICK_AREA_DISCARD)
                    {
                        ITextWindow(IWindowContainer(_arg_2).getChildByName(TEXT_DISCARD)).textColor = _Str_5223;
                    }
                    if (_arg_2.name == REGION_PROFILE_NAME)
                    {
                        ITextWindow(IWindowContainer(_arg_2).getChildByName(NAME)).underline = true;
                    }
                }
                else
                {
                    if (k.type == WindowMouseEvent.OUT)
                    {
                        if (_arg_2.name == CLICK_AREA_DISCARD)
                        {
                            ITextWindow(IWindowContainer(_arg_2).getChildByName(TEXT_DISCARD)).textColor = _Str_5225;
                        }
                        if (_arg_2.name == REGION_PROFILE_NAME)
                        {
                            ITextWindow(IWindowContainer(_arg_2).getChildByName(NAME)).underline = false;
                        }
                    }
                }
            }
        }

        public function _Str_840(k:FriendRequest, _arg_2:BitmapData):void
        {
            var _local_4:IItemListWindow;
            var _local_5:IWindowContainer;
            var _local_6:int;
            var _local_7:IBitmapWrapperWindow;
            if (disposed)
            {
                return;
            }
            var _local_3:IBubbleWindow = (window.findChildByName(BUBBLE) as IBubbleWindow);
            if (_local_3)
            {
                _local_4 = (_local_3.content.getChildByName(REQUEST_ENTITY_LIST) as IItemListWindow);
                if (_local_4)
                {
                    _local_6 = 0;
                    while (_local_6 < _local_4.numListItems)
                    {
                        _local_5 = (_local_4.getListItemAt(_local_6) as IWindowContainer);
                        if (_local_5.id == k.id)
                        {
                            _local_7 = (_local_5.findChildByName(CANVAS) as IBitmapWrapperWindow);
                            _local_7.disposesBitmap = true;
                            _local_7.bitmap = _arg_2;
                            _local_7.width = _arg_2.width;
                            _local_7.height = _arg_2.height;
                            return;
                        }
                        _local_6++;
                    }
                }
            }
        }
    }
}











