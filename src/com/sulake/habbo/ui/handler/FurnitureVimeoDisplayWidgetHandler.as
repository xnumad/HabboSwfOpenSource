package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.furniture.video.VimeoDisplayWidget;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.room.events.RoomEngineTriggerWidgetEvent;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.session.SecurityLevelEnum;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import flash.events.Event;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_5686;

    public class FurnitureVimeoDisplayWidgetHandler implements IRoomWidgetHandler 
    {
        private static const VIDEOID:String = "videoId";

        private var _container:IRoomWidgetHandlerContainer;
        private var _widget:VimeoDisplayWidget;


        public function get type():String
        {
            return RoomWidgetEnum.VIMEO;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            this._container = k;
        }

        public function set widget(k:VimeoDisplayWidget):void
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
            return [];
        }

        public function _Str_2485(k:Event):void
        {
            var _local_4:Boolean;
            var _local_5:String;
            if (this._container.roomEngine == null)
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
                    if (_local_3 != null)
                    {
                        _local_4 = this._container.sessionDataManager.hasSecurity(SecurityLevelEnum._Str_3569);
                        _local_5 = _local_3.getModel().getStringToStringMap(RoomObjectVariableEnum.FURNITURE_DATA).getValue(VIDEOID);
                        this._widget.show(_local_3, _local_4, int(_local_5));
                    }
                    return;
                case RoomEngineTriggerWidgetEvent.CLOSE_WIDGET:
                    this._widget.hide(_local_3);
                    return;
            }
        }

        public function update():void
        {
        }

        public function dispose():void
        {
            if (this.disposed)
            {
                return;
            }
            this._container = null;
        }

        public function get disposed():Boolean
        {
            return this._container == null;
        }

        public function _Str_18970(k:IRoomObject, _arg_2:int):void
        {
            var _local_3:Map = new Map();
            _local_3.add(VIDEOID, _arg_2.toString());
            this._container.connection.send(new _Str_5686(k.getId(), _local_3));
        }
    }
}
