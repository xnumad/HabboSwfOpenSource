package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.crafting.CraftingWidget;
    import com.sulake.habbo.ui.RoomDesktop;
    import com.sulake.core.communication.messages.IMessageEvent;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.session.product.IProductData;
    import com.sulake.habbo.communication.messages.incoming.crafting.CraftableProductsEvent;
    import com.sulake.habbo.communication.messages.incoming.crafting.CraftingRecipeEvent;
    import com.sulake.habbo.communication.messages.incoming.crafting.CraftingResultEvent;
    import com.sulake.habbo.communication.messages.incoming.crafting.CraftingRecipesAvailableEvent;
    import com.sulake.habbo.inventory.events.HabboInventoryFurniListParsedEvent;
    import com.sulake.habbo.inventory.enum.InventoryCategory;
    import com.sulake.habbo.communication.messages.outgoing.crafting._Str_7271;
    import com.sulake.habbo.communication.messages.outgoing.crafting._Str_10459;
    import com.sulake.habbo.communication.messages.outgoing.crafting.GetCraftingRecipesAvailableComposer;
    import com.sulake.habbo.ui.widget.crafting.utils.CraftingViewStateEnum;
    import com.sulake.habbo.communication.messages.outgoing.crafting._Str_12393;
    import com.sulake.habbo.communication.messages.outgoing.crafting.CraftSecretComposer;
    import com.sulake.habbo.communication.messages.incoming.crafting.CraftingResultObjectParser;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.communication.messages.incoming.inventory.furni._Str_6821;
    import com.sulake.habbo.communication.messages.outgoing._Str_91._Str_7844;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.room.events.RoomEngineTriggerWidgetEvent;
    import com.sulake.room.object.IRoomObject;
    import flash.events.Event;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import __AS3__.vec.*;

    public class CraftingWidgetHandler implements IRoomWidgetHandler 
    {
        private var _disposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer;
        private var _widget:CraftingWidget;
        private var _roomDesktop:RoomDesktop;
        private var _inventoryUpdateEvent:IMessageEvent;
        private var _messageEvents:Vector.<IMessageEvent>;
        private var _gizmoFurnitureId:int;
        private var _waitingForInitialData:Boolean;
        private var _inventoryDirty:Boolean;
        private var _craftingInProgress:Boolean;
        private var _selectedProductData:IProductData;

        public function CraftingWidgetHandler(k:RoomDesktop)
        {
            this._roomDesktop = k;
        }

        public function dispose():void
        {
            this._Str_15944();
            this._widget = null;
            this._container = null;
            this._roomDesktop = null;
            this._selectedProductData = null;
            this._disposed = true;
        }

        private function _Str_17717():void
        {
            var k:IMessageEvent;
            if (((!(this._container)) || (!(this._container.connection))))
            {
                return;
            }
            this._messageEvents = new Vector.<IMessageEvent>(0);
            this._messageEvents.push(new CraftableProductsEvent(this._Str_23500));
            this._messageEvents.push(new CraftingRecipeEvent(this._Str_24394));
            this._messageEvents.push(new CraftingResultEvent(this._Str_24572));
            this._messageEvents.push(new CraftingRecipesAvailableEvent(this._Str_23175));
            for each (k in this._messageEvents)
            {
                this._container.connection.addMessageEvent(k);
            }
        }

        private function _Str_15944():void
        {
            var k:IMessageEvent;
            if ((((!(this._container)) || (!(this._container.connection))) || (!(this._messageEvents))))
            {
                return;
            }
            for each (k in this._messageEvents)
            {
                this._container.connection.removeMessageEvent(k);
                k.dispose();
            }
            this._Str_15726();
            if (((this._container.inventory) && (this._container.inventory.events)))
            {
                this._container.inventory.events.removeEventListener(HabboInventoryFurniListParsedEvent.HFLPE_FURNI_LIST_PARSED, this._Str_21755);
            }
            this._messageEvents = null;
        }

        public function _Str_25738():void
        {
            if (this._waitingForInitialData)
            {
                return;
            }
            this._waitingForInitialData = true;
            if (this._container.inventory._Str_11401(InventoryCategory.FURNI))
            {
                this._Str_19499();
            }
        }

        private function _Str_21755(k:HabboInventoryFurniListParsedEvent):void
        {
            if (((this._waitingForInitialData) && (k.category == InventoryCategory.FURNI)))
            {
                this._Str_19499();
            }
        }

        private function _Str_19499():void
        {
            this._container.connection.send(new _Str_7271(this._gizmoFurnitureId));
        }

        private function _Str_23500(k:CraftableProductsEvent):void
        {
            this._waitingForInitialData = false;
            if (!this._widget)
            {
                return;
            }
            if (!k.getParser().isActive())
            {
                this._widget.hide();
                return;
            }
            this._widget._Str_22471();
            this._widget._Str_24786(k.getParser().recipes, k.getParser().ingredients, this._container.roomEngine, this._container.sessionDataManager);
            this._inventoryDirty = false;
        }

        public function _Str_25388(k:String):void
        {
            this._selectedProductData = this._container.sessionDataManager.getProductData(k);
            this._container.connection.send(new _Str_10459(k));
        }

        private function _Str_24394(k:CraftingRecipeEvent):void
        {
            this._widget._Str_23442(k.getParser().ingredients);
        }

        public function _Str_25351(k:Vector.<int>):void
        {
            this._container.connection.send(new GetCraftingRecipesAvailableComposer(this._gizmoFurnitureId, k));
        }

        private function _Str_23175(k:CraftingRecipesAvailableEvent):void
        {
            this._widget._Str_11931._Str_25724(k.getParser().count, k.getParser().hasRecipes);
        }

        public function _Str_23985():void
        {
            if (!this._selectedProductData)
            {
                return;
            }
            this._widget._Str_11931.setState(CraftingViewStateEnum._Str_9671);
            this._Str_21898();
            this._container.connection.send(new _Str_12393(this._gizmoFurnitureId, this._selectedProductData.type));
        }

        public function _Str_23682():void
        {
            this._widget._Str_11931.setState(CraftingViewStateEnum._Str_9671);
            var k:Vector.<int> = this._widget._Str_24728();
            this._Str_21898();
            this._container.connection.send(new CraftSecretComposer(this._gizmoFurnitureId, k));
        }

        private function _Str_24572(k:CraftingResultEvent):void
        {
            var _local_2:CraftingResultObjectParser;
            var _local_3:IFurnitureData;
            this._craftingInProgress = false;
            if (!k.getParser().success)
            {
                this._widget._Str_14796();
                this._inventoryDirty = false;
                this._Str_15726();
                this._widget.setInfoState(CraftingViewStateEnum._Str_8764);
            }
            else
            {
                this._widget._Str_14796();
                _local_2 = k.getParser().result;
                _local_3 = this._container.sessionDataManager.getFloorItemDataByName(_local_2.itemName);
                if (!_local_3)
                {
                    return;
                }
                this._widget.setInfoState(CraftingViewStateEnum._Str_13842, _local_3);
            }
        }

        private function _Str_21898():void
        {
            this._inventoryDirty = true;
            if (this._inventoryUpdateEvent == null)
            {
                this._inventoryUpdateEvent = new _Str_6821(this._Str_18656);
                this._container.connection.addMessageEvent(this._inventoryUpdateEvent);
            }
        }

        private function _Str_18656(k:_Str_6821):void
        {
            this._container.connection.send(new _Str_7844());
            this._container.connection.send(new _Str_7271(this._gizmoFurnitureId));
            this._Str_15726();
        }

        public function _Str_15726():void
        {
            if (this._inventoryUpdateEvent)
            {
                this._container.connection.removeMessageEvent(this._inventoryUpdateEvent);
                this._inventoryUpdateEvent = null;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get type():String
        {
            return RoomWidgetEnum.CRAFTING;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            this._container = k;
            this._Str_17717();
            if (((this._container.inventory) && (this._container.inventory.events)))
            {
                this._container.inventory.events.addEventListener(HabboInventoryFurniListParsedEvent.HFLPE_FURNI_LIST_PARSED, this._Str_21755);
            }
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return this._container;
        }

        public function set widget(k:CraftingWidget):void
        {
            this._widget = k;
        }

        public function _Str_2607():Array
        {
            return null;
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            return null;
        }

        public function _Str_2609():Array
        {
            return [RoomEngineTriggerWidgetEvent.OPEN_WIDGET, RoomEngineTriggerWidgetEvent.CLOSE_WIDGET];
        }

        public function _Str_2485(k:Event):void
        {
            if (((this._container.roomEngine == null) || (this._widget == null)))
            {
                return;
            }
            var _local_2:RoomEngineTriggerWidgetEvent = (k as RoomEngineTriggerWidgetEvent);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:IRoomObject = this._container.roomEngine.getRoomObject(_local_2.roomId, _local_2._Str_1577, _local_2.category);
            switch (k.type)
            {
                case RoomEngineTriggerWidgetEvent.OPEN_WIDGET:
                    if (this._widget.window != null)
                    {
                        return;
                    }
                    if (_local_3 != null)
                    {
                        this._gizmoFurnitureId = _local_3.getId();
                        this._Str_25738();
                    }
                    return;
                case RoomEngineTriggerWidgetEvent.CLOSE_WIDGET:
                    this._gizmoFurnitureId = -1;
                    this._widget.hide();
                    return;
            }
        }

        public function get _Str_3233():Boolean
        {
            var k:int = this._container.roomEngine.activeRoomId;
            var _local_2:IRoomObject = this._container.roomEngine.getRoomObject(k, this._gizmoFurnitureId, RoomObjectCategoryEnum.CONST_10);
            return (!(_local_2 == null)) && (this._container.isOwnerOfFurniture(_local_2));
        }

        public function get craftingInProgress():Boolean
        {
            return this._craftingInProgress;
        }

        public function set craftingInProgress(k:Boolean):void
        {
            this._craftingInProgress = k;
        }

        public function get inventoryDirty():Boolean
        {
            return this._inventoryDirty;
        }

        public function update():void
        {
        }
    }
}
