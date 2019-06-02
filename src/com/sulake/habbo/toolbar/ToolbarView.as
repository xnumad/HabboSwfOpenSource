package com.sulake.habbo.toolbar
{
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import flash.geom.Point;
    import com.sulake.core.window.IWindowContainer;
    import flash.events.IEventDispatcher;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.session.ISessionDataManager;
    import flash.display.BitmapData;
    import com.sulake.habbo.toolbar.memenu.MeMenuNewController;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.utils.IBitmapDataContainer;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.localization.ILocalization;
    import com.sulake.core.runtime.Component;
    import flash.display.BitmapDataChannel;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.catalog.enum.CatalogPageName;
    import com.sulake.habbo.catalog.event.CatalogEvent;
    import flash.geom.Rectangle;
    import com.sulake.core.window.components.IBorderWindow;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
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

    public class ToolbarView implements ILinkEventTracker 
    {
        private static const _Str_3163:Point = new Point(3, 3);
        private static const _Str_7220:Point = new Point(3, 3);
        private static const _Str_7111:uint = 7433577;
        private static const _Str_7665:uint = 5723213;
        private static const _HOVER:String = "_hover";
        private static const _NORMAL:String = "_normal";
        private static const _Str_3504:int = 5;
        private static const ICON_ME_MENU:String = "icon_me_menu";
        private static const HEIGHT:int = 80;
        private static const HOVER_HEIGHT_OFFSET:int = 20;
        private static const _Str_16481:int = 52;

        private var _window:IWindowContainer;
        private var _events:IEventDispatcher;
        private var _disposed:Boolean;
        private var _toolbar:HabboToolbar;
        private var _assets:IAssetLibrary;
        private var _windowManager:IHabboWindowManager;
        private var _unseenItemCounters:Map;
        private var _newItemsNotification:IWindowContainer;
        private var _sessionDataManager:ISessionDataManager;
        private var _newItemsNotificationEnabled:Boolean;
        private var _meMenuNormalBitmap:BitmapData;
        private var _meMenuHoverBitmap:BitmapData;
        private var _unseenMiniMailMessageCount:int;
        private var _unseenAchievementCount:int;
        private var _memenu:MeMenuNewController;

        public function ToolbarView(toolbar:HabboToolbar, windowManager:IHabboWindowManager, assetLibrary:IAssetLibrary, eventDispatcher:IEventDispatcher, sessionDataManager:ISessionDataManager)
        {
            var _local_8:IWindow;
            var _local_9:IBitmapDataContainer;
            var _local_10:Boolean;
            super();
            this._toolbar = toolbar;
            this._windowManager = windowManager;
            this._assets = assetLibrary;
            this._events = eventDispatcher;
            this._sessionDataManager = sessionDataManager;
            this._memenu = new MeMenuNewController(this._toolbar, this);
            this._memenu._Str_22759 = true;
            this._unseenItemCounters = new Map();
            var _local_6:XmlAsset = (assetLibrary.getAssetByName("toolbar_view_xml") as XmlAsset);
            this._window = (windowManager.buildFromXML((_local_6.content as XML), 2) as IWindowContainer);
            if (this._window == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            }
            this._window.position = _Str_3163;
            this._window.addEventListener(WindowEvent.WINDOW_EVENT_PARENT_RESIZED, this._Str_16256);
            if (this._toolbar._Str_24996())
            {
                this._window.findChildByName("icons_toolbar_quests").name = "icons_toolbar_xmas";
            }
            if (this._toolbar._Str_23298())
            {
                this._window.findChildByName("icons_toolbar_quests").name = "icons_toolbar_valentines";
            }
            var _local_7:Array = [];
            this._window.groupChildrenWithTag("TOGGLE", _local_7, -1);
            for each (_local_8 in _local_7)
            {
                if (((_local_8) && (_local_8 is IRegionWindow)))
                {
                    _local_8.addEventListener(WindowMouseEvent.CLICK, this._Str_16033);
                    _local_8.addEventListener(WindowMouseEvent.OVER, this._Str_16860);
                    _local_8.addEventListener(WindowMouseEvent.OUT, this._Str_16860);
                }
            }
            _local_7 = [];
            this._window.groupChildrenWithTag("ICON_BMP", _local_7, -1);
            for each (_local_9 in _local_7)
            {
                this._Str_6574(_local_9, _NORMAL);
            }
            this._Str_4600(HabboToolbarIconEnum.getIconName(HabboToolbarIconEnum.QUESTS), false);
            this._Str_4600(HabboToolbarIconEnum.getIconName(HabboToolbarIconEnum.MEMENU), false);
            this._Str_4600(HabboToolbarIconEnum.getIconName(HabboToolbarIconEnum.INVENTORY), true);
            _local_10 = toolbar.getBoolean("games_icon_enabled");
            if (_local_10)
            {
                this._Str_4600(HabboToolbarIconEnum.getIconName(HabboToolbarIconEnum.GAMES), true);
                this._Str_4600(HabboToolbarIconEnum.getIconName(HabboToolbarIconEnum.ACHIEVEMENTS), false);
            }
            else
            {
                this._Str_4600(HabboToolbarIconEnum.getIconName(HabboToolbarIconEnum.GAMES), false);
                this._Str_4600(HabboToolbarIconEnum.getIconName(HabboToolbarIconEnum.ACHIEVEMENTS), true);
            }
            var _local_11:XmlAsset = (assetLibrary.getAssetByName("new_items_label_xml") as XmlAsset);
            this._newItemsNotification = (windowManager.buildFromXML((_local_11.content as XML), 2) as IWindowContainer);
            if (this._newItemsNotification == null)
            {
                throw (new Error("Failed to construct toolbar label from XML!"));
            }
            var _local_12:IWindowContainer = (this._window.findChildByName(HabboToolbarIconEnum.getIconName(HabboToolbarIconEnum.CATALOGUE)) as IWindowContainer);
            _local_12.addChild(this._newItemsNotification);
            var _local_13:ITextWindow = (this._newItemsNotification.findChildByName("new_textfield") as ITextWindow);
            var _local_14:ILocalization = toolbar.localization.getLocalizationRaw("toolbar.new_additions.notification");
            if (_local_14 != null)
            {
                _local_13.text = _local_14.value;
            }
            this._newItemsNotification.visible = false;
            this._newItemsNotification.x = ((_local_12.width - this._newItemsNotification.width) - _Str_3504);
            this._newItemsNotification.y = _Str_3504;
            this._newItemsNotificationEnabled = this._Str_10258();
            this._Str_5532();
            (this._toolbar as Component).context.addLinkEventTracker(this);
        }

        private static function _Str_15428(k:BitmapData, _arg_2:Point, _arg_3:uint):BitmapData
        {
            var _local_4:BitmapData = new BitmapData(k.width, k.height, true, 0);
            _local_4.fillRect(_local_4.rect, _arg_3);
            _local_4.copyChannel(k, k.rect, new Point(0, 0), BitmapDataChannel.ALPHA, BitmapDataChannel.ALPHA);
            var _local_5:BitmapData = new BitmapData((k.width + _arg_2.x), (k.height + _arg_2.y), true, 0);
            _local_5.copyPixels(_local_4, _local_4.rect, _arg_2);
            _local_5.copyPixels(k, k.rect, new Point(0, 0), null, null, true);
            _local_4.dispose();
            return _local_5;
        }


        private function _Str_22880(k:WindowMouseEvent):void
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
            this._Str_20823(true);
            if (this._Str_20816())
            {
                this._Str_20823(false);
                this._Str_20816();
            }
            this._window.invalidate();
            if (this._memenu != null)
            {
                this._memenu._Str_5615();
            }
        }

        private function _Str_20823(k:Boolean):void
        {
            var item:IWindowContainer;
            var text:IWindow;
            var toolbarItems:IItemListWindow = (this._window.findChildByName("toolbar_items") as IItemListWindow);
            var total:int = toolbarItems.numListItems;
            var index:int;
            while (index < total)
            {
                item = (toolbarItems.getListItemAt(index) as IWindowContainer);
                if (item != null)
                {
                    text = item.findChildByName("text");
                    if (text != null)
                    {
                        text.visible = k;
                        item.height = ((k) ? HEIGHT : (HEIGHT - HOVER_HEIGHT_OFFSET));
                    }
                }
                index++;
            }
        }

        private function _Str_20816():Boolean
        {
            var k:IItemListWindow = (this._window.findChildByName("toolbar_items") as IItemListWindow);
            k.spacing = 2;
            k.scrollV = 0;
            k.arrangeListItems();
            while (this._window.bottom > (this._windowManager.getDesktop(2).height - _Str_16481))
            {
                if (k.spacing == -5)
                {
                    return true;
                }
                k.spacing--;
            }
            return false;
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
            if (this._meMenuHoverBitmap != null)
            {
                this._meMenuHoverBitmap.dispose();
                this._meMenuHoverBitmap = null;
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
            if (this._toolbar)
            {
                (this._toolbar as Component).context.removeLinkEventTracker(this);
            }
            this._toolbar = null;
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
            if (k == HabboToolbarEnum.HTE_STATE_HIDDEN)
            {
                this._window.visible = false;
                return;
            }
            this._window.visible = true;
            var extensions:Array = [];
            this._window.groupChildrenWithTag("TOGGLE", extensions, -1);
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
                case HabboToolbarEnum.HTE_STATE_ROOM_VIEW:
                    _local_3 = "VISIBLE_ROOM";
                    this._window.position = _Str_3163;
                    break;
            }
            var extension:IWindow;
            for each (extension in extensions)
            {
                if (extension)
                {
                    extension.visible = (extension.tags.indexOf(_local_3) >= 0);
                    if (extension.name == "QUESTS")
                    {
                        extension.visible = extension.visible && (!this._toolbar._Str_9485() || !this._toolbar.getBoolean("new.identity.hide.quests"));
                        extension.visible = extension.visible && !this._toolbar.getBoolean("toolbar.hide.quests");
                    }
                    if (extension.name == "STORIES")
                    {
                        extension.visible = extension.visible && this._toolbar.getBoolean("toolbar.stories.enabled");
                    }
                    if (extension.name == "BUILDER")
                    {
                        extension.visible = extension.visible && this._toolbar.getBoolean("builders.club.enabled");
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
                        _local_4.bitmap = ((_arg_2 == _NORMAL) ? this._meMenuNormalBitmap : this._meMenuHoverBitmap);
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
        }

        public function setAssetUri(k:String, _arg_2:BitmapData):void
        {
            var _local_3:String;
            if (!_arg_2)
            {
                return;
            }
            switch (k)
            {
                case HabboToolbarIconEnum.MEMENU:
                    _local_3 = ICON_ME_MENU;
                    this._Str_17734(_arg_2);
                    break;
            }
            var _local_4:IBitmapDataContainer = (this._window.findChildByName(_local_3) as IBitmapDataContainer);
            if (_local_4 != null)
            {
                this._Str_6574(_local_4, _NORMAL);
            }
        }

        public function getIconLocation(k:String):Rectangle
        {
            var _local_2:IWindow;
            var _local_3:Rectangle;
            switch (k)
            {
                case HabboToolbarIconEnum.NAVIGATOR:
                    _local_2 = this._window.findChildByName(HabboToolbarIconEnum.getIconName(HabboToolbarIconEnum.NAVIGATOR));
                    break;
                case HabboToolbarIconEnum.QUESTS:
                    _local_2 = this._window.findChildByName(HabboToolbarIconEnum.getIconName(HabboToolbarIconEnum.QUESTS));
                    break;
                case HabboToolbarIconEnum.GAMES:
                    _local_2 = this._window.findChildByName(HabboToolbarIconEnum.getIconName(HabboToolbarIconEnum.GAMES));
                    break;
            }
            if (((!(_local_2 == null)) && (_local_2.visible)))
            {
                _local_3 = new Rectangle();
                _local_2.getGlobalRectangle(_local_3);
                return _local_3;
            }
            return null;
        }

        private function _Str_17734(k:BitmapData):void
        {
            if (this._meMenuNormalBitmap != null)
            {
                this._meMenuNormalBitmap.dispose();
            }
            if (this._meMenuHoverBitmap != null)
            {
                this._meMenuHoverBitmap.dispose();
            }
            this._meMenuNormalBitmap = _Str_15428(k, new Point(2, 3), 4280426782);
            this._meMenuHoverBitmap = _Str_15428(k, new Point(4, 5), 4281150249);
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
            switch (k)
            {
                case HabboToolbarIconEnum.CATALOGUE:
                    _local_10 = "icons_toolbar_catalogue";
                    break;
                case HabboToolbarIconEnum.INVENTORY:
                    _local_10 = "icons_toolbar_inventory";
                    break;
                case HabboToolbarIconEnum.MEMENU:
                    _local_10 = "icons_toolbar_me_menu";
                    break;
                case HabboToolbarIconEnum.NAVIGATOR:
                    _local_10 = "icons_toolbar_navigator";
                    break;
                case HabboToolbarIconEnum.QUESTS:
                    _local_10 = "icons_toolbar_quests";
                    break;
                case HabboToolbarIconEnum.GAMES:
                    _local_10 = "icons_toolbar_games";
                    break;
                case HabboToolbarIconEnum.STORIES:
                    _local_10 = "icons_toolbar_stories";
                    break;
                case HabboToolbarIconEnum.RECEPTION:
                    _local_10 = "icons_toolbar_reception";
                    break;
            }
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
            this._window.findChildByName("guide_icon").visible = k;
        }

        public function get _Str_17961():int
        {
            return this._unseenAchievementCount;
        }

        public function set _Str_17961(k:int):void
        {
            this._unseenAchievementCount = k;
        }

        public function get _Str_16525():int
        {
            return this._unseenMiniMailMessageCount;
        }

        public function set _Str_16525(k:int):void
        {
            this._unseenMiniMailMessageCount = k;
        }

        public function get memenu():MeMenuNewController
        {
            return this._memenu;
        }

        public function get eventUrlPrefix():String
        {
            return "toolbar/";
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
                default:
                    Logger.log(("Toolbar unknown link-type received: " + _local_2[1]));
            }
        }
    }
}
