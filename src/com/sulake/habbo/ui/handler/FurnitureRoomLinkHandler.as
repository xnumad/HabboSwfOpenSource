package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.window.utils._Str_2910;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2929;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_4537;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2370;
    import com.sulake.habbo.window.enum._Str_3023;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.window.utils._Str_2418;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.room.events.RoomEngineTriggerWidgetEvent;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_3570;
    import flash.events.Event;
    import __AS3__.vec.*;

    public class FurnitureRoomLinkHandler implements IRoomWidgetHandler 
    {
        private static const INTERNALLINK:String = "internalLink";

        private var _container:IRoomWidgetHandlerContainer;
        private var _confirmDialog:_Str_2910;
        private var _communicationManagerMessageEvents:Vector.<IMessageEvent>;
        private var _communicationManager:IHabboCommunicationManager;
        private var _roomIdToEnter:int = 0;
        private var _link:String;

        public function FurnitureRoomLinkHandler()
        {
            this._communicationManagerMessageEvents = new Vector.<IMessageEvent>();
            super();
        }

        public function get type():String
        {
            return RoomWidgetEnum.ROOM_LINK;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            this._container = k;
        }

        public function set communicationManager(k:IHabboCommunicationManager):void
        {
            this._communicationManager = k;
            this._communicationManagerMessageEvents.push(this._communicationManager.addHabboConnectionMessageEvent(new _Str_2929(this._Str_4428)));
        }

        private function _Str_4428(event:IMessageEvent):void
        {
            var message:String;
            var roomName:String;
            var ownerName:String;
            var p:_Str_4537 = _Str_2929(event).getParser();
            var roomData:_Str_2370 = p.data;
            if (((roomData) && (roomData.flatId == this._roomIdToEnter)))
            {
                this._roomIdToEnter = 0;
                message = "${room.link.confirmation.message}";
                roomName = roomData.roomName;
                ownerName = roomData.ownerName;
                message = this._container.localization.getLocalization("room.link.confirmation.message");
                if (((!(message == null)) && (message.indexOf("%%room_name%%") > -1)))
                {
                    message = message.replace("%%room_name%%", roomName);
                }
                if (((!(message == null)) && (message.indexOf("%%room_owner%%") > -1)))
                {
                    message = message.replace("%%room_owner%%", ownerName);
                }
                this._confirmDialog = this._container.windowManager.confirm("${room.link.confirmation.title}", message, (_Str_3023.BUTTON_OK | _Str_3023.BUTTON_CANCEL), function (k:_Str_2418, _arg_2:WindowEvent):void
                {
                    if (((!(_container.roomEngine == null)) && (_arg_2.type == WindowEvent.WINDOW_EVENT_OK)))
                    {
                        if (((!(_link == null)) && (_link.length > 0)))
                        {
                            (_container.roomEngine as Component).context.createLinkEvent(("navigator/goto/" + _link));
                        }
                    }
                    k.dispose();
                });
            }
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
            return [RoomEngineTriggerWidgetEvent.RETWE_REQUEST_ROOM_LINK];
        }

        public function _Str_2485(k:Event):void
        {
            var _local_2:RoomEngineTriggerWidgetEvent;
            var _local_3:IRoomObject;
            var _local_4:IRoomObjectModel;
            var _local_5:String;
            switch (k.type)
            {
                case RoomEngineTriggerWidgetEvent.RETWE_REQUEST_ROOM_LINK:
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
                            if (_local_5 == null)
                            {
                                return;
                            }
                            if (((!(this._container.navigator == null)) && (!(this._container.localization == null))))
                            {
                                if (this._confirmDialog != null)
                                {
                                    this._confirmDialog.dispose();
                                    this._confirmDialog = null;
                                }
                                this._link = _local_5;
                                this._roomIdToEnter = parseInt(_local_5, 10);
                                this._communicationManager.connection.send(new _Str_3570(this._roomIdToEnter, false, false));
                            }
                            else
                            {
                                (this._container.roomEngine as Component).context.createLinkEvent(("navigator/goto/" + _local_5));
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
            var k:IMessageEvent;
            if (this._communicationManager)
            {
                for each (k in this._communicationManagerMessageEvents)
                {
                    this._communicationManager.removeHabboConnectionMessageEvent(k);
                }
                this._communicationManagerMessageEvents = null;
                this._communicationManager = null;
            }
            if (this._confirmDialog != null)
            {
                this._confirmDialog.dispose();
                this._confirmDialog = null;
            }
            this._container = null;
        }

        public function get disposed():Boolean
        {
            return this._container == null;
        }
    }
}
