package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.room.events.RoomEngineTriggerWidgetEvent;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.core.runtime.Component;
    import flash.events.Event;

    public class FurnitureInternalLinkHandler implements IRoomWidgetHandler 
    {
        private static const INTERNALLINK:String = "internalLink";

        private var _container:IRoomWidgetHandlerContainer;


        public function get type():String
        {
            return RoomWidgetEnum.INTERNAL_LINK;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            this._container = k;
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
            return [RoomEngineTriggerWidgetEvent.RETWE_REQUEST_INTERNAL_LINK];
        }

        public function _Str_2485(k:Event):void
        {
            var _local_2:RoomEngineTriggerWidgetEvent;
            var _local_3:IRoomObject;
            var _local_4:IRoomObjectModel;
            var _local_5:String;
            switch (k.type)
            {
                case RoomEngineTriggerWidgetEvent.RETWE_REQUEST_INTERNAL_LINK:
                    _local_2 = (k as RoomEngineTriggerWidgetEvent);
                    if (((!(k == null)) && (!(this._container.roomEngine == null))))
                    {
                        _local_3 = this._container.roomEngine.getRoomObject(_local_2.roomId, _local_2._Str_1577, _local_2.category);
                        if (_local_3 != null)
                        {
                            _local_4 = _local_3.getModel();
                            _local_5 = _local_4.getStringToStringMap(RoomObjectVariableEnum.FURNITURE_DATA).getValue(INTERNALLINK);
                            if (((_local_5 == null) || (_local_5.length == 0)))
                            {
                                _local_5 = _local_4.getString(RoomObjectVariableEnum.FURNITURE_INTERNAL_LINK);
                            }
                            if (((!(_local_5 == null)) && (_local_5.length > 0)))
                            {
                                (this._container.roomEngine as Component).context.createLinkEvent(_local_5);
                            }
                        }
                    }
                    return;
            }
        }

        public function update():void
        {
        }

        public function dispose():void
        {
            this._container = null;
        }

        public function get disposed():Boolean
        {
            return this._container == null;
        }
    }
}
