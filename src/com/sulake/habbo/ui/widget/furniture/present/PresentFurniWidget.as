package com.sulake.habbo.ui.widget.furniture.present
{
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.inventory.IHabboInventory;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.ui.widget.events._Str_2490;
    import com.sulake.habbo.ui.widget.events.RoomWidgetRoomObjectUpdateEvent;
    import com.sulake.habbo.ui.widget.events._Str_3072;
    import flash.events.IEventDispatcher;
    import flash.display.BitmapData;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.geom.Point;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.catalog.enum.ProductTypeEnum;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.ui.handler.FurniturePresentWidgetHandler;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.inventory.items.IFurnitureItem;
    import com.sulake.habbo.inventory.enum.FurniCategory;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.habbo.room.object.RoomObjectOperationEnum;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.tracking.HabboTracking;
    import com.sulake.habbo.catalog.enum.CatalogPageName;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_7285;
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.habbo.avatar.enum.AvatarScaleType;
    import com.sulake.habbo.avatar.IAvatarImage;
    import com.sulake.habbo.avatar.enum.AvatarSetType;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetPresentOpenMessage;
    import com.sulake.habbo.session.RoomUserData;

    public class PresentFurniWidget extends ConversionTrackingWidget implements IAvatarImageListener 
    {
        private static const FLOOR:String = "floor";
        private static const WALLPAPER:String = "wallpaper";
        private static const LANDSCAPE:String = "landscape";

        private var _habboConfiguration:IHabboConfigurationManager;
        private var _catalog:IHabboCatalog;
        private var _inventory:IHabboInventory;
        private var _roomEngine:IRoomEngine;
        private var _window:IFrameWindow;
        private var _objectId:int = -1;
        private var _classId:int = 0;
        private var _itemType:String;
        private var _text:String;
        private var _controller:Boolean;
        private var _openRequested:Boolean = false;
        private var _senderFigure:String;
        private var _senderName:String;
        private var _placedItemId:int = -1;
        private var _placedItemType:String = "";
        private var _placedInRoom:Boolean = false;

        public function PresentFurniWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:IHabboLocalizationManager, _arg_5:IHabboConfigurationManager, _arg_6:IHabboCatalog, _arg_7:IHabboInventory, _arg_8:IRoomEngine)
        {
            super(k, _arg_2, _arg_3, _arg_4);
            this._habboConfiguration = _arg_5;
            this._catalog = _arg_6;
            this._inventory = _arg_7;
            this._roomEngine = _arg_8;
        }

        override public function dispose():void
        {
            this._Str_2718();
            this._habboConfiguration = null;
            this._catalog = null;
            this._inventory = null;
            this._roomEngine = null;
            super.dispose();
        }

        override public function registerUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.addEventListener(_Str_2490.RWPDUE_PACKAGEINFO, this.onObjectUpdate);
            k.addEventListener(_Str_2490.RWPDUE_CONTENTS, this.onObjectUpdate);
            k.addEventListener(_Str_2490.RWPDUE_CONTENTS_IMAGE, this.onObjectUpdate);
            k.addEventListener(_Str_2490.RWPDUE_CONTENTS_CLUB, this.onObjectUpdate);
            k.addEventListener(_Str_2490.RWPDUE_CONTENTS_FLOOR, this.onObjectUpdate);
            k.addEventListener(_Str_2490.RWPDUE_CONTENTS_LANDSCAPE, this.onObjectUpdate);
            k.addEventListener(_Str_2490.RWPDUE_CONTENTS_WALLPAPER, this.onObjectUpdate);
            k.addEventListener(RoomWidgetRoomObjectUpdateEvent.FURNI_REMOVED, this._Str_4159);
            k.addEventListener(_Str_3072.RWEBDUE_PACKAGEINFO, this._Str_21234);
            super.registerUpdateEvents(k);
        }

        override public function unregisterUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.removeEventListener(_Str_2490.RWPDUE_PACKAGEINFO, this.onObjectUpdate);
            k.removeEventListener(_Str_2490.RWPDUE_CONTENTS, this.onObjectUpdate);
            k.removeEventListener(_Str_2490.RWPDUE_CONTENTS_IMAGE, this.onObjectUpdate);
            k.removeEventListener(_Str_2490.RWPDUE_CONTENTS_CLUB, this.onObjectUpdate);
            k.removeEventListener(_Str_2490.RWPDUE_CONTENTS_FLOOR, this.onObjectUpdate);
            k.removeEventListener(_Str_2490.RWPDUE_CONTENTS_LANDSCAPE, this.onObjectUpdate);
            k.removeEventListener(_Str_2490.RWPDUE_CONTENTS_WALLPAPER, this.onObjectUpdate);
            k.removeEventListener(_Str_3072.RWEBDUE_PACKAGEINFO, this._Str_21234);
            k.removeEventListener(RoomWidgetRoomObjectUpdateEvent.FURNI_REMOVED, this._Str_4159);
        }

        private function onObjectUpdate(k:_Str_2490):void
        {
            switch (k.type)
            {
                case _Str_2490.RWPDUE_PACKAGEINFO:
                    this._Str_2718();
                    this._openRequested = false;
                    this._objectId = k._Str_1577;
                    this._text = k.text;
                    this._controller = k.controller;
                    this._senderName = k._Str_22956;
                    this._senderFigure = k._Str_23105;
                    this._Str_3030();
                    this._Str_9278(k._Str_11625);
                    return;
                case _Str_2490.RWPDUE_CONTENTS_FLOOR:
                    if (!this._openRequested)
                    {
                        return;
                    }
                    this._objectId = k._Str_1577;
                    this._classId = k.classId;
                    this._itemType = k._Str_2887;
                    this._text = k.text;
                    this._controller = k.controller;
                    this._placedItemId = k.placedItemId;
                    this._placedItemType = k.placedItemType;
                    this._placedInRoom = k._Str_4057;
                    this._Str_10146();
                    this._Str_12806("packagecard_icon_floor");
                    return;
                case _Str_2490.RWPDUE_CONTENTS_LANDSCAPE:
                    if (!this._openRequested)
                    {
                        return;
                    }
                    this._objectId = k._Str_1577;
                    this._classId = k.classId;
                    this._itemType = k._Str_2887;
                    this._text = k.text;
                    this._controller = k.controller;
                    this._placedItemId = k.placedItemId;
                    this._placedItemType = k.placedItemType;
                    this._placedInRoom = k._Str_4057;
                    this._Str_10146();
                    this._Str_12806("packagecard_icon_landscape");
                    return;
                case _Str_2490.RWPDUE_CONTENTS_WALLPAPER:
                    if (!this._openRequested)
                    {
                        return;
                    }
                    this._objectId = k._Str_1577;
                    this._classId = k.classId;
                    this._itemType = k._Str_2887;
                    this._text = k.text;
                    this._controller = k.controller;
                    this._placedItemId = k.placedItemId;
                    this._placedItemType = k.placedItemType;
                    this._placedInRoom = k._Str_4057;
                    this._Str_10146();
                    this._Str_12806("packagecard_icon_wallpaper");
                    return;
                case _Str_2490.RWPDUE_CONTENTS_CLUB:
                    if (!this._openRequested)
                    {
                        return;
                    }
                    this._objectId = k._Str_1577;
                    this._classId = k.classId;
                    this._itemType = k._Str_2887;
                    this._text = k.text;
                    this._controller = k.controller;
                    this._Str_10146();
                    this._Str_12806("packagecard_icon_hc");
                    return;
                case _Str_2490.RWPDUE_CONTENTS:
                    if (!this._openRequested)
                    {
                        return;
                    }
                    this._objectId = k._Str_1577;
                    this._classId = k.classId;
                    this._itemType = k._Str_2887;
                    this._text = k.text;
                    this._controller = k.controller;
                    this._placedItemId = k.placedItemId;
                    this._placedItemType = k.placedItemType;
                    this._placedInRoom = k._Str_4057;
                    this._Str_10146();
                    this._Str_9278(k._Str_11625);
                    return;
                case _Str_2490.RWPDUE_CONTENTS_IMAGE:
                    if (!this._openRequested)
                    {
                        return;
                    }
                    this._Str_9278(k._Str_11625);
                    return;
            }
        }

        private function _Str_4159(k:RoomWidgetRoomObjectUpdateEvent):void
        {
            if (k.id == this._objectId)
            {
                this._Str_2718();
            }
            if (k.id == this._placedItemId)
            {
                if (this._placedInRoom)
                {
                    this._placedInRoom = false;
                    this._Str_22179();
                }
            }
        }

        private function _Str_21234(k:_Str_3072):void
        {
            switch (k.type)
            {
                case _Str_3072.RWEBDUE_PACKAGEINFO:
                    this._Str_2718();
                    return;
            }
        }

        private function _Str_12806(k:String):void
        {
            var _local_3:BitmapData;
            var _local_2:BitmapDataAsset = (assets.getAssetByName(k) as BitmapDataAsset);
            if (_local_2 != null)
            {
                _local_3 = (_local_2.content as BitmapData);
            }
            this._Str_9278(_local_3);
        }

        private function _Str_9278(k:BitmapData):void
        {
            if (k == null)
            {
                k = new BitmapData(1, 1);
            }
            if (((this._window == null) || (this._window.disposed)))
            {
                return;
            }
            var _local_2:IBitmapWrapperWindow = (this._window.findChildByName("gift_image") as IBitmapWrapperWindow);
            if (_local_2 == null)
            {
                return;
            }
            if (_local_2.bitmap != null)
            {
                _local_2.bitmap.dispose();
            }
            _local_2.bitmap = new BitmapData(_local_2.width, _local_2.height, true, 0);
            var _local_3:Point = new Point(((_local_2.width - k.width) / 2), ((_local_2.height - k.height) / 2));
            _local_2.bitmap.copyPixels(k, k.rect, _local_3);
        }

        private function _Str_10146():void
        {
            var _local_6:String;
            var _local_7:BitmapDataAsset;
            var _local_8:BitmapData;
            var _local_9:String;
            var _local_10:Boolean;
            var _local_11:String;
            if (this._objectId < 0)
            {
                return;
            }
            if (this._window != null)
            {
                this._window.dispose();
            }
            var k:XmlAsset = (assets.getAssetByName("packagecard_new_opened") as XmlAsset);
            this._window = (windowManager.buildFromXML((k.content as XML)) as IFrameWindow);
            this._window.center();
            if (!this._Str_4649())
            {
                _local_6 = "widget.furni.present.window.title_from";
                _Str_2499.registerParameter(_local_6, "name", this._senderName);
                this._window.caption = _Str_2499.getLocalization(_local_6, this._senderName);
            }
            var _local_2:IWindow = this._window.findChildByName("header_button_close");
            if (_local_2 != null)
            {
                _local_2.addEventListener(WindowMouseEvent.CLICK, this.onCloseHandler);
            }
            var _local_3:IBitmapWrapperWindow = (this._window.findChildByName("image_bg") as IBitmapWrapperWindow);
            if (_local_3 != null)
            {
                _local_7 = (assets.getAssetByName("gift_icon_background") as BitmapDataAsset);
                if (_local_7 != null)
                {
                    _local_8 = (_local_7.content as BitmapData);
                    if (_local_3.bitmap)
                    {
                        _local_3.bitmap.dispose();
                    }
                    _local_3.bitmap = _local_8.clone();
                }
            }
            var _local_4:ITextWindow = (this._window.findChildByName("gift_message") as ITextWindow);
            if (_local_4 != null)
            {
                _local_4.text = "";
                if (this._text != null)
                {
                    _local_9 = "widget.furni.present.message_opened";
                    _local_10 = this._Str_20493();
                    if (_local_10)
                    {
                        _local_9 = "widget.furni.present.spaces.message_opened";
                    }
                    _Str_2499.registerParameter(_local_9, "product", this._text);
                    if (this._itemType == ProductTypeEnum.HABBO_CLUB)
                    {
                        _local_4.text = this._text;
                    }
                    else
                    {
                        _local_4.text = _Str_2499.getLocalization(_local_9, this._text);
                    }
                }
                else
                {
                    _local_4.visible = false;
                }
            }
            var _local_5:IWindow = this._window.findChildByName("give_gift_button");
            if (_local_5 != null)
            {
                if (!this._Str_4649())
                {
                    _local_11 = "widget.furni.present.give_gift";
                    _Str_2499.registerParameter(_local_11, "name", this._senderName);
                    _local_5.caption = _Str_2499.getLocalization(_local_11, this._senderName);
                    _local_5.addEventListener(WindowMouseEvent.CLICK, this._Str_24931);
                }
                else
                {
                    _local_5.visible = false;
                }
            }
            this._Str_19121();
            this._Str_6509(this._senderFigure);
            this._Str_22179();
            this._Str_22432();
        }

        private function _Str_20493():Boolean
        {
            var _local_2:IFurnitureData;
            var _local_3:String;
            var k:Boolean;
            if (this._itemType == ProductTypeEnum.WALL)
            {
                _local_2 = (_Str_2470 as FurniturePresentWidgetHandler).container.sessionDataManager.getWallItemData(this._classId);
                if (_local_2 != null)
                {
                    _local_3 = _local_2.className;
                    k = (((_local_3 == FLOOR) || (_local_2.className == LANDSCAPE)) || (_local_2.className == WALLPAPER));
                }
            }
            return k;
        }

        private function _Str_25235():Boolean
        {
            return this._itemType == ProductTypeEnum.HABBO_CLUB;
        }

        private function _Str_22179():void
        {
            if (((this._window == null) || (this._window.disposed)))
            {
                return;
            }
            var k:Boolean = this._Str_20493();
            var _local_2:Boolean = this._Str_25235();
            var _local_3:IWindow = this._window.findChildByName("keep_in_room_button");
            if (_local_3 != null)
            {
                _local_3.addEventListener(WindowMouseEvent.CLICK, this._Str_25652);
                _local_3.visible = this._placedInRoom;
                if (((k) || (_local_2)))
                {
                    _local_3.visible = false;
                }
            }
            var _local_4:IWindow = this._window.findChildByName("place_in_room_button");
            if (_local_4 != null)
            {
                _local_4.addEventListener(WindowMouseEvent.CLICK, this._Str_23031);
                _local_4.visible = (!(this._placedInRoom));
                if (k)
                {
                    _local_4.disable();
                }
                if (((k) || (_local_2)))
                {
                    _local_4.visible = false;
                }
            }
            var _local_5:IWindow = this._window.findChildByName("put_in_inventory_button");
            if (_local_5 != null)
            {
                _local_5.addEventListener(WindowMouseEvent.CLICK, this._Str_25047);
                _local_5.enable();
                if (((k) || (_local_2)))
                {
                    _local_5.visible = false;
                }
            }
            var _local_6:IWindow = this._window.findChildByName("separator");
            if (_local_6 != null)
            {
                _local_6.visible = this._Str_4649();
            }
            var _local_7:IWindow = (this._window.findChildByName("give_container") as IWindow);
            if (_local_7 != null)
            {
                _local_7.visible = (!(this._Str_4649()));
            }
            var _local_8:IItemListWindow = (this._window.findChildByName("button_list") as IItemListWindow);
            if (_local_8 != null)
            {
                _local_8.arrangeListItems();
            }
            var _local_9:IItemListWindow = (this._window.findChildByName("give_element_list") as IItemListWindow);
            if (_local_9 != null)
            {
                _local_9.arrangeListItems();
            }
            var _local_10:IItemListWindow = (this._window.findChildByName("element_list") as IItemListWindow);
            if (_local_10 != null)
            {
                _local_10.arrangeListItems();
            }
            this._window._Str_5665();
        }

        private function _Str_16305():void
        {
            this._openRequested = false;
            this._placedItemId = -1;
            this._placedInRoom = false;
            this._Str_2718();
        }

        private function _Str_25652(k:WindowEvent):void
        {
            this._Str_16305();
        }

        private function _Str_23031(k:WindowEvent):void
        {
            var _local_3:IFurnitureItem;
            var _local_2:IWindow = k.target;
            _local_2.disable();
            if (((this._placedItemId > 0) && (!(this._placedInRoom))))
            {
                _local_3 = null;
                switch (this._placedItemType)
                {
                    case ProductTypeEnum.FLOOR:
                        _local_3 = this._inventory._Str_18856(-(this._placedItemId));
                        if (this._Str_5337(_local_3))
                        {
                            this._inventory._Str_7938(this._placedItemId);
                        }
                        break;
                    case ProductTypeEnum.WALL:
                        _local_3 = this._inventory._Str_14082(this._placedItemId);
                        if (this._Str_5337(_local_3))
                        {
                            this._inventory._Str_7938(this._placedItemId);
                        }
                        break;
                    case ProductTypeEnum.PET:
                        if (this._inventory._Str_6675(this._placedItemId, false))
                        {
                            this._inventory._Str_21312(this._placedItemId);
                        }
                        break;
                }
            }
            this._Str_16305();
        }

        public function _Str_5337(k:IFurnitureItem):Boolean
        {
            if (k == null)
            {
                return false;
            }
            var _local_2:Boolean;
            if ((((k.category == FurniCategory._Str_3683) || (k.category == FurniCategory._Str_3639)) || (k.category == FurniCategory._Str_3432)))
            {
                _local_2 = false;
            }
            else
            {
                _local_2 = this._inventory._Str_12029(k);
            }
            return _local_2;
        }

        private function _Str_25047(k:WindowEvent):void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:IRoomObject;
            var _local_2:IWindow = k.target;
            _local_2.disable();
            if (((this._placedItemId > 0) && (this._placedInRoom)))
            {
                if (this._placedItemType == ProductTypeEnum.PET)
                {
                    (_Str_2470 as FurniturePresentWidgetHandler).container.roomSession._Str_13781(this._placedItemId);
                }
                else
                {
                    _local_3 = (_Str_2470 as FurniturePresentWidgetHandler).container.roomSession.roomId;
                    _local_4 = RoomObjectCategoryEnum.CONST_10;
                    _local_5 = this._roomEngine.getRoomObject(_local_3, this._placedItemId, _local_4);
                    if (_local_5 != null)
                    {
                        this._roomEngine.updateObjectWallItemData(_local_5.getId(), _local_4, RoomObjectOperationEnum.OBJECT_PICKUP);
                    }
                }
            }
            this._Str_16305();
        }

        private function _Str_3030():void
        {
            var _local_7:String;
            var _local_8:String;
            var _local_9:String;
            var _local_10:IWindow;
            var _local_11:IWindow;
            var _local_12:String;
            if (this._objectId < 0)
            {
                return;
            }
            if (this._window != null)
            {
                this._window.dispose();
            }
            var k:XmlAsset = (assets.getAssetByName("packagecard_new") as XmlAsset);
            this._window = (windowManager.buildFromXML((k.content as XML)) as IFrameWindow);
            this._window.center();
            if (!this._Str_4649())
            {
                _local_7 = "widget.furni.present.window.title_from";
                _Str_2499.registerParameter(_local_7, "name", this._senderName);
                this._window.caption = _Str_2499.getLocalization(_local_7, this._senderName);
            }
            var _local_2:IWindow = this._window.findChildByName("header_button_close");
            if (_local_2 != null)
            {
                _local_2.addEventListener(WindowMouseEvent.CLICK, this.onCloseHandler);
            }
            var _local_3:IStaticBitmapWrapperWindow = (this._window.findChildByName("gift_card") as IStaticBitmapWrapperWindow);
            if (_local_3)
            {
                _local_8 = this._habboConfiguration.getProperty("catalog.gift_wrapping_new.gift_card");
                if (_local_8 != "")
                {
                    _local_3.assetUri = (("${image.library.url}Giftcards/" + _local_8) + ".png");
                }
            }
            this._Str_19121();
            if (this._Str_4649())
            {
                this._Str_18043();
            }
            else
            {
                this._Str_6509(this._senderFigure);
            }
            var _local_4:ITextWindow = (this._window.findChildByName("message_text") as ITextWindow);
            if (_local_4 != null)
            {
                _local_4.text = this._text;
            }
            var _local_5:ITextWindow = (this._window.findChildByName("message_from") as ITextWindow);
            if (_local_5 != null)
            {
                _local_5.text = "";
                if (!this._Str_4649())
                {
                    _local_9 = "widget.furni.present.message_from";
                    _Str_2499.registerParameter(_local_9, "name", this._senderName);
                    _local_5.text = _Str_2499.getLocalization(_local_9, this._senderName);
                    _local_5.addEventListener(WindowMouseEvent.CLICK, this._Str_24633);
                }
                else
                {
                    _local_5.visible = false;
                }
            }
            var _local_6:IItemListWindow = (this._window.findChildByName("button_list") as IItemListWindow);
            if (_local_6 != null)
            {
                _local_10 = _local_6.getListItemByName("give_gift_button");
                if (_local_10 != null)
                {
                    if (!this._Str_4649())
                    {
                        _local_12 = "widget.furni.present.give_gift";
                        _Str_2499.registerParameter(_local_12, "name", this._senderName);
                        _local_10.caption = _Str_2499.getLocalization(_local_12, this._senderName);
                    }
                    if (this._controller)
                    {
                        _local_10.addEventListener(WindowMouseEvent.CLICK, this._Str_25222);
                    }
                    if (((!(this._controller)) || (this._Str_4649())))
                    {
                        _local_10.visible = false;
                    }
                }
                _local_11 = this._window.findChildByName("open_gift_button");
                if (_local_11 != null)
                {
                    if (this._controller)
                    {
                        _local_11.addEventListener(WindowMouseEvent.CLICK, this._Str_25415);
                    }
                    else
                    {
                        _local_11.visible = false;
                    }
                }
                _local_6.arrangeListItems();
            }
            this._window._Str_5665();
        }

        private function _Str_4649():Boolean
        {
            return (this._senderName == null) || (this._senderName.length == 0);
        }

        private function onCloseHandler(k:WindowEvent):void
        {
            this._openRequested = false;
            this._Str_2718();
        }

        private function _Str_25222(k:WindowEvent):void
        {
            this._Str_21136();
            HabboTracking.getInstance().trackEventLog("Catalog", "click", "client.return_gift_from_open_giftcard.clicked");
        }

        private function _Str_24931(k:WindowEvent):void
        {
            this._Str_21136();
            HabboTracking.getInstance().trackEventLog("Catalog", "click", "client.return_gift_from_opened_present.clicked");
        }

        private function _Str_21136():void
        {
            if (!this._Str_4649())
            {
                this._catalog.giftReceiver = this._senderName;
            }
            this._catalog.openCatalogPage(CatalogPageName.GIFT_SHOP);
        }

        private function send(k:IMessageComposer):void
        {
            var _local_2:IConnection;
            if (this._catalog != null)
            {
                _local_2 = this._catalog.connection;
                if (_local_2 != null)
                {
                    _local_2.send(k);
                }
            }
        }

        private function _Str_12024():void
        {
            if (!this._Str_4649())
            {
                this.send(new _Str_7285(this._senderName));
            }
        }

        private function _Str_24525(k:WindowEvent):void
        {
            this._Str_12024();
        }

        private function _Str_24633(k:WindowEvent):void
        {
            this._Str_12024();
        }

        private function _Str_25415(k:WindowEvent):void
        {
            this._Str_16426();
        }

        public function getAvatarFaceBitmap(k:String):BitmapData
        {
            var _local_2:IAvatarRenderManager = (_Str_2470 as FurniturePresentWidgetHandler).container.avatarRenderManager;
            if ((((_local_2 == null) || (k == null)) || (k.length == 0)))
            {
                return null;
            }
            var _local_3:BitmapData;
            var _local_4:IAvatarImage = _local_2.createAvatarImage(k, AvatarScaleType.LARGE, null, this);
            if (_local_4 != null)
            {
                _local_3 = _local_4._Str_818(AvatarSetType.HEAD);
                _local_4.dispose();
            }
            return _local_3;
        }

        public function _Str_840(k:String):void
        {
            if (((this._window == null) || (this._window.disposed)))
            {
                return;
            }
            if (k == this._senderFigure)
            {
                this._Str_6509(k);
            }
        }

        private function _Str_19121():void
        {
            var k:IRegionWindow = (this._window.findChildByName("avatar_image_region") as IRegionWindow);
            if (k != null)
            {
                if (!this._Str_4649())
                {
                    k.addEventListener(WindowMouseEvent.CLICK, this._Str_24525);
                }
                else
                {
                    k.disable();
                }
            }
        }

        private function _Str_6509(k:String):void
        {
            var _local_2:BitmapData = this.getAvatarFaceBitmap(k);
            if (_local_2 != null)
            {
                this._Str_9900(_local_2);
            }
        }

        private function _Str_18043():void
        {
            var _local_2:BitmapData;
            var k:BitmapDataAsset = (_assets.getAssetByName("gift_incognito") as BitmapDataAsset);
            if (k != null)
            {
                _local_2 = (k.content as BitmapData);
                if (_local_2 != null)
                {
                    this._Str_9900(_local_2.clone());
                }
            }
        }

        private function _Str_9900(k:BitmapData):void
        {
            if (k == null)
            {
                return;
            }
            var _local_2:IBitmapWrapperWindow = (this._window.findChildByName("avatar_image") as IBitmapWrapperWindow);
            if (_local_2 == null)
            {
                return;
            }
            _local_2.bitmap = k;
            _local_2.width = k.width;
            _local_2.height = k.height;
            var _local_3:IWindowContainer = (this._window.findChildByName("avatar_image_region") as IWindowContainer);
            if (_local_3 != null)
            {
                _local_3.width = k.width;
                _local_3.height = k.height;
            }
        }

        private function _Str_2718():void
        {
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
            if (!this._openRequested)
            {
                this._objectId = -1;
            }
            this._text = "";
            this._controller = false;
        }

        private function _Str_16426():void
        {
            var k:RoomWidgetPresentOpenMessage;
            if ((((this._openRequested) || (this._objectId == -1)) || (!(this._controller))))
            {
                return;
            }
            this._openRequested = true;
            this._Str_2718();
            if (messageListener != null)
            {
                k = new RoomWidgetPresentOpenMessage(RoomWidgetPresentOpenMessage.RWPOM_OPEN_PRESENT, this._objectId);
                messageListener.processWidgetMessage(k);
            }
        }

        private function _Str_22432():void
        {
            var k:int;
            var _local_2:int;
            var _local_3:int;
            var _local_4:IRoomObject;
            var _local_5:RoomUserData;
            if (((this._placedItemId > 0) && (this._placedInRoom)))
            {
                k = this._roomEngine.activeRoomId;
                if (this._placedItemType == ProductTypeEnum.PET)
                {
                    _local_2 = this._roomEngine.getRoomObjectCount(k, RoomObjectCategoryEnum.CONST_100);
                    _local_3 = 0;
                    while (_local_3 < _local_2)
                    {
                        _local_4 = this._roomEngine.getRoomObjectWithIndex(k, _local_3, RoomObjectCategoryEnum.CONST_100);
                        _local_5 = (_Str_2470 as FurniturePresentWidgetHandler).container.roomSession.userDataManager.getUserDataByIndex(_local_4.getId());
                        if (((!(_local_5 == null)) && (_local_5._Str_2394 == this._placedItemId)))
                        {
                            this._roomEngine._Str_5538(k, _local_5._Str_2713, RoomObjectCategoryEnum.CONST_100);
                            break;
                        }
                        _local_3++;
                    }
                }
                else
                {
                    this._roomEngine._Str_5538(k, this._placedItemId, RoomObjectCategoryEnum.CONST_10);
                }
            }
        }
    }
}
