package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.furniture.externalimage.ExternalImageWidget;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.room.events.RoomEngineUseProductEvent;
    import com.sulake.habbo.room.events.RoomEngineTriggerWidgetEvent;
    import com.sulake.room.object.IRoomObject;
    import flash.events.Event;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.habbo.session.enum.RoomControllerLevel;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;

    public class ExternalImageWidgetHandler implements IRoomWidgetHandler 
    {
        private var _disposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer;
        private var _widget:ExternalImageWidget;


        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            this._container = k;
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return this._container;
        }

        public function set widget(k:ExternalImageWidget):void
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
            return [RoomEngineUseProductEvent.ROSM_USE_PRODUCT_FROM_INVENTORY];
        }

        public function _Str_2485(k:Event):void
        {
            var _local_4:RoomEngineUseProductEvent;
            if (this._container.roomEngine == null)
            {
                return;
            }
            if ((k is RoomEngineUseProductEvent))
            {
                _local_4 = (k as RoomEngineUseProductEvent);
                if (_local_4.type == RoomEngineUseProductEvent.ROSM_USE_PRODUCT_FROM_INVENTORY)
                {
                    this._widget._Str_24496(_local_4._Str_1577);
                }
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
                    if (_local_3 != null)
                    {
                        this._widget._Str_16946(_local_3);
                    }
                    return;
                case RoomEngineTriggerWidgetEvent.CLOSE_WIDGET:
                    this._widget.hide();
                    return;
            }
        }

        public function _Str_25405(k:int):void
        {
            if (((!(this._container == null)) && (!(this._container.roomEngine == null))))
            {
                this._container.roomEngine.deleteRoomObject(k, RoomObjectCategoryEnum.CONST_20);
            }
        }

        public function isRoomController():Boolean
        {
            return this._container.roomSession.isRoomController;
        }

        public function _Str_19701():Boolean
        {
            return this._container.roomSession.roomControllerLevel >= RoomControllerLevel.ROOM_OWNER;
        }

        public function _Str_2488(k:IMessageComposer):void
        {
            this._container.connection.send(k);
        }

        public function update():void
        {
        }

        public function dispose():void
        {
            this._container = null;
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get type():String
        {
            return RoomWidgetEnum.EXTERNAL_IMAGE;
        }

        public function get _Str_19276():String
        {
            return this._container.config.getProperty("stories.image_url_base");
        }

        public function get _Str_18355():String
        {
            return this._container.config.getProperty("stories.image.sharing_url_base");
        }

        public function get _Str_23183():String
        {
            return this._container.config.getProperty("extra_data_service_url");
        }

        public function _Str_25770():Boolean
        {
            return this._container.config.getProperty("stories.report.selfie.enabled") == "true";
        }
    }
}
