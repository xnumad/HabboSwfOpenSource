package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextMenuWidget;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.ui.widget.furniture.mysterybox.MysteryBoxToolbarExtension;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.room.events.RoomEngineTriggerWidgetEvent;
    import com.sulake.habbo.communication.messages.incoming.room.furniture._Str_8674;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetUseProductMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.ui.widget.enums.ContextMenuEnum;
    import flash.events.Event;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import flash.geom.Rectangle;
    import flash.geom.Point;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_6006;
    import com.sulake.habbo.communication.messages.parser.room.furniture._Str_6716;
    import com.sulake.habbo.room.events.RoomEngineObjectEvent;

    public class FurnitureContextMenuWidgetHandler implements IRoomWidgetHandler 
    {
        private var _disposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer = null;
        private var _widget:FurnitureContextMenuWidget;
        private var _connection:IConnection;
        private var _furniContextMenuInfoListener:IMessageEvent = null;
        private var _mysteryBoxToolbarExtension:MysteryBoxToolbarExtension;

        public function FurnitureContextMenuWidgetHandler()
        {
            this._mysteryBoxToolbarExtension = new MysteryBoxToolbarExtension(this);
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                if (this._mysteryBoxToolbarExtension != null)
                {
                    this._mysteryBoxToolbarExtension.dispose();
                    this._mysteryBoxToolbarExtension = null;
                }
                this._Str_21505();
                if (((!(this._connection == null)) && (this._furniContextMenuInfoListener)))
                {
                    this._connection.removeMessageEvent(this._furniContextMenuInfoListener);
                    this._furniContextMenuInfoListener = null;
                }
                this._connection = null;
                this._widget = null;
            }
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get type():String
        {
            return null;
        }

        public function get roomEngine():IRoomEngine
        {
            return (this._container) ? this._container.roomEngine : null;
        }

        private function _Str_21505():void
        {
            if (this._container != null)
            {
                this._container.roomEngine.events.removeEventListener(RoomEngineTriggerWidgetEvent.ROWRE_REQUEST_MONSTERPLANT_SEED_PLANT_CONFIRMATION_DIALOG, this._Str_19781);
                this._container.roomEngine.events.removeEventListener(RoomEngineTriggerWidgetEvent.ROWRE_REQUEST_PURCHASABLE_CLOTHING_CONFIRMATION_DIALOG, this._Str_19399);
                this._container.roomEngine.events.removeEventListener(RoomEngineTriggerWidgetEvent.RETWE_REQUEST_MYSTERYBOX_OPEN_DIALOG, this._Str_21363);
                this._container.roomEngine.events.removeEventListener(RoomEngineTriggerWidgetEvent.RETWE_REQUEST_EFFECTBOX_OPEN_DIALOG, this._Str_19693);
                this._container.roomEngine.events.removeEventListener(RoomEngineTriggerWidgetEvent.RETWE_REQUEST_MYSTERYTROPHY_OPEN_DIALOG, this._Str_19747);
            }
            this._container = null;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            this._Str_21505();
            this._container = k;
            if (k == null)
            {
                return;
            }
            if (this._container.roomEngine != null)
            {
                this._container.roomEngine.events.addEventListener(RoomEngineTriggerWidgetEvent.ROWRE_REQUEST_MONSTERPLANT_SEED_PLANT_CONFIRMATION_DIALOG, this._Str_19781);
                this._container.roomEngine.events.addEventListener(RoomEngineTriggerWidgetEvent.ROWRE_REQUEST_PURCHASABLE_CLOTHING_CONFIRMATION_DIALOG, this._Str_19399);
                this._container.roomEngine.events.addEventListener(RoomEngineTriggerWidgetEvent.RETWE_REQUEST_MYSTERYBOX_OPEN_DIALOG, this._Str_21363);
                this._container.roomEngine.events.addEventListener(RoomEngineTriggerWidgetEvent.RETWE_REQUEST_EFFECTBOX_OPEN_DIALOG, this._Str_19693);
                this._container.roomEngine.events.addEventListener(RoomEngineTriggerWidgetEvent.RETWE_REQUEST_MYSTERYTROPHY_OPEN_DIALOG, this._Str_19747);
            }
        }

        public function set widget(k:FurnitureContextMenuWidget):void
        {
            this._widget = k;
            if (this._container.config.getBoolean("mysterybox.tracker.active"))
            {
                this._mysteryBoxToolbarExtension.createWindow();
            }
        }

        public function set connection(k:IConnection):void
        {
            this._connection = k;
            if (!this._furniContextMenuInfoListener)
            {
                this._furniContextMenuInfoListener = new _Str_8674(this._Str_23634);
                this._connection.addMessageEvent(this._furniContextMenuInfoListener);
            }
        }

        public function get roomSession():IRoomSession
        {
            return (this._container) ? this._container.roomSession : null;
        }

        public function getFurniData(k:IRoomObject):IFurnitureData
        {
            var _local_2:IFurnitureData;
            var _local_3:int;
            if (k)
            {
                _local_3 = k.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_TYPE_ID);
                _local_2 = this._container.sessionDataManager.getFloorItemData(_local_3);
            }
            return _local_2;
        }

        public function _Str_2607():Array
        {
            return [RoomWidgetUseProductMessage.MONSTERPLANT_SEED];
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            var _local_2:RoomWidgetUseProductMessage;
            if (!k)
            {
                return null;
            }
            switch (k.type)
            {
                case RoomWidgetUseProductMessage.MONSTERPLANT_SEED:
                    _local_2 = (k as RoomWidgetUseProductMessage);
                    if (_local_2)
                    {
                        this._container.roomSession._Str_21289(_local_2._Str_2713);
                    }
                    break;
            }
            return null;
        }

        public function _Str_2609():Array
        {
            return [RoomEngineTriggerWidgetEvent.RETWE_OPEN_FURNI_CONTEXT_MENU, RoomEngineTriggerWidgetEvent.RETWE_CLOSE_FURNI_CONTEXT_MENU];
        }

        public function _Str_2485(k:Event):void
        {
            if (this._widget == null)
            {
                return;
            }
            var _local_2:RoomEngineTriggerWidgetEvent = (k as RoomEngineTriggerWidgetEvent);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:IRoomObject = this.getRoomObject(_local_2._Str_1577);
            if (_local_3 == null)
            {
                return;
            }
            switch (k.type)
            {
                case RoomEngineTriggerWidgetEvent.RETWE_OPEN_FURNI_CONTEXT_MENU:
                    switch (_local_2.contextMenu)
                    {
                        case ContextMenuEnum.FRIEND_FURNITURE:
                            this._widget._Str_25158(_local_3);
                            break;
                        case ContextMenuEnum.MONSTERPLANT_SEED:
                            if (this._container.isOwnerOfFurniture(_local_3))
                            {
                                this._widget._Str_23088(_local_3, _local_2.category);
                            }
                            break;
                        case ContextMenuEnum.MYSTERY_BOX:
                            this._widget._Str_25785(_local_3);
                            break;
                        case ContextMenuEnum.RANDOM_TELEPORT:
                            this._widget._Str_23454(_local_3, _local_2.category);
                            break;
                        case ContextMenuEnum.PURCHASABLE_CLOTHING:
                            this._widget._Str_23812(_local_3, _local_2.category);
                            break;
                    }
                    return;
                case RoomEngineTriggerWidgetEvent.RETWE_CLOSE_FURNI_CONTEXT_MENU:
                    this._widget._Str_22969(_local_3);
                    return;
            }
        }

        public function update():void
        {
        }

        public function _Str_25023(k:int):Rectangle
        {
            return this._container.roomEngine.getRoomObjectBoundingRectangle(this._container.roomSession.roomId, k, RoomObjectCategoryEnum.CONST_10, this._container.getFirstCanvasId());
        }

        public function _Str_22398(k:int):Point
        {
            return this._container.roomEngine.getRoomObjectScreenLocation(this._container.roomSession.roomId, k, RoomObjectCategoryEnum.CONST_10, this._container.getFirstCanvasId());
        }

        public function _Str_24389(k:int):void
        {
            this._container.navigator.goToPrivateRoom(k);
        }

        public function _Str_24943(k:int):void
        {
            this._connection.send(new _Str_6006(k));
        }

        private function getRoomObject(k:int):IRoomObject
        {
            if (this._container == null)
            {
                return null;
            }
            return this._container.roomEngine.getRoomObject(this._container.roomSession.roomId, k, RoomObjectCategoryEnum.CONST_10);
        }

        private function _Str_23634(k:_Str_8674):void
        {
            var _local_2:_Str_6716;
            var _local_3:IRoomObject;
            if (this._widget != null)
            {
                _local_2 = k.getParser();
                _local_3 = this.getRoomObject(_local_2._Str_1577);
                if (_local_3 != null)
                {
                    this._widget._Str_24867(_local_3, _local_2._Str_3916, _local_2._Str_24570, _local_2._Str_25076, _local_2._Str_24832, _local_2._Str_24908);
                }
            }
        }

        private function _Str_19781(k:RoomEngineObjectEvent):void
        {
            var _local_2:IRoomObject;
            var _local_3:Boolean;
            if (this._widget != null)
            {
                _local_2 = this.getRoomObject(k._Str_1577);
                if (_local_2 != null)
                {
                    _local_3 = this._container.isOwnerOfFurniture(_local_2);
                    if (!_local_3)
                    {
                        return;
                    }
                    this._widget._Str_20801(_local_2);
                }
            }
        }

        private function _Str_19399(k:RoomEngineObjectEvent):void
        {
            var _local_2:IRoomObject;
            var _local_3:Boolean;
            if (this._widget != null)
            {
                _local_2 = this.getRoomObject(k._Str_1577);
                if (_local_2 != null)
                {
                    _local_3 = this._container.isOwnerOfFurniture(_local_2);
                    if (!_local_3)
                    {
                        return;
                    }
                    this._widget._Str_24748(_local_2);
                }
            }
        }

        private function _Str_19693(k:RoomEngineObjectEvent):void
        {
            var _local_2:IRoomObject;
            var _local_3:Boolean;
            if (this._widget != null)
            {
                _local_2 = this.getRoomObject(k._Str_1577);
                if (_local_2 != null)
                {
                    _local_3 = this._container.isOwnerOfFurniture(_local_2);
                    if (!_local_3)
                    {
                        return;
                    }
                    this._widget._Str_22510(_local_2);
                }
            }
        }

        private function _Str_19747(k:RoomEngineObjectEvent):void
        {
            var _local_2:IRoomObject;
            var _local_3:Boolean;
            if (this._widget != null)
            {
                _local_2 = this.getRoomObject(k._Str_1577);
                if (_local_2 != null)
                {
                    _local_3 = this._container.isOwnerOfFurniture(_local_2);
                    if (!_local_3)
                    {
                        return;
                    }
                    this._widget._Str_25152(_local_2);
                }
            }
        }

        private function _Str_21363(k:RoomEngineObjectEvent):void
        {
            var _local_2:IRoomObject;
            if (this._widget != null)
            {
                _local_2 = this.getRoomObject(k._Str_1577);
                if (_local_2 != null)
                {
                    this._widget._Str_20629(_local_2);
                }
            }
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return this._container;
        }

        public function get widget():FurnitureContextMenuWidget
        {
            return this._widget;
        }
    }
}
