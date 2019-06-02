package com.sulake.habbo.toolbar.memenu
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.toolbar.HabboToolbar;
    import com.sulake.habbo.toolbar.ToolbarView;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.navigator.IHabboNavigator;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_2553;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.habbo.communication.messages.outgoing._Str_364._Str_3075;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.toolbar.HabboToolbarIconEnum;

    public class MeMenuNewController implements IDisposable 
    {
        public static const USE_GUIDE_TOOL:String = "USE_GUIDE_TOOL";

        private var _habboToolbar:HabboToolbar;
        private var _toolbarView:ToolbarView;
        private var _window:IWindowContainer;
        private var _Str_7348:MeMenuNewIconLoader;
        private var _Str_21344:Boolean;
        private var _settingsMenuView:MeMenuSettingsMenuView;
        private var _Str_3359:Map;

        public function MeMenuNewController(k:HabboToolbar, _arg_2:ToolbarView)
        {
            this._Str_3359 = new Map();
            this._habboToolbar = k;
            this._toolbarView = _arg_2;
            this._habboToolbar.events.addEventListener(HabboToolbarEvent.HTE_TOOLBAR_CLICK, this.onToolbarClick);
            var _local_3:XmlAsset = (this._habboToolbar.assets.getAssetByName("me_menu_view_xml") as XmlAsset);
            this._window = (this._habboToolbar.windowManager.buildFromXML((_local_3.content as XML), 2) as IWindowContainer);
            this._Str_7348 = new MeMenuNewIconLoader(this._habboToolbar);
            this._window.visible = false;
            this._window.procedure = this._Str_2533;
        }

        private function _Str_2533(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:IRegionWindow;
            var _local_4:IStaticBitmapWrapperWindow;
            var _local_5:IHabboNavigator;
            var _local_6:String;
            if ((_arg_2 is IRegionWindow))
            {
                _local_3 = (_arg_2 as IRegionWindow);
                switch (k.type)
                {
                    case WindowMouseEvent.OVER:
                        _local_4 = (_local_3.findChildByName((_arg_2.name + "_icon")) as IStaticBitmapWrapperWindow);
                        if (_local_4 != null)
                        {
                            _local_4.assetUri = (("toolbar_memenu_" + _arg_2.name) + "_color");
                        }
                        return;
                    case WindowMouseEvent.OUT:
                        _local_4 = (_local_3.findChildByName((_arg_2.name + "_icon")) as IStaticBitmapWrapperWindow);
                        if (_local_4 != null)
                        {
                            _local_4.assetUri = (("toolbar_memenu_" + _arg_2.name) + "_white");
                        }
                        return;
                    case WindowMouseEvent.CLICK:
                        this._window.visible = false;
                        switch (_arg_2.name)
                        {
                            case "profile":
                                this._habboToolbar.connection.send(new _Str_2553(this._habboToolbar.sessionDataManager.userId));
                                break;
                            case "minimail":
                                HabboWebTools.openMinimail("#mail/inbox/");
                                break;
                            case "rooms":
                                _local_5 = this._habboToolbar.navigator;
                                if (_local_5 != null)
                                {
                                    _local_5.showOwnRooms();
                                }
                                break;
                            case "talents":
                                _local_6 = this._habboToolbar.sessionDataManager.currentTalentTrack;
                                this._habboToolbar.connection.send(new _Str_3075(_local_6));
                                break;
                            case "settings":
                                this._settingsMenuView = new MeMenuSettingsMenuView();
                                this._settingsMenuView.init(this, this._toolbarView);
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
                        }
                        return;
                }
            }
        }

        private function onToolbarClick(k:HabboToolbarEvent):void
        {
            if (this._Str_21344)
            {
                return;
            }
            if (k._Str_3378 == HabboToolbarIconEnum.MEMENU)
            {
                this.toggleVisibility();
            }
            else
            {
                this._window.visible = false;
                if (this._settingsMenuView != null)
                {
                    this._settingsMenuView.dispose();
                    this._settingsMenuView = null;
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
            if (this._settingsMenuView != null)
            {
                this._settingsMenuView.dispose();
                this._settingsMenuView = null;
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
            if (this._settingsMenuView != null)
            {
                this._settingsMenuView.dispose();
                this._settingsMenuView = null;
            }
            this._Str_7348.dispose();
            this._Str_7348 = null;
            this._habboToolbar.events.removeEventListener(HabboToolbarEvent.HTE_TOOLBAR_CLICK, this.onToolbarClick);
            this._toolbarView = null;
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
            this._window.x = (this._toolbarView.window.width + 10);
            this._window.y = (this._toolbarView.window.bottom - this._window.height);
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

        public function set _Str_25935(k:int):void
        {
            this._Str_4168("achievements", k);
        }

        public function set _Str_26372(k:int):void
        {
            this._Str_4168("minimail", k);
        }

        public function set _Str_22759(k:Boolean):void
        {
            this._Str_21344 = k;
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
