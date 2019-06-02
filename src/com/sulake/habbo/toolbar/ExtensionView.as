package com.sulake.habbo.toolbar
{
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.Core;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.IWindow;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import com.sulake.habbo.toolbar.events.ExtensionViewEvent;
    import flash.geom.Rectangle;

    public class ExtensionView implements IExtensionView 
    {
        private static const _Str_3226:int = 3;
        private static const _Str_18425:int = -8;

        private var _toolbar:HabboToolbar;
        private var _itemWindow:IItemListWindow;
        private var _items:Map;
        private var _disposed:Boolean = false;
        private var _landingView:Boolean = false;
        private var _itemWindowElements:Array;
        private var _windowManager:IHabboWindowManager;
        private var _extraMargin:int = 0;

        public function ExtensionView(k:IHabboWindowManager, _arg_2:IAssetLibrary, _arg_3:HabboToolbar)
        {
            this._itemWindowElements = [];
            super();
            this._toolbar = _arg_3;
            this._windowManager = k;
            var _local_4:XmlAsset = (_arg_2.getAssetByName("extension_grid_xml") as XmlAsset);
            if (_local_4)
            {
                this._itemWindow = (k.buildFromXML((_local_4.content as XML), 1) as IItemListWindow);
            }
            var _local_5:IWindowContainer = this._itemWindow.desktop;
            if (this._itemWindow)
            {
                this._itemWindow.x = (((_local_5.width - this._itemWindow.width) - _Str_3226) - this.extraMargin);
                this._itemWindow.y = _Str_3226;
                this._itemWindow.visible = true;
            }
            else
            {
                Core.error("Unable to initialize Toolbar Extension view window from xml asset", false);
            }
            this._items = new Map();
        }

        public function dispose():void
        {
            var k:Array;
            var _local_2:String;
            if (!this._disposed)
            {
                k = this._items.getKeys();
                for each (_local_2 in k)
                {
                    this.detachExtension(_local_2);
                }
                if (this._itemWindow)
                {
                    this._itemWindow.dispose();
                    this._itemWindow = null;
                }
                this._itemWindowElements = null;
                this._toolbar = null;
                this._items = null;
                this._disposed = true;
            }
        }

        public function get visible():Boolean
        {
            return (this._itemWindow) && (this._itemWindow.visible);
        }

        public function get screenHeight():uint
        {
            if (!this._itemWindow)
            {
                return 0;
            }
            return this._itemWindow.height + this._itemWindow.y;
        }

        public function attachExtension(k:String, _arg_2:IWindow, _arg_3:int=-1, _arg_4:Array=null):void
        {
            if (!this._disposed)
            {
                if (this._items.getValue(k))
                {
                    return;
                }
                this._items.add(k, _arg_2);
                _arg_3 = ((_arg_4 != null) ? this._Str_25816(_arg_4) : _arg_3);
                if (_arg_3 == -1)
                {
                    this._itemWindowElements.push(_arg_2);
                }
                else
                {
                    this._itemWindowElements.splice(_arg_3, 0, _arg_2);
                }
                if (this._itemWindow)
                {
                    this._toolbar._Str_14171((_arg_2 as IWindowContainer));
                    this.refreshItemWindow();
                }
                this._Str_21932();
            }
        }

        public function hasExtension(k:String):Boolean
        {
            return !(this._items.getValue(k) == null);
        }

        private function _Str_23065(k:IWindow):String
        {
            var _local_2:int = this._items.getValues().indexOf(k);
            if (_local_2 != -1)
            {
                return this._items.getKeys()[_local_2];
            }
            return "";
        }

        public function refreshItemWindow():void
        {
            var k:IWindow;
            var _local_2:String;
            this._itemWindow.removeListItems();
            for each (k in this._itemWindowElements)
            {
                _local_2 = this._Str_23065(k);
                switch (_local_2)
                {
                    case ToolbarDisplayExtensionIds.LOGOUT_TOOLS:
                    case ToolbarDisplayExtensionIds.PURSE_CREDITS:
                    case ToolbarDisplayExtensionIds.PURSE_ENGAGEMENT_CURRENCY:
                    case ToolbarDisplayExtensionIds.PURSE_HABBO_CLUB:
                    case ToolbarDisplayExtensionIds.PURSE_SEASONAL_CURRENCY:
                    case ToolbarDisplayExtensionIds.TALENT_PROMO:
                    case ToolbarDisplayExtensionIds.CLUB_PROMO:
                    case ToolbarDisplayExtensionIds.VIP_QUESTS:
                    case ToolbarDisplayExtensionIds.VIDEO_OFFERS:
                    case ToolbarDisplayExtensionIds.SETTINGS:
                    case ToolbarDisplayExtensionIds.PHONE_NUMBER:
                    case ToolbarDisplayExtensionIds.VERIFICATION_CODE:
                    case ToolbarDisplayExtensionIds.RETURN_GIFT:
                    case ToolbarDisplayExtensionIds.TARGETED_OFFER:
                        this._itemWindow.addListItem(k);
                        break;
                    case ToolbarDisplayExtensionIds.PURSE:
                        this._itemWindow.addListItem(k);
                        this._itemWindow.y = (_Str_3226 + _Str_18425);
                        break;
                    default:
                        if (!this._landingView)
                        {
                            this._itemWindow.addListItem(k);
                        }
                }
            }
            this._itemWindow.arrangeListItems();
            this._itemWindow.invalidate();
        }

        private function _Str_25816(k:Array):int
        {
            var _local_2:int;
            while (_local_2 < this._itemWindowElements.length)
            {
                if (k.indexOf(this._itemWindowElements[_local_2].name) > -1)
                {
                    return _local_2;
                }
                _local_2++;
            }
            return -1;
        }

        public function detachExtension(k:String):void
        {
            var _local_2:IWindowContainer;
            if (!this._disposed)
            {
                _local_2 = this._items[k];
                if (_local_2 != null)
                {
                    this._itemWindowElements.splice(this._itemWindowElements.indexOf(_local_2), 1);
                    if (this._itemWindow)
                    {
                        this._toolbar._Str_15912(_local_2);
                        this.refreshItemWindow();
                    }
                }
                this._items.remove(k);
                this._Str_21932();
            }
        }

        private function _Str_21932():void
        {
            var k:Timer = new Timer(25, 1);
            k.addEventListener(TimerEvent.TIMER_COMPLETE, this._Str_3774);
            k.start();
        }

        private function _Str_3774(k:TimerEvent):void
        {
            if (this._toolbar)
            {
                this._toolbar.events.dispatchEvent(new ExtensionViewEvent(ExtensionViewEvent.EVE_EXTENSION_VIEW_RESIZED));
            }
        }

        public function set visible(k:Boolean):void
        {
            if (this._itemWindow)
            {
                this._itemWindow.visible = k;
            }
        }

        public function _Str_22962():void
        {
            var k:IWindowContainer;
            for each (k in this._itemWindowElements)
            {
                this._toolbar._Str_15912(k);
            }
        }

        public function getIconLocation(k:String):Rectangle
        {
            var _local_2:IWindow;
            var _local_3:Rectangle;
            switch (k)
            {
                case HabboToolbarIconEnum.EXT_GROUP:
                    _local_2 = (this._items["room_group_info"] as IWindow);
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

        public function _Str_6621(k:String):IWindow
        {
            var _local_2:IWindow;
            if (k == HabboToolbarIconEnum.EXT_GROUP)
            {
                _local_2 = (this._items["room_group_info"] as IWindow);
            }
            return _local_2;
        }

        public function get landingView():Boolean
        {
            return this._landingView;
        }

        public function set landingView(k:Boolean):void
        {
            this._landingView = k;
            this.refreshItemWindow();
        }

        public function set extraMargin(k:int):void
        {
            this._extraMargin = k;
            if (this._itemWindow)
            {
                this._itemWindow.x = (((this._itemWindow.desktop.width - this._itemWindow.width) - _Str_3226) - this.extraMargin);
            }
        }

        public function get extraMargin():int
        {
            return this._extraMargin;
        }
    }
}
