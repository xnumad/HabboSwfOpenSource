package com.sulake.habbo.toolbar.memenu
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.toolbar.HabboToolbar;
    import com.sulake.habbo.toolbar.BottomBarLeft;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.navigator.IHabboNavigator;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_2553;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.habbo.communication.messages.outgoing._Str_364._Str_3075;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
    import flash.geom.Rectangle;

    public class MeMenuNewView implements IDisposable 
    {
        public static const USE_GUIDE_TOOL:String = "USE_GUIDE_TOOL";

        private var _habboToolbar:HabboToolbar;
        private var _Str_2617:BottomBarLeft;
        private var _window:IWindowContainer;
        private var _Str_7348:MeMenuIconLoader;
        private var _Str_3357:MeMenuSettingsMenuView;
        private var _Str_3359:Map;

        public function MeMenuNewView(k:HabboToolbar, _arg_2:BottomBarLeft)
        {
            this._Str_3359 = new Map();
            this._habboToolbar = k;
            this._Str_2617 = _arg_2;
            this._habboToolbar.events.addEventListener(HabboToolbarEvent.HTE_TOOLBAR_CLICK, this.onToolbarClick);
            var _local_3:XmlAsset = (this._habboToolbar.assets.getAssetByName("me_menu_new_view_xml") as XmlAsset);
            this._window = (this._habboToolbar.windowManager.buildFromXML((_local_3.content as XML), 2) as IWindowContainer);
            this._Str_7348 = new MeMenuIconLoader(this._habboToolbar);
            this._window.visible = false;
            this._window.procedure = this._Str_2533;
        }

        private function _Str_2533(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:IRegionWindow;
            var _local_4:IStaticBitmapWrapperWindow;
            var _local_5:IStaticBitmapWrapperWindow;
            var _local_6:ITextWindow;
            var _local_7:IHabboNavigator;
            var _local_8:String;
            if ((_arg_2 is IRegionWindow))
            {
                _local_3 = (_arg_2 as IRegionWindow);
                _local_4 = (_local_3.findChildByName((_arg_2.name + "_icon_color")) as IStaticBitmapWrapperWindow);
                _local_5 = (_local_3.findChildByName((_arg_2.name + "_icon_grey")) as IStaticBitmapWrapperWindow);
                _local_6 = (_local_3.findChildByName("field_text") as ITextWindow);
                switch (k.type)
                {
                    case WindowMouseEvent.OVER:
                        if (((!(_local_4 == null)) && (!(_local_5 == null))))
                        {
                            _local_4.visible = true;
                            _local_5.visible = false;
                            if (_local_6 != null)
                            {
                                _local_6.textColor = 2215924;
                            }
                        }
                        return;
                    case WindowMouseEvent.OUT:
                        if (((!(_local_4 == null)) && (!(_local_5 == null))))
                        {
                            _local_4.visible = false;
                            _local_5.visible = true;
                            if (_local_6 != null)
                            {
                                _local_6.textColor = 0xFFFFFF;
                            }
                        }
                        return;
                    case WindowMouseEvent.CLICK:
                        this._window.visible = false;
                        if (this._habboToolbar != null)
                        {
                            switch (_arg_2.name)
                            {
                                case "profile":
                                    this._habboToolbar.connection.send(new _Str_2553(this._habboToolbar.sessionDataManager.userId));
                                    break;
                                case "minimail":
                                    HabboWebTools.openMinimail("#mail/inbox/");
                                    break;
                                case "rooms":
                                    _local_7 = this._habboToolbar.navigator;
                                    if (_local_7 != null)
                                    {
                                        _local_7.showOwnRooms();
                                    }
                                    break;
                                case "talents":
                                    _local_8 = this._habboToolbar.sessionDataManager.currentTalentTrack;
                                    this._habboToolbar.connection.send(new _Str_3075(_local_8));
                                    break;
                                case "settings":
                                    break;
                                case "achievements":
                                    this._habboToolbar.questEngine.showAchievements();
                                    break;
                                case "guide":
                                    this._habboToolbar.toggleWindowVisibility("GUIDE");
                                    break;
                                case "clothes":
                                    this._habboToolbar.context.createLinkEvent("avatareditor/open");
                                    break;
                                case "forums":
                                    this._habboToolbar.context.createLinkEvent("groupforum/list/my");
                                    break;
                            }
                            return;
                        }
                }
            }
        }

        private function onToolbarClick(k:HabboToolbarEvent):void
        {
            if (k._Str_3378 == HabboToolbarIconEnum.MEMENU)
            {
                this.toggleVisibility();
            }
            else
            {
                this._window.visible = false;
                if (this._Str_3357 != null)
                {
                    this._Str_3357.dispose();
                    this._Str_3357 = null;
                }
            }
        }

        private function _Str_8899(k:Boolean):void
        {
            this._window.findChildByName("guide").visible = k;
            this._window.height = ((k) ? (this._window.findChildByName("guide").bottom + 5) : (this._window.findChildByName("achievements").bottom + 5));
        }

        public function toggleVisibility():void
        {
            var k:Boolean;
            if (this._Str_3357 != null)
            {
                this._Str_3357.dispose();
                this._Str_3357 = null;
            }
            this._window.visible = (!(this._window.visible));
            if (this._window.visible)
            {
                if (!this.toolbar.getBoolean("talent.track.enabled"))
                {
                    this._window.findChildByName("guide").rectangle = this._window.findChildByName("talents").rectangle;
                    this._window.findChildByName("talents").visible = false;
                }
                if (this._habboToolbar.getBoolean("guides.enabled"))
                {
                    k = this._habboToolbar.sessionDataManager.isPerkAllowed(USE_GUIDE_TOOL);
                    this._Str_8899(k);
                }
            }
            this._Str_5615();
        }

        public function dispose():void
        {
            if (this.disposed)
            {
                return;
            }
            if (this._Str_3357 != null)
            {
                this._Str_3357.dispose();
                this._Str_3357 = null;
            }
            this._Str_7348.dispose();
            this._Str_7348 = null;
            this._habboToolbar.events.removeEventListener(HabboToolbarEvent.HTE_TOOLBAR_CLICK, this.onToolbarClick);
            this._Str_2617 = null;
            this._habboToolbar = null;
        }

        public function get disposed():Boolean
        {
            return this._habboToolbar == null;
        }

        public function get toolbar():HabboToolbar
        {
            return this._habboToolbar;
        }

        public function get window():IWindowContainer
        {
            return this._window;
        }

        public function _Str_5615():void
        {
            this._window.x = 3;
            this._window.y = (this._Str_2617.window.top - this._window.height);
        }

        public function _Str_23094(k:String):Rectangle
        {
            var _local_2:Rectangle;
            var _local_3:IWindow = this._window.findChildByName(k);
            if (_local_3)
            {
                _local_2 = _local_3.rectangle;
                _local_2.x = (_local_2.x + (this._window.x + (_local_3.width / 2)));
                _local_2.y = (_local_2.y + (this._window.y + (_local_3.height / 2)));
                this._window.visible = true;
            }
            return _local_2;
        }

        public function _Str_6621(k:String):IWindow
        {
            var _local_2:IWindow = this._window.findChildByName(k);
            if (_local_2)
            {
                this._window.visible = true;
            }
            return _local_2;
        }

        public function _Str_7926(k:String):IWindowContainer
        {
            var _local_4:IWindowContainer;
            var _local_2:String = k;
            if (!_local_2)
            {
                Logger.log(("[Toolbar] Unknown icon type for unseen item counter for iconId: " + k));
            }
            var _local_3:IWindowContainer = (this._Str_3359.getValue(k) as IWindowContainer);
            if (!_local_3)
            {
                _local_3 = this._habboToolbar.windowManager.createUnseenItemCounter();
                _local_4 = (this._window.findChildByName(_local_2) as IWindowContainer);
                if (_local_4)
                {
                    _local_4.addChild(_local_3);
                    _local_3.x = ((_local_4.width - _local_3.width) - 5);
                    _local_3.y = 5;
                    this._Str_3359.add(k, _local_3);
                }
            }
            return _local_3;
        }

        public function set _Str_23581(k:int):void
        {
            this._Str_4168("achievements", k);
        }

        public function set _Str_25841(k:int):void
        {
            this._Str_4168("minimail", k);
        }

        public function set _Str_9691(k:int):void
        {
            this._Str_4168("forums", k);
        }

        public function _Str_4168(k:String, _arg_2:int):void
        {
            var _local_3:IWindowContainer = this._Str_7926(k);
            if (!_local_3)
            {
                return;
            }
            if (_arg_2 < 0)
            {
                _local_3.visible = true;
                _local_3.findChildByName("count").caption = " ";
            }
            else
            {
                if (_arg_2 > 0)
                {
                    _local_3.visible = true;
                    _local_3.findChildByName("count").caption = _arg_2.toString();
                }
                else
                {
                    _local_3.visible = false;
                }
            }
        }
    }
}
