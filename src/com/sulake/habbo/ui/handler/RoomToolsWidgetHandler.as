package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.navigator.IHabboNavigator;
    import com.sulake.habbo.ui.widget.roomtools.RoomToolsWidget;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.communication.messages.incoming.navigator.GetGuestRoomResultEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.GetGuestRoomResultMessageParser;
    import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.session.events.SessionDataPreferencesEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetZoomToggleMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import flash.events.Event;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
    import __AS3__.vec.*;

    public class RoomToolsWidgetHandler implements IRoomWidgetHandler 
    {
        private var _disposed:Boolean;
        private var _communicationManagerMessageEvents:Vector.<IMessageEvent>;
        private var _communicationManager:IHabboCommunicationManager;
        private var _navigator:IHabboNavigator;
        private var _widget:RoomToolsWidget;
        private var _container:IRoomWidgetHandlerContainer;

        public function RoomToolsWidgetHandler()
        {
            this._communicationManagerMessageEvents = new Vector.<IMessageEvent>();
            super();
        }

        public function set widget(k:RoomToolsWidget):void
        {
            this._widget = k;
        }

        private function onRoomInfo(k:IMessageEvent):void
        {
            var _local_4:String;
            var _local_2:GetGuestRoomResultMessageParser = GetGuestRoomResultEvent(k).getParser();
            var _local_3:GuestRoomData = _local_2.data;
            if (_local_3)
            {
                this._widget.updateRoomData(_local_3);
            }
            if (_local_2._Str_15487)
            {
                if (_local_3)
                {
                    _local_4 = ((_local_3.showOwner) ? ((this._widget.localizations.getLocalizationWithParams("room.tool.room.owner.prefix", "By") + " ") + _local_3.ownerName) : this._widget.localizations.getLocalizationWithParams("room.tool.public.room", "Public room"));
                    this._widget.showRoomInfo(true, _local_3.roomName, _local_4, _local_3.tags);
                    this._widget.storeRoomData(_local_3);
                    this._widget.enterNewRoom(_local_3.flatId);
                }
            }
        }

        public function toggleRoomInfoWindow():void
        {
            this._navigator.toggleRoomInfoVisibility();
        }

        public function goToPrivateRoom(k:int):void
        {
            this._navigator.goToPrivateRoom(k);
        }

        public function get type():String
        {
            return RoomWidgetEnum.ROOM_TOOLS;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            this._container = k;
            this._container.sessionDataManager.events.addEventListener(SessionDataPreferencesEvent.APUE_UPDATED, this._Str_10326);
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return this._container;
        }

        public function getWidgetMessages():Array
        {
            return [RoomWidgetZoomToggleMessage.RWZTM_ZOOM_TOGGLE];
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            return null;
        }

        public function getProcessedEvents():Array
        {
            return [];
        }

        public function processEvent(k:Event):void
        {
        }

        private function _Str_10326(k:SessionDataPreferencesEvent):void
        {
        }

        public function update():void
        {
        }

        public function dispose():void
        {
            var k:IMessageEvent;
            this._disposed = true;
            if (this._communicationManager)
            {
                for each (k in this._communicationManagerMessageEvents)
                {
                    this._communicationManager.removeHabboConnectionMessageEvent(k);
                }
                this._communicationManagerMessageEvents = null;
                this._communicationManager = null;
            }
            if (((this._container) && (this._container.sessionDataManager)))
            {
                this._container.sessionDataManager.events.removeEventListener(SessionDataPreferencesEvent.APUE_UPDATED, this._Str_10326);
            }
            this._navigator = null;
            this._widget = null;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function set navigator(k:IHabboNavigator):void
        {
            this._navigator = k;
        }

        public function get navigator():IHabboNavigator
        {
            return this._navigator;
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return this._container.sessionDataManager;
        }

        public function set communicationManager(k:IHabboCommunicationManager):void
        {
            this._communicationManager = k;
            this._communicationManagerMessageEvents.push(this._communicationManager.addHabboConnectionMessageEvent(new GetGuestRoomResultEvent(this.onRoomInfo)));
        }

        public function rateRoom():void
        {
            this._container.connection.send(new RateFlatMessageComposer(1));
        }

        public function get _Str_5090():Boolean
        {
            return this._navigator.canRateRoom();
        }
    }
}
