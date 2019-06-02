package com.sulake.habbo.toolbar
{
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import flash.geom.Point;
    import com.sulake.core.window.IWindowContainer;
    import flash.events.IEventDispatcher;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.utils.Map;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components.IBoxSizerWindow;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.toolbar.memenu.MeMenuNewView;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.localization.ILocalization;
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.catalog.enum.CatalogPageName;
    import com.sulake.habbo.catalog.event.CatalogEvent;
    import com.sulake.habbo.communication.enum.perk.PerkEnum;
    import flash.geom.Rectangle;
    import com.sulake.core.window.components.IBorderWindow;
    import com.sulake.core.window.utils.IBitmapDataContainer;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.enum.WindowType;
    import flash.filters.GlowFilter;
    import flash.filters.BitmapFilterQuality;
    import com.sulake.core.window.motion.Motions;
    import com.sulake.core.window.motion.Queue;
    import com.sulake.core.window.motion.Wait;
    import com.sulake.core.window.motion.DropBounce;
    import com.sulake.core.window.motion.EaseOut;
    import com.sulake.core.window.motion.JumpBy;
    import com.sulake.core.window.motion.Dispose;
    import com.sulake.core.window.motion.Motion;
    import com.sulake.habbo.session.SecurityLevelEnum;

    public class BottomBarLeft implements ILinkEventTracker 
    {
        private static const _Str_3163:Point = new Point(0, 500);
        private static const _Str_7220:Point = new Point(0, 500);
        private static const _Str_7111:uint = 7433577;
        private static const _Str_7665:uint = 5723213;
        private static const _HOVER:String = "_hover";
        private static const _NORMAL:String = "_normal";
        private static const _Str_3504:int = 0;
        private static const ICON_ME_MENU:String = "icon_me_menu";
        private static const _Str_16891:int = 45;
        private static const _Str_8952:int = 20;
        private static const _Str_16288:int = 10;
        private static const _Str_6651:int = 185;

        private var _window:IWindowContainer;
        private var _events:IEventDispatcher;
        private var _disposed:Boolean;
        private var _toolbar:HabboToolbar;
        private var _assets:IAssetLibrary;
        private var _windowManager:IHabboWindowManager;
        private var _unseenItemCounters:Map;
        private var _newItemsNotification:IWindowContainer;
        private var _newItemsNotificationEnabled:Boolean;
        private var _meMenuNormalBitmap:BitmapData;
        private var _left_arrow:IRegionWindow;
        private var _right_arrow:IRegionWindow;
        private var _buttonContainer:IBoxSizerWindow;
        private var _verticalLine:IStaticBitmapWrapperWindow;
        private var _previousState:String;
        private var _unseenMiniMailMessageCount:int;
        private var _unseenAchievementCount:int;
        private var _unseenForumsCount:int;
        private var _collapsed:Boolean = false;
        private var _memenu:MeMenuNewView;

        public function BottomBarLeft(k:HabboToolbar, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:IEventDispatcher)
        {
            var _local_9:IWindow;
            var _local_10:Boolean;
            var _local_12:IWindowContainer;
            super();
            this._toolbar = k;
            this._windowManager = _arg_2;
            this._assets = _arg_3;
            this._events = _arg_4;
            this._memenu = new MeMenuNewView(this._toolbar, this);
            this._unseenItemCounters = new Map();
            var _local_5:XmlAsset = (_arg_3.getAssetByName("bottom_bar_left_xml") as XmlAsset);
            this._window = (_arg_2.buildFromXML((_local_5.content as XML)) as IWindowContainer);
            if (this._window == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            }
            this._window.addEventListener(WindowEvent.WINDOW_EVENT_PARENT_RESIZED, this._Str_16256);
            this._buttonContainer = (this._window.getChildByName("toolbar_items") as IBoxSizerWindow);
            var _local_6:IWindowContainer = (this._window.getChildByName("arrow_container_left") as IWindowContainer);
            var _local_7:IWindowContainer = (this._window.getChildByName("arrow_container_right") as IWindowContainer);
            this._left_arrow = (_local_6.getChildByName("collapse_left") as IRegionWindow);
            this._right_arrow = (_local_7.getChildByName("collapse_right") as IRegionWindow);
            if (this._left_arrow)
            {
                this._left_arrow.addEventListener(WindowMouseEvent.CLICK, this._Str_21630);
            }
            if (this._right_arrow)
            {
                this._right_arrow.addEventListener(WindowMouseEvent.CLICK, this._Str_21630);
            }
            this._verticalLine = (this._buttonContainer.getChildByName("line") as IStaticBitmapWrapperWindow);
            var _local_8:Array = [];
            this._window.groupChildrenWithTag("TOGGLE", _local_8, -1);
            for each (_local_9 in _local_8)
            {
                if (((_local_9) && (_local_9 is IRegionWindow)))
                {
                    _local_9.addEventListener(WindowMouseEvent.CLICK, this._Str_16033);
                }
            }
            this._Str_4600(HabboToolbarIconEnum.getIconName(HabboToolbarIconEnum.MEMENU), false);
            this._Str_4600(HabboToolbarIconEnum.getIconName(HabboToolbarIconEnum.INVENTORY), false);
            _local_10 = k.getBoolean("games_icon_enabled");
            if (_local_10)
            {
                this._Str_4600(HabboToolbarIconEnum.getIconName(HabboToolbarIconEnum.GAMES), true);
            }
            else
            {
                this._Str_4600(HabboToolbarIconEnum.getIconName(HabboToolbarIconEnum.GAMES), false);
            }
            var _local_11:XmlAsset = (_arg_3.getAssetByName("new_items_label_xml") as XmlAsset);
            this._newItemsNotification = (_arg_2.buildFromXML((_local_11.content as XML), 2) as IWindowContainer);
            if (this._newItemsNotification == null)
            {
                throw (new Error("Failed to construct toolbar label from XML!"));
            }
            _local_12 = (this._window.findChildByName(HabboToolbarIconEnum.getIconName(HabboToolbarIconEnum.NAVIGATOR)) as IWindowContainer);
            if (_local_12)
            {
                this._windowManager.registerHintWindow(HabboToolbarIconEnum.getIconName(HabboToolbarIconEnum.NAVIGATOR), _local_12);
            }
            _local_12 = (this._window.findChildByName(HabboToolbarIconEnum.getIconName(HabboToolbarIconEnum.MEMENU)) as IWindowContainer);
            if (_local_12)
            {
                this._windowManager.registerHintWindow(HabboToolbarIconEnum.getIconName(HabboToolbarIconEnum.MEMENU), _local_12);
            }
            _local_12 = (this._window.findChildByName(HabboToolbarIconEnum.getIconName(HabboToolbarIconEnum.INVENTORY)) as IWindowContainer);
            if (_local_12)
            {
                this._windowManager.registerHintWindow(HabboToolbarIconEnum.getIconName(HabboToolbarIconEnum.INVENTORY), _local_12);
            }
            var _local_13:IWindowContainer = (this._window.findChildByName(HabboToolbarIconEnum.getIconName(HabboToolbarIconEnum.CATALOGUE)) as IWindowContainer);
            _local_13.addChild(this._newItemsNotification);
            this._windowManager.registerHintWindow(HabboToolbarIconEnum.getIconName(HabboToolbarIconEnum.CATALOGUE), _local_13);
            var _local_14:ITextWindow = (this._newItemsNotification.findChildByName("new_textfield") as ITextWindow);
            var _local_15:ILocalization = k.localization.getLocalizationRaw("toolbar.new_additions.notification");
            if (_local_15 != null)
            {
                _local_14.text = _local_15.value;
            }
            this._newItemsNotification.visible = false;
            this._newItemsNotification.x = ((_local_13.width - this._newItemsNotification.width) - _Str_3504);
            this._newItemsNotification.y = _Str_3504;
            this._newItemsNotificationEnabled = this._Str_10258();
            this._Str_5532();
            (k as Component).context.addLinkEventTracker(this);
        }

        private function _Str_22880(k:WindowMouseEvent, _arg_2:*):void
        {
            this._toolbar.toggleWindowVisibility("PANIC");
        }

        private function _Str_16256(k:WindowEvent):void
        {
            this._Str_5532();
        }

        private function _Str_5532():void
        {
            if (((!(this._window)) || (!(this._windowManager))))
            {
                return;
            }
            this._left_arrow.visible = (!(this._collapsed));
            this._right_arrow.visible = this._collapsed;
            this._window.y = (this._window.desktop.height - this._window.height);
            this._window.width = (((_Str_16891 * this._Str_23943()) + _Str_16288) + 150);
            if (!this._collapsed)
            {
                if (this._memenu != null)
                {
                    this._memenu._Str_5615();
                }
            }
            this._window.invalidate();
        }

        public function dispose():void
        {
            if (this._memenu != null)
            {
                this._memenu.dispose();
                this._memenu = null;
            }
            if (this._meMenuNormalBitmap != null)
            {
                this._meMenuNormalBitmap.dispose();
                this._meMenuNormalBitmap = null;
            }
            if (this._unseenItemCounters != null)
            {
                this._unseenItemCounters.dispose();
                this._unseenItemCounters = null;
            }
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
            if (this._newItemsNotification != null)
            {
                this._newItemsNotification.dispose();
                this._newItemsNotification = null;
            }
            if (this._windowManager)
            {
                this._windowManager.unregisterHintWindow(HabboToolbarIconEnum.getIconName(HabboToolbarIconEnum.NAVIGATOR));
                this._windowManager.unregisterHintWindow(HabboToolbarIconEnum.getIconName(HabboToolbarIconEnum.MEMENU));
                this._windowManager.unregisterHintWindow(HabboToolbarIconEnum.getIconName(HabboToolbarIconEnum.INVENTORY));
                this._windowManager.unregisterHintWindow(HabboToolbarIconEnum.getIconName(HabboToolbarIconEnum.CATALOGUE));
            }
            if (this._toolbar)
            {
                (this._toolbar as Component).context.removeLinkEventTracker(this);
                this._toolbar = null;
            }
            this._windowManager = null;
            this._assets = null;
            this._disposed = true;
            if (this._events)
            {
                this._events = null;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get window():IWindow
        {
            return this._window;
        }

        private function _Str_16413():void
        {
            var k:IWindowContainer = (this._window.findChildByName(HabboToolbarIconEnum.getIconName(HabboToolbarIconEnum.CATALOGUE)) as IWindowContainer);
            k.blend = 0.5;
            k.disable();
        }

        public function _Str_7785(k:CatalogEvent):void
        {
            var _local_2:IWindowContainer;
            var _local_3:String;
            switch (k.type)
            {
                case CatalogEvent.CATALOG_INITIALIZED:
                    _local_2 = (this._window.findChildByName(HabboToolbarIconEnum.getIconName(HabboToolbarIconEnum.CATALOGUE)) as IWindowContainer);
                    _local_2.blend = 1;
                    _local_2.enable();
                    _local_3 = this._toolbar.getProperty("open.catalog.page");
                    if (((_local_3.length > 0) && (this._toolbar.catalog)))
                    {
                        this._toolbar.catalog.openCatalogPage(CatalogPageName.HC_MEMBERSHIP);
                        this._toolbar.setProperty("open.catalog.page", "");
                    }
                    return;
                case CatalogEvent.CATALOG_NOT_READY:
                    this._Str_16413();
                    return;
                case CatalogEvent.CATALOG_NEW_ITEMS_SHOW:
                    if (((!(this._newItemsNotification == null)) && (this._newItemsNotificationEnabled)))
                    {
                        this._newItemsNotification.visible = true;
                    }
                    return;
                case CatalogEvent.CATALOG_NEW_ITEMS_HIDE:
                    if (this._newItemsNotification != null)
                    {
                        this._newItemsNotification.visible = false;
                    }
                    return;
            }
        }

        public function updateVisibility(k:String):void
        {
            var _local_3:String;
            var _local_4:IWindow;
            var _local_5:Boolean;
            var _local_6:String;
            var _local_7:Boolean;
            if (k == HabboToolbarEnum.HTE_STATE_HIDDEN)
            {
                this._window.visible = false;
                return;
            }
            this._window.visible = true;
            if (k != HabboToolbarEnum.HTE_STATE_COLLAPSED)
            {
                this._previousState = k;
            }
            var _local_2:Array = [];
            this._window.groupChildrenWithTag("TOGGLE", _local_2, -1);
            switch (k)
            {
                case HabboToolbarEnum.HTE_STATE_GAME_CENTER_VIEW:
                    _local_3 = "VISIBLE_GAME_CENTER";
                    this._window.position = _Str_3163;
                    break;
                case HabboToolbarEnum.HTE_STATE_HOTEL_VIEW:
                    _local_3 = "VISIBLE_HOTEL";
                    this._window.position = _Str_7220;
                    break;
                case HabboToolbarEnum.HTE_STATE_NOOB_NOT_HOME:
                    _local_3 = "VISIBLE_NOOB";
                    this._window.position = _Str_3163;
                    break;
                case HabboToolbarEnum.HETE_STATE_NOOB_HOME:
                    _local_3 = "VISIBLE_ROOM";
                    this._window.position = _Str_3163;
                    break;
                case HabboToolbarEnum.HTE_STATE_ROOM_VIEW:
                    _local_3 = "VISIBLE_ROOM";
                    this._window.position = _Str_3163;
                    break;
                case HabboToolbarEnum.HTE_STATE_COLLAPSED:
                    _local_3 = "VISIBLE_COLLAPSED";
                    this._window.position = _Str_3163;
                    break;
            }
            for each (_local_4 in _local_2)
            {
                if (_local_4)
                {
                    _local_4.visible = (_local_4.tags.indexOf(_local_3) >= 0);
                    if (((_local_4.name == "QUESTS") && (!(this._collapsed))))
                    {
                        _local_4.visible = ((_local_4.visible) && ((!(this._toolbar._Str_9485())) || (!(this._toolbar.getBoolean("new.identity.hide.quests")))));
                        _local_4.visible = ((_local_4.visible) && (!(this._toolbar.getBoolean("toolbar.hide.quests"))));
                    }
                    else
                    {
                        if (((_local_4.name == "STORIES") && (!(this._collapsed))))
                        {
                            _local_4.visible = ((_local_4.visible) && (this._toolbar.getBoolean("toolbar.stories.enabled")));
                        }
                        else
                        {
                            if (((_local_4.name == "BUILDER") && (!(this._collapsed))))
                            {
                                _local_4.visible = ((_local_4.visible) && (this._toolbar.getBoolean("builders.club.enabled")));
                            }
                            else
                            {
                                if (_local_4.name == "GAMES")
                                {
                                    _local_4.visible = ((_local_4.visible) && (this._toolbar.getBoolean("game.center.enabled")));
                                }
                                else
                                {
                                    if (_local_4.name == "CAMERA")
                                    {
                                        _local_5 = ((((k == HabboToolbarEnum.HTE_STATE_ROOM_VIEW) || (k == HabboToolbarEnum.HETE_STATE_NOOB_HOME)) || (k == HabboToolbarEnum.HTE_STATE_NOOB_NOT_HOME)) || ((this._collapsed) && (((this._previousState == HabboToolbarEnum.HTE_STATE_ROOM_VIEW) || (this._previousState == HabboToolbarEnum.HETE_STATE_NOOB_HOME)) || (this._previousState == HabboToolbarEnum.HTE_STATE_NOOB_NOT_HOME))));
                                        _local_6 = this._toolbar.getProperty("camera.launch.ui.position");
                                        _local_7 = this._toolbar.sessionDataManager.isPerkAllowed(PerkEnum.CAMERA);
                                        _local_4.visible = (((_local_5) && (_local_6 == "bottom-icons")) && (_local_7));
                                    }
									else
									{
										if (_local_4.name == "MODTOOL")
										{
											_local_4.visible = this._toolbar.sessionDataManager.hasSecurity(SecurityLevelEnum._Str_3569);
										}
									}
                                }
                            }
                        }
                    }
                }
            }
            this._Str_5532();
        }

        public function _Str_4600(k:String, _arg_2:Boolean):void
        {
            var _local_3:IWindowContainer = (this._window.findChildByName(k) as IWindowContainer);
            if (_local_3)
            {
                _local_3.visible = _arg_2;
            }
            this._Str_5532();
        }

        public function _Str_23943():int
        {
            var _local_3:IWindow;
            var k:Array = [];
            var _local_2:int = 1;
            this._window.groupChildrenWithTag("TOGGLE", k, -1);
            for each (_local_3 in k)
            {
                if (((_local_3) && (_local_3.visible)))
                {
                    _local_2++;
                }
            }
            return _local_2;
        }

        private function _Str_10617(k:WindowMouseEvent):void
        {
            var _local_2:Rectangle;
            if (this._toolbar.navigator == null)
            {
                return;
            }
            switch (k.type)
            {
                case WindowMouseEvent.OVER:
                    _local_2 = this.getIconLocation(HabboToolbarIconEnum.NAVIGATOR);
                    this._toolbar.navigator.showToolbarHover(new Point((_local_2.right + 15), _local_2.y));
                    return;
                case WindowMouseEvent.OUT:
                    this._toolbar.navigator.hideToolbarHover(true);
                    return;
            }
        }

        private function _Str_16860(k:WindowMouseEvent):void
        {
            var _local_2:IWindowContainer = (k.target as IWindowContainer);
            if (!_local_2)
            {
                return;
            }
            var _local_3:IBorderWindow = (_local_2.findChildByTag("ICON_BORDER") as IBorderWindow);
            var _local_4:IBitmapDataContainer = (_local_2.findChildByTag("ICON_BMP") as IBitmapDataContainer);
            Logger.log(k);
            switch (k.type)
            {
                case WindowMouseEvent.OVER:
                    this._Str_6574(_local_4, _HOVER);
                    this._Str_9894(_local_3, _HOVER);
                    if (k.target.name == "NAVIGATOR")
                    {
                        this._Str_10617(k);
                    }
                    return;
                case WindowMouseEvent.OUT:
                    this._Str_6574(_local_4, _NORMAL);
                    this._Str_9894(_local_3, _NORMAL);
                    if (k.target.name == "NAVIGATOR")
                    {
                        this._Str_10617(k);
                    }
                    return;
            }
        }

        private function _Str_6574(k:IBitmapDataContainer, _arg_2:String):void
        {
            var _local_3:IStaticBitmapWrapperWindow;
            var _local_4:IBitmapWrapperWindow;
            if ((k is IStaticBitmapWrapperWindow))
            {
                _local_3 = (k as IStaticBitmapWrapperWindow);
                _local_3.assetUri = (_local_3.name + _arg_2);
            }
            else
            {
                if ((k is IBitmapWrapperWindow))
                {
                    _local_4 = (k as IBitmapWrapperWindow);
                    if (_local_4.name == ICON_ME_MENU)
                    {
                        _local_4.bitmap = this._meMenuNormalBitmap;
                    }
                }
            }
        }

        private function _Str_9894(k:IWindowContainer, _arg_2:String):void
        {
            if (!k)
            {
                return;
            }
            if (_arg_2 == _HOVER)
            {
                k.color = _Str_7111;
            }
            else
            {
                k.color = _Str_7665;
            }
        }

        private function _Str_16033(k:WindowMouseEvent):void
        {
            var _local_2:String = IWindow(k.target).name;
            this._toolbar.toggleWindowVisibility(_local_2);
            this._windowManager._Str_12248(_local_2);
        }

        public function setAssetUri(location:String, image:BitmapData):void
        {
            if (!image)
            {
                return;
            }
            var iconName:String;
            switch (location)
            {
                case HabboToolbarIconEnum.MEMENU:
                    iconName = ICON_ME_MENU;
                    this._Str_17734(image);
                    break;
            }
            var icon:IBitmapDataContainer = (this._window.findChildByName(iconName) as IBitmapDataContainer);
            if (icon != null)
            {
                this._Str_6574(icon, _NORMAL);
            }
        }

        private function getIconName(k:String):String
        {
            var _local_2:String;
            switch (k)
            {
                case HabboToolbarIconEnum.CATALOGUE:
                    _local_2 = "icons_toolbar_catalogue";
                    break;
                case HabboToolbarIconEnum.INVENTORY:
                    _local_2 = "icons_toolbar_inventory";
                    break;
                case HabboToolbarIconEnum.MEMENU:
                    _local_2 = "MEMENU";
                    break;
                case HabboToolbarIconEnum.NAVIGATOR:
                    _local_2 = "icons_toolbar_navigator";
                    break;
                case HabboToolbarIconEnum.QUESTS:
                    _local_2 = "icons_toolbar_quests";
                    break;
                case HabboToolbarIconEnum.GAMES:
                    _local_2 = "icons_toolbar_games";
                    break;
                case HabboToolbarIconEnum.STORIES:
                    _local_2 = "icons_toolbar_stories";
                    break;
                case HabboToolbarIconEnum.RECEPTION:
                    _local_2 = "icons_toolbar_reception";
                    break;
                case HabboToolbarIconEnum.BUILDER:
                    _local_2 = "icons_toolbar_builder";
                    break;
                case HabboToolbarIconEnum.CAMERA:
                    _local_2 = "icons_toolbar_camera";
                    break;
				case HabboToolbarIconEnum.MODTOOL:
					_local_2 = "icons_toolbar_modtool";
					break;
            }
            return _local_2;
        }

        public function getIconLocation(k:String):Rectangle
        {
            var _local_3:IWindow;
            var _local_2:Rectangle = new Rectangle();
            var _local_4:String;
            _local_4 = this.getIconName(k);
            if (_local_4 != null)
            {
                _local_3 = this._window.findChildByName(_local_4);
            }
            if (((!(_local_3 == null)) && (_local_3.visible)))
            {
                _local_3.getGlobalRectangle(_local_2);
                return _local_2;
            }
            var _local_5:Rectangle = this._memenu._Str_23094(k);
            if (_local_5 != null)
            {
                return _local_5;
            }
            return null;
        }

        public function _Str_24110(k:String):IWindow
        {
            var _local_3:IWindow;
            var _local_2:String = this.getIconName(k);
            _local_3 = this._window.findChildByName(_local_2);
            if (!_local_3)
            {
                _local_3 = this._memenu._Str_6621(k);
            }
            return _local_3;
        }

        private function _Str_17734(k:BitmapData):void
        {
            if (this._meMenuNormalBitmap != null)
            {
                this._meMenuNormalBitmap.dispose();
            }
            if (k != null)
            {
                this._meMenuNormalBitmap = k.clone();
            }
            k.dispose();
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

        public function _Str_7926(k:String):IWindowContainer
        {
            var _local_4:IWindowContainer;
            var _local_2:String = HabboToolbarIconEnum.getIconName(k);
            if (!_local_2)
            {
                Logger.log(("[Toolbar] Unknown icon type for unseen item counter for iconId: " + k));
            }
            var _local_3:IWindowContainer = (this._unseenItemCounters.getValue(k) as IWindowContainer);
            if (!_local_3)
            {
                _local_3 = this._windowManager.createUnseenItemCounter();
                _local_4 = (this._window.findChildByName(_local_2) as IWindowContainer);
                if (_local_4)
                {
                    _local_4.addChild(_local_3);
                    _local_3.x = ((_local_4.width - _local_3.width) - _Str_3504);
                    _local_3.y = _Str_3504;
                    this._unseenItemCounters.add(k, _local_3);
                }
            }
            return _local_3;
        }

        public function _Str_10258():Boolean
        {
            return this._toolbar.getBoolean("toolbar.new_additions.notification.enabled");
        }

        public function _Str_21423(k:String, _arg_2:BitmapData, _arg_3:int, _arg_4:int):Motion
        {
            var _local_9:IWindow;
            var _local_5:int = 20;
            var _local_6:int = ((_arg_2) ? _arg_2.width : _local_5);
            var _local_7:int = ((_arg_2) ? _arg_2.height : _local_5);
            var _local_8:IBitmapWrapperWindow = (this._windowManager.create("ToolBarTransition", WindowType.WINDOW_TYPE_BITMAP_WRAPPER, 0, 0, new Rectangle(_arg_3, _arg_4, _local_6, _local_7)) as IBitmapWrapperWindow);
            if (_arg_2)
            {
                _local_8.bitmap = _arg_2;
                _local_8.disposesBitmap = true;
                _local_8.filters = [new GlowFilter(0xFFFFFF, 1, 2, 2, 0xFF, BitmapFilterQuality.LOW, false, false)];
            }
            this._windowManager.getDesktop(2).addChild(_local_8);
            var _local_10:String;
            _local_10 = this.getIconName(k);
            if (_local_10 != null)
            {
                _local_9 = this._window.findChildByName(_local_10);
            }
            if (!_local_9)
            {
                _local_8.dispose();
                return null;
            }
            var _local_11:Rectangle = new Rectangle();
            _local_8.getGlobalRectangle(_local_11);
            var _local_12:Rectangle = new Rectangle();
            _local_9.getGlobalRectangle(_local_12);
            var _local_13:int = (_local_11.x - _local_12.x);
            var _local_14:int = (_local_11.y - _local_12.y);
            var _local_15:Number = Math.sqrt(((_local_13 * _local_13) + (_local_14 * _local_14)));
            var _local_16:int = (500 - Math.abs(((((1 / _local_15) * 100) * 500) * 0.5)));
            var _local_17:int = 20;
            var _local_18:* = (("ToolBarBouncing[ " + _local_10) + " ]");
            if (!Motions._Str_19320(_local_18))
            {
                Motions._Str_4598(new Queue(new Wait((_local_16 + 8)), new DropBounce(_local_9, 400, 12))).tag = _local_18;
            }
            var _local_19:Motion = new Queue(new EaseOut(new JumpBy(_local_8, _local_16, ((_local_12.x - _local_11.x) + _local_17), (_local_12.y - _local_11.y), 100, 1), 1), new Dispose(_local_8));
            return Motions._Str_4598(_local_19);
        }

        public function set onDuty(k:Boolean):void
        {
            var _local_2:IWindow = this._window.findChildByName("guide_icon");
            if (_local_2 != null)
            {
                _local_2.visible = k;
            }
        }

        public function set _Str_17961(k:int):void
        {
            this._unseenAchievementCount = k;
        }

        public function set _Str_16525(k:int):void
        {
            this._unseenMiniMailMessageCount = k;
        }

        public function set _Str_9691(k:int):void
        {
            this._unseenForumsCount = k;
        }

        public function get _Str_16152():int
        {
            return (this._unseenMiniMailMessageCount + this._unseenAchievementCount) + this._unseenForumsCount;
        }

        public function get memenu():MeMenuNewView
        {
            return this._memenu;
        }

        public function get eventUrlPrefix():String
        {
            return "toolbar/";
        }

        private function _Str_21630(k:WindowMouseEvent):void
        {
            this._collapsed = (!(this._collapsed));
            if (this._collapsed)
            {
                this.updateVisibility(HabboToolbarEnum.HTE_STATE_COLLAPSED);
            }
            else
            {
                this.updateVisibility(this._previousState);
            }
            this._Str_5532();
            this._toolbar._Str_12052._Str_22028();
        }

        public function linkReceived(k:String):void
        {
            var _local_2:Array = k.split("/");
            if (_local_2.length < 2)
            {
                return;
            }
            switch (_local_2[1])
            {
                case "memenu":
                    this.memenu.toggleVisibility();
                    return;
                case "highlight":
                    if (_local_2.length <= 2)
                    {
                        return;
                    }
                    switch (_local_2[2])
                    {
                        case "catalog":
                            this._windowManager.showHint(HabboToolbarIconEnum.getIconName(HabboToolbarIconEnum.CATALOGUE));
                            break;
                        case "navigator":
                            this._windowManager.showHint(HabboToolbarIconEnum.getIconName(HabboToolbarIconEnum.NAVIGATOR));
                            break;
                        case "memenu":
                            this._windowManager.showHint(HabboToolbarIconEnum.getIconName(HabboToolbarIconEnum.MEMENU));
                            break;
                    }
                    return;
                default:
                    Logger.log(("Toolbar unknown link-type received: " + _local_2[1]));
            }
        }

        public function _Str_22465():int
        {
            if (((!(this._verticalLine)) || (!(this._verticalLine.parent))))
            {
                return 0;
            }
            return (this._collapsed) ? _Str_6651 : (this._verticalLine.x + this._verticalLine.parent.x);
        }
    }
}
