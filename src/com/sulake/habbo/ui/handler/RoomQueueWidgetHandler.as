package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetRoomQueueMessage;
    import com.sulake.habbo.session.events.RoomSessionQueueEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.ui.widget.events._Str_3879;
    import flash.events.Event;

    public class RoomQueueWidgetHandler implements IRoomWidgetHandler 
    {
        private var _isDisposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer = null;


        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        public function get type():String
        {
            return RoomWidgetEnum.CHAT_WIDGET;
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

        public function _Str_2607():Array
        {
            var k:Array = [];
            k.push(RoomWidgetRoomQueueMessage.RWRQM_EXIT_QUEUE);
            k.push(RoomWidgetRoomQueueMessage.RWRQM_CHANGE_TO_SPECTATOR_QUEUE);
            k.push(RoomWidgetRoomQueueMessage.RWRQM_CHANGE_TO_VISITOR_QUEUE);
            k.push(RoomWidgetRoomQueueMessage.RWRQM_CLUB_LINK);
            return k;
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            if (((this._container == null) || (this._container.roomSession == null)))
            {
                return null;
            }
            var _local_2:RoomWidgetRoomQueueMessage = (k as RoomWidgetRoomQueueMessage);
            if (_local_2 == null)
            {
                return null;
            }
            switch (k.type)
            {
                case RoomWidgetRoomQueueMessage.RWRQM_EXIT_QUEUE:
                    this._container.roomSession._Str_20268();
                    break;
                case RoomWidgetRoomQueueMessage.RWRQM_CHANGE_TO_SPECTATOR_QUEUE:
                    this._container.roomSession._Str_11375(RoomSessionQueueEvent.QUEUE_TARGET_SPECTATOR);
                    break;
                case RoomWidgetRoomQueueMessage.RWRQM_CHANGE_TO_VISITOR_QUEUE:
                    this._container.roomSession._Str_11375(RoomSessionQueueEvent.QUEUE_TARGET_VISITOR);
                    break;
                case RoomWidgetRoomQueueMessage.RWRQM_CLUB_LINK:
                    if (this._container.catalog != null)
                    {
                        this._container.catalog.openClubCenter();
                    }
                    break;
            }
            return null;
        }

        public function _Str_2609():Array
        {
            return [RoomSessionQueueEvent.RSQE_QUEUE_STATUS];
        }

        public function _Str_2485(k:Event):void
        {
            var _local_2:RoomSessionQueueEvent;
            var _local_3:String;
            var _local_4:Boolean;
            var _local_5:Array;
            var _local_6:int;
            var _local_7:Boolean;
            var _local_8:_Str_3879;
            if (((this._container == null) || (this._container.events == null)))
            {
                return;
            }
            switch (k.type)
            {
                case RoomSessionQueueEvent.RSQE_QUEUE_STATUS:
                    _local_2 = (k as RoomSessionQueueEvent);
                    if (_local_2 == null)
                    {
                        return;
                    }
                    switch (_local_2.queueSetTarget)
                    {
                        case RoomSessionQueueEvent.QUEUE_TARGET_VISITOR:
                            _local_3 = _Str_3879.RWRQUE_VISITOR_QUEUE_STATUS;
                            break;
                        case RoomSessionQueueEvent.QUEUE_TARGET_SPECTATOR:
                            _local_3 = _Str_3879.RWRQUE_SPECTATOR_QUEUE_STATUS;
                            break;
                    }
                    if (_local_3 == null)
                    {
                        return;
                    }
                    _local_4 = true;
                    if (this._container.inventory != null)
                    {
                        _local_4 = (this._container.inventory.clubDays > 0);
                    }
                    _local_5 = _local_2.queueTypes;
                    _local_7 = false;
                    if (_local_5.length > 1)
                    {
                        if (((_local_4) && (!(_local_2.queueTypes.indexOf(RoomSessionQueueEvent.C) == -1))))
                        {
                            _local_6 = (_local_2.getQueueSize(RoomSessionQueueEvent.C) + 1);
                            _local_7 = true;
                        }
                        else
                        {
                            _local_6 = (_local_2.getQueueSize(RoomSessionQueueEvent.D) + 1);
                        }
                    }
                    else
                    {
                        _local_6 = (_local_2.getQueueSize(_local_5[0]) + 1);
                    }
                    _local_8 = new _Str_3879(_local_3, _local_6, _local_4, _local_2.isActive, _local_7);
                    this._container.events.dispatchEvent(_local_8);
                    return;
            }
        }

        public function update():void
        {
        }
    }
}
