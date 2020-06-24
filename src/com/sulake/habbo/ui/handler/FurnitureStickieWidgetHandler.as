package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetFurniToWidgetMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetStickieSendUpdateMessage;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.habbo.ui.widget.events.RoomWidgetStickieDataUpdateEvent;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import flash.events.Event;

    public class FurnitureStickieWidgetHandler implements IRoomWidgetHandler 
    {
        private var _isDisposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer = null;


        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        public function get type():String
        {
            return RoomWidgetEnum.FURNI_STICKIE_WIDGET;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            this._container = k;
        }

        public function dispose():void
        {
            this._isDisposed = true;
            this._container = null;
        }

        public function getWidgetMessages():Array
        {
            return [RoomWidgetFurniToWidgetMessage.RWFWM_MESSAGE_REQUEST_STICKIE, RoomWidgetStickieSendUpdateMessage.RWSUM_STICKIE_SEND_DELETE, RoomWidgetStickieSendUpdateMessage.RWSUM_STICKIE_SEND_UPDATE];
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            var _local_2:RoomWidgetFurniToWidgetMessage;
            var _local_3:IRoomObject;
            var _local_4:RoomWidgetStickieSendUpdateMessage;
            var _local_5:RoomWidgetStickieSendUpdateMessage;
            var _local_6:IRoomObjectModel;
            var _local_7:String;
            var _local_8:String;
            var _local_9:String;
            var _local_10:Boolean;
            var _local_11:RoomWidgetStickieDataUpdateEvent;
            switch (k.type)
            {
                case RoomWidgetFurniToWidgetMessage.RWFWM_MESSAGE_REQUEST_STICKIE:
                    _local_2 = (k as RoomWidgetFurniToWidgetMessage);
                    _local_3 = this._container.roomEngine.getRoomObject(_local_2.roomId, _local_2.id, _local_2.category);
                    if (_local_3 != null)
                    {
                        _local_6 = _local_3.getModel();
                        if (_local_6 != null)
                        {
                            _local_7 = _local_6.getString(RoomObjectVariableEnum.FURNITURE_ITEMDATA);
                            if (_local_7.length < 6)
                            {
                                return null;
                            }
                            _local_9 = "";
                            if (_local_7.indexOf(" ") > 0)
                            {
                                _local_8 = _local_7.slice(0, _local_7.indexOf(" "));
                                _local_9 = _local_7.slice((_local_7.indexOf(" ") + 1), _local_7.length);
                            }
                            else
                            {
                                _local_8 = _local_7;
                            }
                            _local_10 = ((this._container.roomSession.isRoomOwner) || (this._container.sessionDataManager.isAnyRoomController));
                            _local_11 = new RoomWidgetStickieDataUpdateEvent(RoomWidgetStickieDataUpdateEvent.RWSDUE_STICKIE_DATA, _local_2.id, _local_3.getType(), _local_9, _local_8, _local_10);
                            this._container.events.dispatchEvent(_local_11);
                        }
                    }
                    break;
                case RoomWidgetStickieSendUpdateMessage.RWSUM_STICKIE_SEND_UPDATE:
                    _local_4 = (k as RoomWidgetStickieSendUpdateMessage);
                    if (_local_4 == null)
                    {
                        return null;
                    }
                    if (((!(this._container == null)) && (!(this._container.roomEngine == null))))
                    {
                        this._container.roomEngine.modifyRoomObjectData(_local_4.objectId, RoomObjectCategoryEnum.OBJECT_CATEGORY_WALLITEM, _local_4._Str_10471, _local_4.text);
                    }
                    break;
                case RoomWidgetStickieSendUpdateMessage.RWSUM_STICKIE_SEND_DELETE:
                    _local_5 = (k as RoomWidgetStickieSendUpdateMessage);
                    if (_local_5 == null)
                    {
                        return null;
                    }
                    if (((!(this._container == null)) && (!(this._container.roomEngine == null))))
                    {
                        this._container.roomEngine.deleteRoomObject(_local_5.objectId, RoomObjectCategoryEnum.OBJECT_CATEGORY_WALLITEM);
                    }
                    break;
            }
            return null;
        }

        public function getProcessedEvents():Array
        {
            return [];
        }

        public function processEvent(k:Event):void
        {
            var _local_2:Event;
        }

        public function update():void
        {
        }
    }
}
