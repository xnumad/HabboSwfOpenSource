package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.furniture.video.YoutubeDisplayWidget;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.communication.messages.incoming.room.furniture.YoutubeDisplayVideoMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.furniture.YoutubeDisplayPlaylistsEvent;
    import com.sulake.habbo.communication.messages.incoming.room.furniture.YoutubeControlVideoMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture.YoutubeDisplayVideoMessageParser;
    import com.sulake.habbo.communication.messages.parser.room.furniture.YoutubeControlVideoMessageParser;
    import com.sulake.habbo.communication.messages.parser.room.furniture.YoutubeDisplayPlaylistsMessageParser;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.room.events.RoomEngineTriggerWidgetEvent;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.session.SecurityLevelEnum;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture.GetYoutubeDisplayStatusMessageComposer;
    import flash.events.Event;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture.SetYoutubeDisplayPlaylistMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture.ControlYoutubeDisplayPlaybackMessageComposer;
    import __AS3__.vec.*;

    public class FurnitureYoutubeDisplayWidgetHandler implements IRoomWidgetHandler 
    {
        private static const CONTROL_COMMAND_PREVIOUS_VIDEO:int = 0;
        private static const CONTROL_COMMAND_NEXT_VIDEO:int = 1;
        private static const CONTROL_COMMAND_PAUSE_VIDEO:int = 2;
        private static const CONTROL_COMMAND_CONTINUE_VIDEO:int = 3;

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
            //this.addMessageEvent(new YoutubeDisplayVideoMessageEvent(this.onVideo));
            //this.addMessageEvent(new YoutubeDisplayPlaylistsEvent(this.onPlaylists));
            //this.addMessageEvent(new YoutubeControlVideoMessageEvent(this.onControlVideo));
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

        private function removeEvents():void
        {
            var k:IMessageEvent;
            for each (k in this._events)
            {
                this._container.connection.removeMessageEvent(k);
                k.dispose();
            }
        }

        private function onVideo(k:YoutubeDisplayVideoMessageEvent):void
        {
            var _local_2:YoutubeDisplayVideoMessageParser = k.getParser();
            this._widget.showVideo(_local_2.furniId, _local_2.videoId, _local_2._Str_25795, _local_2._Str_23507, _local_2.state);
        }

        private function onControlVideo(k:YoutubeControlVideoMessageEvent):void
        {
            var _local_2:YoutubeControlVideoMessageParser = k.getParser();
            this._widget._Str_22371(_local_2.furniId, _local_2.commandId);
        }

        private function onPlaylists(k:YoutubeDisplayPlaylistsEvent):void
        {
            var _local_2:YoutubeDisplayPlaylistsMessageParser = k.getParser();
            this._widget._Str_24455(_local_2.furniId, _local_2.playlists, _local_2.unknownString);
        }

        public function set widget(k:YoutubeDisplayWidget):void
        {
            this._widget = k;
        }

        public function getWidgetMessages():Array
        {
            return null;
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
            var _local_3:IRoomObject = this._container.roomEngine.getRoomObject(_local_2.roomId, _local_2.objectId, _local_2.category);
            switch (k.type)
            {
                case RoomEngineTriggerWidgetEvent.OPEN_WIDGET:
                    if (_local_3 != null)
                    {
                        _local_4 = ((this._container.isOwnerOfFurniture(_local_3)) || (this._container.sessionDataManager.hasSecurity(SecurityLevelEnum.EMPLOYEE)));
                        this._widget.show(_local_3, _local_4);
                        this._container.connection.send(new GetYoutubeDisplayStatusMessageComposer(_local_3.getId()));
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
            this.removeEvents();
            this._container = null;
        }

        public function get disposed():Boolean
        {
            return this._container == null;
        }

        public function selectPlaylist(k:int, _arg_2:String):void
        {
            this._container.connection.send(new SetYoutubeDisplayPlaylistMessageComposer(k, _arg_2));
        }

        public function switchToPreviousVideo(k:int):void
        {
            this._container.connection.send(new ControlYoutubeDisplayPlaybackMessageComposer(k, CONTROL_COMMAND_PREVIOUS_VIDEO));
        }

        public function switchToNextVideo(k:int):void
        {
            this._container.connection.send(new ControlYoutubeDisplayPlaybackMessageComposer(k, CONTROL_COMMAND_NEXT_VIDEO));
        }

        public function pauseVideo(k:int):void
        {
            this._container.connection.send(new ControlYoutubeDisplayPlaybackMessageComposer(k, CONTROL_COMMAND_PAUSE_VIDEO));
        }

        public function continueVideo(k:int):void
        {
            this._container.connection.send(new ControlYoutubeDisplayPlaybackMessageComposer(k, CONTROL_COMMAND_CONTINUE_VIDEO));
        }
    }
}
