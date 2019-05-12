package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.widget.furniture.mannequin.MannequinWidget;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.room.events.RoomEngineTriggerWidgetEvent;
    import com.sulake.habbo.room.events.RoomEngineObjectEvent;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import flash.events.Event;

    public class MannequinWidgetHandler implements IRoomWidgetHandler 
    {
        private var _isDisposed:Boolean = false;
        private var _widget:MannequinWidget;
        private var _container:IRoomWidgetHandlerContainer;


        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        public function dispose():void
        {
            if (!this._isDisposed)
            {
                this.container = null;
                this._isDisposed = true;
            }
        }

        public function get type():String
        {
            return RoomWidgetEnum.MANNEQUIN;
        }

        public function set widget(k:MannequinWidget):void
        {
            this._widget = k;
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return this._container;
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
            var k:Array = [];
            k.push(RoomEngineTriggerWidgetEvent.RETWE_REQUEST_MANNEQUIN);
            return k;
        }

        public function _Str_2485(k:Event):void
        {
            var _local_2:RoomEngineObjectEvent;
            var _local_3:IRoomObject;
            var _local_4:IRoomObjectModel;
            var _local_5:String;
            var _local_6:String;
            var _local_7:String;
            switch (k.type)
            {
                case RoomEngineTriggerWidgetEvent.RETWE_REQUEST_MANNEQUIN:
                    _local_2 = (k as RoomEngineObjectEvent);
                    _local_3 = this._container.roomEngine.getRoomObject(_local_2.roomId, _local_2._Str_1577, _local_2.category);
                    _local_4 = _local_3.getModel();
                    _local_5 = _local_4.getString(RoomObjectVariableEnum.FURNITURE_MANNEQUIN_FIGURE);
                    _local_6 = _local_4.getString(RoomObjectVariableEnum.FURNITURE_MANNEQUIN_GENDER);
                    _local_7 = _local_4.getString(RoomObjectVariableEnum.FURNITURE_MANNEQUIN_NAME);
                    if (((!(_local_5 == null)) && (!(_local_6 == null))))
                    {
                        this._widget.open(_local_3.getId(), _local_5, _local_6, _local_7);
                    }
                    return;
            }
        }

        public function update():void
        {
        }
    }
}
