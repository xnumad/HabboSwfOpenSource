package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.furniture.video.YoutubeDisplayWidget;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.communication.messages.incoming.room.furniture._Str_8731;
    import com.sulake.habbo.communication.messages.incoming.room.furniture.YoutubeDisplayPlaylistsEvent;
    import com.sulake.habbo.communication.messages.incoming.room.furniture._Str_9325;
    import com.sulake.habbo.communication.messages.parser.room.furniture._Str_8063;
    import com.sulake.habbo.communication.messages.parser.room.furniture._Str_7559;
    import com.sulake.habbo.communication.messages.parser.room.furniture.YoutubeDisplayPlaylistsMessageParser;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.room.events.RoomEngineTriggerWidgetEvent;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.session.SecurityLevelEnum;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture._Str_10913;
    import flash.events.Event;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture._Str_9987;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture._Str_5009;
    import __AS3__.vec.*;

    public class FurnitureYoutubeDisplayWidgetHandler implements IRoomWidgetHandler 
    {
        private static const _Str_17561:int = 0;
        private static const _Str_17664:int = 1;
        private static const _Str_18151:int = 2;
        private static const _Str_18591:int = 3;

        private var _container:IRoomWidgetHandlerContainer;
        private var _widget:YoutubeDisplayWidget;
        private var _events:Vector.<IMessageEvent>;


        public function get type():String
        {
            return RoomWidgetEnum.YOUTUBE;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            this._container = k;
            //this.addMessageEvent(new _Str_8731(this._Str_23173));
            //this.addMessageEvent(new YoutubeDisplayPlaylistsEvent(this._Str_24746));
            //this.addMessageEvent(new _Str_9325(this._Str_25218));
        }

        private function addMessageEvent(k:IMessageEvent):void
        {
            if (this._events == null)
            {
                this._events = new Vector.<IMessageEvent>(0);
            }
            this._events.push(k);
            this._container.connection.addMessageEvent(k);
        }

        private function _Str_22855():void
        {
            var k:IMessageEvent;
            for each (k in this._events)
            {
                this._container.connection.removeMessageEvent(k);
                k.dispose();
            }
        }

        private function _Str_23173(k:_Str_8731):void
        {
            var _local_2:_Str_8063 = k.getParser();
            this._widget.showVideo(_local_2.furniId, _local_2.videoId, _local_2._Str_25795, _local_2._Str_23507, _local_2.state);
        }

        private function _Str_25218(k:_Str_9325):void
        {
            var _local_2:_Str_7559 = k.getParser();
            this._widget._Str_22371(_local_2.furniId, _local_2.commandId);
        }

        private function _Str_24746(k:YoutubeDisplayPlaylistsEvent):void
        {
            var _local_2:YoutubeDisplayPlaylistsMessageParser = k.getParser();
            this._widget._Str_24455(_local_2.furniId, _local_2.playlists, _local_2.unknownString);
        }

        public function set widget(k:YoutubeDisplayWidget):void
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
            return;

            var _local_4:Boolean;
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
                        _local_4 = ((this._container.isOwnerOfFurniture(_local_3)) || (this._container.sessionDataManager.hasSecurity(SecurityLevelEnum._Str_3751)));
                        this._widget.show(_local_3, _local_4);
                        this._container.connection.send(new _Str_10913(_local_3.getId()));
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
            this._Str_22855();
            this._container = null;
        }

        public function get disposed():Boolean
        {
            return this._container == null;
        }

        public function _Str_19594(k:int, _arg_2:String):void
        {
            this._container.connection.send(new _Str_9987(k, _arg_2));
        }

        public function _Str_23793(k:int):void
        {
            this._container.connection.send(new _Str_5009(k, _Str_17561));
        }

        public function _Str_23211(k:int):void
        {
            this._container.connection.send(new _Str_5009(k, _Str_17664));
        }

        public function pauseVideo(k:int):void
        {
            this._container.connection.send(new _Str_5009(k, _Str_18151));
        }

        public function _Str_25279(k:int):void
        {
            this._container.connection.send(new _Str_5009(k, _Str_18591));
        }
    }
}
