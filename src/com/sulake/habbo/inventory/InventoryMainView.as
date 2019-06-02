package com.sulake.habbo.inventory
{
    import flash.geom.Point;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import flash.utils.Dictionary;
    import com.sulake.core.window.enum.WindowState;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.ITabContextWindow;
    import com.sulake.core.window.components.ITabButtonWindow;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.habbo.inventory.enum.InventoryCategory;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.utils._Str_3942;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.catalog.recycler._Str_3718;
    import com.sulake.habbo.catalog.recycler.IRecycler;
    import com.sulake.core.window.components.ILabelWindow;
    import com.sulake.habbo.toolbar.HabboToolbarIconEnum;

    public class InventoryMainView 
    {
        private static const _Str_3504:int = 3;

        private const _Str_6092:Point = new Point(120, 150);

        private var _windowManager:IHabboWindowManager;
        private var _assetLibrary:IAssetLibrary;
        private var _mainWindow:IFrameWindow;
        private var _lastViewId:String;
        private var _lastView:IWindowContainer;
        private var _lastSubViewId:String;
        private var _lastSubView:IWindowContainer;
        private var _controller:HabboInventory;
        private var _toolbar:IHabboToolbar;
        private var _unseenFurniCounter:IWindowContainer;
        private var _unseenRentedFurniCounter:IWindowContainer;
        private var _unseenBadgeCounter:IWindowContainer;
        private var _unseenPetsCounter:IWindowContainer;
        private var _unseenBotCounter:IWindowContainer;
        private var _inventoryViews:Dictionary;

        public function InventoryMainView(k:HabboInventory, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary)
        {
            this._controller = k;
            this._assetLibrary = _arg_3;
            this._windowManager = _arg_2;
        }

        public function get isVisible():Boolean
        {
            return (this._mainWindow) ? this._mainWindow.visible : false;
        }

        public function get isActive():Boolean
        {
            return (this._mainWindow) ? this._mainWindow.getStateFlag(WindowState.ACTIVE) : false;
        }

        public function get _Str_11062():IWindowContainer
        {
            if (!this._mainWindow)
            {
                return null;
            }
            return this._mainWindow.findChildByName("empty_container") as IWindowContainer;
        }

        public function get _Str_10034():IWindowContainer
        {
            if (!this._mainWindow)
            {
                return null;
            }
            return this._mainWindow.findChildByName("loading_container") as IWindowContainer;
        }

        public function get mainContainer():IWindowContainer
        {
            if (!this._mainWindow)
            {
                return null;
            }
            return this._mainWindow.findChildByName("contentArea") as IWindowContainer;
        }

        public function dispose():void
        {
            this._unseenFurniCounter = null;
            this._unseenRentedFurniCounter = null;
            this._unseenBotCounter = null;
            this._unseenPetsCounter = null;
            this._unseenBadgeCounter = null;
            this._controller = null;
            this._lastView = null;
            this._lastSubView = null;
            if (this._mainWindow)
            {
                this._mainWindow.dispose();
                this._mainWindow = null;
            }
            if (this._toolbar)
            {
                if (this._toolbar.events)
                {
                    this._toolbar.events.removeEventListener(HabboToolbarEvent.HTE_TOOLBAR_CLICK, this._Str_3304);
                }
                this._toolbar = null;
            }
            this._windowManager = null;
            this._assetLibrary = null;
        }

        private function _Str_5493():IFrameWindow
        {
            var k:IAsset;
            var _local_2:XmlAsset;
            var _local_3:ITabContextWindow;
            var _local_4:Array;
            var _local_5:ITabButtonWindow;
            if (!this._mainWindow)
            {
                k = this._assetLibrary.getAssetByName("inventory_xml");
                _local_2 = XmlAsset(k);
                this._inventoryViews = new Dictionary();
                this._mainWindow = (this._windowManager.buildFromXML(XML(_local_2.content)) as IFrameWindow);
                if (this._mainWindow != null)
                {
                    this._mainWindow.position = this._Str_6092;
                    this._mainWindow.visible = false;
                    this._mainWindow.procedure = this._Str_3328;
                    this._mainWindow.setParamFlag(WindowParam.WINDOW_PARAM_MOUSE_SCALING_TARGET, this._controller.getBoolean("inventory.allow.scaling"));
                    this._Str_15287(InventoryCategory.FURNI);
                    this._Str_15287(InventoryCategory.PETS);
                    this._Str_15287(InventoryCategory.BOTS);
                    this._Str_15287(InventoryCategory.BADGES);
                    _local_3 = (this._mainWindow.findChildByName("tabs") as ITabContextWindow);
                    _local_4 = [];
                    while (_local_3._Str_4277 > 0)
                    {
                        _local_5 = _local_3._Str_3363(0);
                        _local_4.push(_local_5);
                        _local_3._Str_5897(_local_5);
                    }
                    for each (_local_5 in _local_4)
                    {
                        switch (_local_5.name)
                        {
                            case InventoryCategory.BOTS:
                                if (this._controller.getBoolean("inventory.bots.enabled"))
                                {
                                    _local_3._Str_5377(_local_5);
                                }
                                break;
                            case InventoryCategory.RENTABLES:
                                if (this._controller.getBoolean("duckets.enabled"))
                                {
                                    _local_3._Str_5377(_local_5);
                                }
                                break;
                            default:
                                _local_3._Str_5377(_local_5);
                        }
                    }
                    this._controller._Str_24810();
                }
                this._controller._Str_6956();
            }
            if (this._mainWindow.y < 0)
            {
                this._mainWindow.y = 0;
            }
            if (this._mainWindow.x < 0)
            {
                this._mainWindow.x = 0;
            }
            return this._mainWindow;
        }

        public function _Str_26395():String
        {
            return this._lastViewId;
        }

        public function _Str_18332():String
        {
            return this._lastSubViewId;
        }

        public function _Str_15430():void
        {
            this._controller._Str_5100();
            var k:IWindow = this._Str_5493();
            if (k == null)
            {
                return;
            }
            k.visible = false;
        }

        public function _Str_24385():void
        {
            var k:IWindow = this._Str_5493();
            if (k == null)
            {
                return;
            }
            k.visible = true;
            this._controller._Str_18877((((this._lastSubViewId) && (this._lastSubViewId.length > 0)) ? this._lastSubViewId : this._lastViewId));
        }

        public function _Str_5985(k:String, _arg_2:Boolean=true, _arg_3:Boolean=false):Boolean
        {
            var _local_4:IWindow = this._Str_5493();
            if (_local_4 == null)
            {
                return false;
            }
            if (_local_4.visible)
            {
                if (this._lastViewId == k)
                {
                    if (_arg_2)
                    {
                        if (_Str_3942._Str_9211(_local_4))
                        {
                            _local_4.activate();
                        }
                        else
                        {
                            this._Str_15430();
                            return false;
                        }
                    }
                }
                else
                {
                    this._Str_26459(k);
                }
            }
            else
            {
                if ((((_arg_3) && (!(this._lastViewId == null))) && (!(this._lastViewId == k))))
                {
                    this._Str_26459(k);
                }
                _local_4.visible = true;
                _local_4.activate();
                if (((!(k == this._lastViewId)) || (!(this._controller._Str_18826(k)))))
                {
                    this._Str_26459(k);
                }
                this._controller._Str_18877(k);
            }
            return true;
        }

        public function _Str_24934(k:String, _arg_2:Boolean=true):void
        {
            var _local_3:IWindow = this._Str_5493();
            if (_local_3 == null)
            {
                return;
            }
            if (_local_3.visible)
            {
                if (this._lastSubViewId == k)
                {
                    if (_arg_2)
                    {
                        _local_3.visible = false;
                    }
                }
                else
                {
                    this._Str_16548(k);
                }
            }
            else
            {
                _local_3.visible = true;
                if (k != this._lastSubViewId)
                {
                    this._Str_16548(k);
                }
            }
        }

        public function _Str_23647():void
        {
            if (this._lastSubViewId == null)
            {
                return;
            }
            this._Str_16548(this._lastSubViewId);
        }

        public function _Str_26316(k:IHabboToolbar):void
        {
            this._toolbar = k;
            this._toolbar.events.addEventListener(HabboToolbarEvent.HTE_TOOLBAR_CLICK, this._Str_3304);
        }

        public function _Str_3328(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:String;
            if (k.type == WindowEvent.WINDOW_EVENT_SELECTED)
            {
                _local_3 = ITabContextWindow(_arg_2).selector.getSelected().name;
                if (_local_3 != this._lastViewId)
                {
                    this._Str_25305(this._lastViewId);
                    this._controller._Str_4511(_local_3);
                }
            }
            else
            {
                if (k.type == WindowMouseEvent.CLICK)
                {
                    if (_arg_2.name == "header_button_close")
                    {
                        this._Str_15430();
                    }
                    if (_arg_2.name == "open_catalog_btn")
                    {
                        this._controller.catalog.openCatalog();
                    }
                }
                else
                {
                    if (k.type == WindowMouseEvent.DOUBLE_CLICK)
                    {
                        if (_arg_2.name == "titlebar")
                        {
                            this._mainWindow.height = this._mainWindow.limits.minHeight;
                        }
                    }
                }
            }
        }

        public function _Str_23205(k:int):void
        {
            if (!this._mainWindow)
            {
                return;
            }
            if (!this._unseenFurniCounter)
            {
                this._unseenFurniCounter = this._Str_11957(InventoryCategory.FURNI);
            }
            this._Str_6423(this._unseenFurniCounter, k);
            this._controller._Str_2834._Str_2491();
        }

        public function _Str_25138(k:int):void
        {
            if (!this._mainWindow)
            {
                return;
            }
            if (!this._unseenRentedFurniCounter)
            {
                this._unseenRentedFurniCounter = this._Str_11957(InventoryCategory.RENTABLES);
            }
            this._Str_6423(this._unseenRentedFurniCounter, k);
            this._controller._Str_2834._Str_2491();
        }

        public function _Str_22445(k:int):void
        {
            if (!this._mainWindow)
            {
                return;
            }
            if (!this._unseenPetsCounter)
            {
                this._unseenPetsCounter = this._Str_11957(InventoryCategory.PETS);
            }
            this._Str_6423(this._unseenPetsCounter, k);
            this._controller._Str_4524._Str_2491();
        }

        public function _Str_24193(k:int):void
        {
            if (!this._mainWindow)
            {
                return;
            }
            if (!this._unseenBadgeCounter)
            {
                this._unseenBadgeCounter = this._Str_11957(InventoryCategory.BADGES);
            }
            this._Str_6423(this._unseenBadgeCounter, k);
            this._controller._Str_7962._Str_2491();
        }

        public function _Str_24185(k:int):void
        {
            if (!this._mainWindow)
            {
                return;
            }
            if (!this._unseenBotCounter)
            {
                this._unseenBotCounter = this._Str_11957(InventoryCategory.BOTS);
            }
            this._Str_6423(this._unseenBotCounter, k);
            this._controller._Str_8302._Str_2491();
        }

        public function _Str_9043(k:String):IWindowContainer
        {
            return this._inventoryViews[k] as IWindowContainer;
        }

        private function _Str_15287(k:String):void
        {
            var _local_2:IWindow = this.mainContainer.getChildByName(k);
            if (_local_2)
            {
                this._inventoryViews[k] = this.mainContainer.removeChild(_local_2);
            }
        }

        private function _Str_25305(k:String):void
        {
            switch (k)
            {
                case InventoryCategory.FURNI:
                    this._controller._Str_2834._Str_4409();
                    return;
                case InventoryCategory.RENTABLES:
                    this._controller._Str_2834._Str_4409();
                    return;
                case InventoryCategory.PETS:
                    this._controller._Str_4524._Str_4409();
                    return;
                case InventoryCategory.BADGES:
                    this._controller._Str_7962._Str_4409();
                    return;
                case InventoryCategory.BOTS:
                    this._controller._Str_8302._Str_4409();
                    return;
            }
        }

        private function _Str_26459(k:String):void
        {
            if (k == null)
            {
                return;
            }
            if (k == "")
            {
                return;
            }
            if (this._Str_11062)
            {
                this._Str_11062.visible = false;
            }
            if (this._Str_10034)
            {
                this._Str_10034.visible = false;
            }
            this._controller._Str_11401(k);
            if (this.mainContainer == null)
            {
                return;
            }
            this.mainContainer.removeChild(this._lastView);
            this.mainContainer.invalidate();
            var _local_2:IWindowContainer = this._controller._Str_17609(k);
            if (_local_2 == null)
            {
                return;
            }
            _local_2.visible = true;
            this.mainContainer.addChild(_local_2);
            _local_2.height = this.mainContainer.height;
            this._controller._Str_2491(k);
            this._lastView = _local_2;
            this._lastViewId = k;
            var _local_3:ITabContextWindow = (this._mainWindow.findChildByName("tabs") as ITabContextWindow);
            if (_local_3 == null)
            {
                return;
            }
            _local_3.selector.setSelected(_local_3.selector.getSelectableByName(k));
            this._Str_24643();
        }

        private function _Str_24643():void
        {
            var _local_2:int;
            var _local_3:_Str_3718;
            var k:IRecycler = this._controller.catalog.getRecycler();
            if (k != null)
            {
                _local_2 = 0;
                while (_local_2 < k.numberOfSlots)
                {
                    _local_3 = k._Str_18924(_local_2);
                    if (_local_3 != null)
                    {
                        k.releaseSlot(_local_2);
                    }
                    _local_2++;
                }
            }
        }

        private function enableScaling():void
        {
            this._mainWindow.height = this._mainWindow.limits.minHeight;
            this._mainWindow.setParamFlag(WindowParam.WINDOW_PARAM_MOUSE_SCALING_TARGET, true);
            this._mainWindow.findChildByName("top_content").setParamFlag(WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_STRETCH, true);
        }

        private function _Str_22922():void
        {
            this._mainWindow.height = this._mainWindow.limits.minHeight;
            this._mainWindow.setParamFlag(WindowParam.WINDOW_PARAM_MOUSE_SCALING_TARGET, false);
            this._mainWindow.findChildByName("top_content").setParamFlag(WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_STRETCH, false);
        }

        private function _Str_16548(k:String):void
        {
            if (((k == null) || (k == "")))
            {
                return;
            }
            this._controller._Str_11401(k);
            var _local_2:IWindowContainer = (this._mainWindow.findChildByName("subContentArea") as IWindowContainer);
            while (_local_2.numChildren > 0)
            {
                _local_2.removeChildAt(0);
            }
            var _local_3:IWindowContainer = this._controller._Str_24435(k);
            if (_local_3 != null)
            {
                this._Str_22922();
                _local_2.visible = true;
                _local_3.visible = true;
                _local_2.height = _local_3.height;
                _local_2.addChild(_local_3);
            }
            else
            {
                this.enableScaling();
                _local_2.visible = false;
                _local_2.height = 0;
            }
            _local_2.y = (this._mainWindow.findChildByName("top_content").rectangle.bottom + 5);
            this._mainWindow._Str_5665();
            if (this._mainWindow.parent != null)
            {
                if ((this._mainWindow.x + this._mainWindow.width) > this._mainWindow.parent.width)
                {
                    this._mainWindow.x = (this._mainWindow.parent.width - this._mainWindow.width);
                }
                if ((this._mainWindow.y + this._mainWindow.height) > this._mainWindow.parent.height)
                {
                    this._mainWindow.y = ((this._mainWindow.parent.height - this._mainWindow.height) * 0.5);
                }
                if (this._mainWindow.y < 0)
                {
                    this._mainWindow.y = 0;
                }
            }
            this._lastSubView = _local_3;
            this._lastSubViewId = k;
        }

        private function _Str_11957(k:String):IWindowContainer
        {
            var _local_2:IWindowContainer = this._windowManager.createUnseenItemCounter();
            var _local_3:IWindowContainer = (this._mainWindow.findChildByName(k) as IWindowContainer);
            if (_local_3)
            {
                _local_3.addChild(_local_2);
                _local_2.x = ((_local_3.width - _local_2.width) - _Str_3504);
                _local_2.y = _Str_3504;
            }
            return _local_2;
        }

        private function _Str_6423(k:IWindowContainer, _arg_2:int):void
        {
            var _local_5:ILabelWindow;
            k.findChildByName("count").caption = _arg_2.toString();
            k.visible = (_arg_2 > 0);
            var _local_3:String = "";
            switch (k)
            {
                case this._unseenBotCounter:
                    _local_3 = InventoryCategory.BOTS;
                    break;
                case this._unseenPetsCounter:
                    _local_3 = InventoryCategory.PETS;
                    break;
                case this._unseenBadgeCounter:
                    _local_3 = InventoryCategory.BADGES;
                    break;
                case this._unseenFurniCounter:
                    _local_3 = InventoryCategory.FURNI;
                    break;
                case this._unseenRentedFurniCounter:
                    _local_3 = InventoryCategory.RENTABLES;
                    break;
            }
            var _local_4:IWindowContainer = (this._mainWindow.findChildByName(_local_3) as IWindowContainer);
            if (_local_4)
            {
                _local_5 = (_local_4.getChildByTag("TITLE") as ILabelWindow);
                if (_local_5)
                {
                    if (k.visible)
                    {
                        _local_5.margins.right = (k.width + (2 * _Str_3504));
                    }
                    else
                    {
                        _local_5.margins.right = _local_5.margins.left;
                    }
                    _local_4.width = _local_5.width;
                    k.x = ((_local_4.width - k.width) - _Str_3504);
                }
            }
        }

        public function _Str_3304(k:HabboToolbarEvent):void
        {
            if (k._Str_3378 != HabboToolbarIconEnum.INVENTORY)
            {
                return;
            }
            if (k.type == HabboToolbarEvent.HTE_TOOLBAR_CLICK)
            {
                if (this._lastViewId == InventoryCategory.PETS)
                {
                    this._Str_5985(InventoryCategory.PETS);
                }
                else
                {
                    if (this._lastViewId == InventoryCategory.FURNI)
                    {
                        this._Str_5985(InventoryCategory.FURNI);
                    }
                    else
                    {
                        if (this._lastViewId == InventoryCategory.RENTABLES)
                        {
                            this._Str_5985(InventoryCategory.RENTABLES);
                        }
                        else
                        {
                            if (this._lastViewId == InventoryCategory.BADGES)
                            {
                                this._Str_5985(InventoryCategory.BADGES);
                            }
                            else
                            {
                                if (this._lastViewId == InventoryCategory.BOTS)
                                {
                                    this._Str_5985(InventoryCategory.BOTS);
                                }
                                else
                                {
                                    if (this._controller != null)
                                    {
                                        this._controller._Str_4511(InventoryCategory.FURNI);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
