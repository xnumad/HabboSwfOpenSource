package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.core.window.components.IDropMenuWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.communication.connection.IConnection;
	import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_7365;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.habbo.catalog.purchase.RoomAdPurchaseData;
    import com.sulake.habbo.room.events.RoomEngineEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_4253;
    import com.sulake.habbo.communication.messages.incoming.users._Str_2866;
    import com.sulake.habbo.communication.messages.parser.catalog._Str_8067;
    import com.sulake.habbo.catalog.IPurchasableOffer;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events._Str_3308;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.catalog.viewer.Offer;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.session.HabboClubLevelEnum;

    public class RoomAdsCatalogWidget extends CatalogWidget
    {
        private var _catalog:HabboCatalog;
        private var _messageListener:IMessageEvent = null;
        private var _name:String;
        private var _description:String;
        private var _rooms:Array;
        private var _isVip:Boolean;
        private var _categoryMenu:IDropMenuWindow;

        public function RoomAdsCatalogWidget(k:IWindowContainer, _arg_2:HabboCatalog)
        {
            super(k);
            this._catalog = _arg_2;
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return false;
            }
            if (this._catalog == null)
            {
                return false;
            }
            var k:IConnection = this._catalog.connection;
            if (this._messageListener == null)
            {
                this._messageListener = new _Str_7365(this._Str_22552);
                k.addMessageEvent(this._messageListener);
            }
            this._catalog._Str_15954();
            window.findChildByName("name_input_text").addEventListener(WindowEvent.WINDOW_EVENT_CHANGE, this._Str_24912);
            window.findChildByName("desc_input_text").addEventListener(WindowEvent.WINDOW_EVENT_CHANGE, this._Str_24087);
            events.addEventListener(CatalogWidgetEvent.PURCHASE, this._Str_24262);
            var _local_2:RoomAdPurchaseData = this._catalog._Str_3064;
            var _local_3:int = this._catalog.getInteger("room_ad.duration.minutes", 120);
            var _local_4:int = this._Str_21550(_local_2, _local_3);
            this._catalog.localization.registerParameter("roomad.catalog_text", "duration", String(_local_4));
            this._catalog.roomEngine.events.addEventListener(RoomEngineEvent.INITIALIZED, this.onRoomInitialized);
            this._Str_20930();
            return true;
        }

        private function _Str_21550(k:RoomAdPurchaseData, _arg_2:int):int
        {
            var _local_3:Boolean = this._catalog.getBoolean("roomad.limited_extension");
            if ((((!(_local_3)) || (k == null)) || (k.expirationTime == null)))
            {
                return _arg_2;
            }
            var _local_4:Date = new Date();
            var _local_5:Number = _local_4.getTime();
            var _local_6:Number = k.expirationTime.getTime();
            var _local_7:Number = (_local_5 - _local_6);
            var _local_8:Number = (_local_7 / (1000 * 60));
            _local_8 = (_local_8 + _arg_2);
            return _local_8;
        }

        private function _Str_20930():void
        {
            var _local_2:_Str_4253;
            if (window == null)
            {
                return;
            }
            this._categoryMenu = (window.findChildByName("categories_list") as IDropMenuWindow);
            var k:Array = [];
            for each (_local_2 in this._catalog.navigator._Str_8075)
            {
                k.push((("${navigator.searchcode.title.eventcategory__" + _local_2._Str_2712) + "}"));
            }
            this._categoryMenu.populate(k);
            this._categoryMenu.selection = 0;
            this._categoryMenu.addEventListener(WindowEvent.WINDOW_EVENT_SELECTED, this._Str_23736);
        }

        private function onRoomInitialized(k:RoomEngineEvent):void
        {
            if (k == null)
            {
                return;
            }
            this._Str_19526(k.roomId, false);
        }

        private function _Str_19526(k:int, _arg_2:Boolean=false):void
        {
            var _local_8:_Str_2866;
            var _local_9:String;
            var _local_10:RoomAdPurchaseData;
            if (window == null)
            {
                return;
            }
            var _local_3:IDropMenuWindow = (window.findChildByName("room_drop_menu") as IDropMenuWindow);
            if (this._rooms == null)
            {
                if (_local_3.numMenuItems > 0)
                {
                    _local_3.selection = 0;
                }
                return;
            }
            var _local_4:int;
            var _local_5:Array = [];
            var _local_6:int;
            while (_local_6 < this._rooms.length)
            {
                _local_8 = (this._rooms[_local_6] as _Str_2866);
                if (_arg_2)
                {
                    if (_local_8.roomName.length > 25)
                    {
                        _local_9 = (_local_8.roomName.substr(0, 25) + "...");
                        _local_5.push(_local_9);
                    }
                    else
                    {
                        _local_5.push(_local_8.roomName);
                    }
                }
                if (_local_8.roomId == k)
                {
                    _local_4 = _local_6;
                }
                _local_6++;
            }
            if (_arg_2)
            {
                if (_local_5.length == 0)
                {
                    _local_5.push(this._catalog.localization.getLocalization("roomad.no.available.room", "roomad.no.available.room"));
                }
                _local_3.populate(_local_5);
            }
            var _local_7:_Str_2866 = (this._rooms[_local_4] as _Str_2866);
            if (_local_7 != null)
            {
                _local_3.selection = _local_4;
                _local_10 = this._catalog._Str_3064;
                if (_local_10 == null)
                {
                    _local_10 = new RoomAdPurchaseData();
                    this._catalog._Str_3064 = _local_10;
                }
                _local_10.flatId = _local_7.roomId;
            }
            else
            {
                _local_3.selection = 0;
            }
        }

        private function _Str_23599():void
        {
            var _local_2:_Str_2866;
            var k:RoomAdPurchaseData = this._catalog._Str_3064;
            if (((!(k == null)) && (k._Str_8314)))
            {
                window.findChildByName("name_input_text").caption = k.name;
                window.findChildByName("desc_input_text").caption = k.description;
                _local_2 = new _Str_2866(k.flatId, k.roomName, false);
                if (this._rooms != null)
                {
                    this._rooms.push(_local_2);
                }
                if (this._categoryMenu == null)
                {
                    this._categoryMenu = (window.findChildByName("categories_list") as IDropMenuWindow);
                }
                this._categoryMenu.selection = (k._Str_2712 - 1);
            }
        }

        public function _Str_22552(k:IMessageEvent):void
        {
            var _local_7:RoomAdPurchaseData;
            var _local_8:IWindowContainer;
            if (((!(window)) || (window.disposed)))
            {
                return;
            }
            var _local_2:_Str_7365 = (k as _Str_7365);
            var _local_3:_Str_8067 = _local_2.getParser();
            var _local_4:IDropMenuWindow = (window.findChildByName("room_drop_menu") as IDropMenuWindow);
            this._rooms = _local_3.rooms;
            this._isVip = _local_3._Str_12313;
            var _local_5:int = this._catalog.roomEngine.activeRoomId;
            this._Str_23599();
            this._Str_20930();
            this._Str_19526(_local_5, true);
            var _local_6:IPurchasableOffer = this._Str_25100();
            if (_local_6 != null)
            {
                events.dispatchEvent(new SelectProductEvent(_local_6));
                _local_7 = this._catalog._Str_3064;
                if (_local_7 == null)
                {
                    _local_7 = new RoomAdPurchaseData();
                    this._catalog._Str_3064 = _local_7;
                }
                _local_7.offerId = _local_6.offerId;
                this._catalog._Str_3064 = _local_7;
                _local_8 = (window.findChildByName("price_container") as IWindowContainer);
                this._catalog.utils._Str_6455(_local_8, _local_6);
            }
        }

        private function _Str_24262(k:_Str_3308):void
        {
            this._catalog._Str_15954();
            window.findChildByName("name_input_text").caption = "";
            window.findChildByName("desc_input_text").caption = "";
            if (this._catalog._Str_3064)
            {
                this._catalog._Str_3064.clear();
            }
        }

        private function _Str_24912(k:WindowEvent):void
        {
            var _local_2:ITextFieldWindow = (k.target as ITextFieldWindow);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:RoomAdPurchaseData = this._catalog._Str_3064;
            if (_local_3 != null)
            {
                _local_3.name = _local_2.text;
            }
        }

        private function _Str_24087(k:WindowEvent):void
        {
            var _local_2:ITextFieldWindow = (k.target as ITextFieldWindow);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:RoomAdPurchaseData = this._catalog._Str_3064;
            if (_local_3 != null)
            {
                _local_3.description = _local_2.text;
            }
        }

        private function _Str_26020(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:int;
            var _local_4:_Str_2866;
            var _local_5:RoomAdPurchaseData;
            var _local_6:int;
            var _local_7:IWindow;
            var _local_8:String;
            if (((k.type == WindowEvent.WINDOW_EVENT_SELECTED) && (this._rooms.length > 0)))
            {
                _local_3 = IDropMenuWindow(_arg_2).selection;
                _local_4 = (this._rooms[_local_3] as _Str_2866);
                _local_5 = this._catalog._Str_3064;
                if (_local_5)
                {
                    _local_5.flatId = _local_4.roomId;
                    _local_6 = this._catalog.getInteger("room_ad.duration.minutes", 120);
                    if (_local_4.roomId == _local_5._Str_16649)
                    {
                        _local_6 = this._Str_21550(_local_5, _local_6);
                    }
                    _local_7 = window.findChildByName("ctlg_text_1");
                    _local_7.caption = "${roomad.catalog_text}";
                    this._catalog.localization.registerParameter("roomad.catalog_text", "duration", String(_local_6));
                    _local_8 = this._catalog.localization.getLocalization("roomad.catalog_text");
                    _local_7.caption = _local_8;
                }
            }
        }

        private function _Str_23736(k:WindowEvent):void
        {
            var _local_5:_Str_4253;
            var _local_6:RoomAdPurchaseData;
            var _local_2:int;
            var _local_3:int = -1;
            var _local_4:int = this._categoryMenu.selection;
            for each (_local_5 in this._catalog.navigator._Str_8075)
            {
                if (_local_5.visible)
                {
                    if (_local_4 == _local_2)
                    {
                        _local_3 = _local_5._Str_2712;
                        break;
                    }
                    _local_2++;
                }
            }
            _local_6 = this._catalog._Str_3064;
            if (_local_6)
            {
                _local_6._Str_2712 = _local_3;
            }
        }

        private function _Str_25100():IPurchasableOffer
        {
            var _local_2:int;
            var _local_3:Offer;
            var k:Vector.<IPurchasableOffer> = page.offers;
            if (((!(k == null)) && (k)))
            {
                if (k.length == 1)
                {
                    return k[0];
                }
                _local_2 = 0;
                while (_local_2 < k.length)
                {
                    _local_3 = (k[_local_2] as Offer);
                    if ((((_local_3.clubLevel == HabboClubLevelEnum._Str_2575) && (this._isVip)) || ((!(_local_3.clubLevel == HabboClubLevelEnum._Str_2575)) && (!(this._isVip)))))
                    {
                        return _local_3;
                    }
                    _local_2++;
                }
            }
            return null;
        }

        override public function dispose():void
        {
            var k:IConnection;
            super.dispose();
            if (this._catalog != null)
            {
                k = this._catalog.connection;
                if (this._messageListener != null)
                {
                    k.removeMessageEvent(this._messageListener);
                    this._messageListener = null;
                }
                this._catalog.roomEngine.events.removeEventListener(RoomEngineEvent.INITIALIZED, this.onRoomInitialized);
                this._catalog = null;
            }
        }
    }
}
