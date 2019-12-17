package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.sound.events.SongDiskInventoryReceivedEvent;
    import com.sulake.habbo.sound.events.PlayListStatusEvent;
    import com.sulake.habbo.sound.events.NowPlayingEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.furni._Str_5581;
    import com.sulake.habbo.communication.messages.incoming.inventory.furni._Str_6908;
    import com.sulake.habbo.communication.messages.incoming.inventory.furni.FurniListAddOrUpdateEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetFurniToWidgetMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetPlayListModificationMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetPlayListPlayStateMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetPlayListUserActionMessage;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.ui.widget.events._Str_2693;
    import com.sulake.habbo.session.enum.RoomControllerLevel;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_3382;
    import com.sulake.habbo.communication.messages.outgoing._Str_341._Str_11152;
    import com.sulake.habbo.communication.messages.outgoing._Str_341._Str_11834;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.room.events.RoomObjectSoundMachineEvent;
    import flash.events.Event;
    import com.sulake.habbo.ui.widget.events._Str_3301;

    public class PlayListEditorWidgetHandler implements IRoomWidgetHandler 
    {
        private var _disposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer;
        private var _connection:IConnection = null;
        private var _furniListUpdateListener:IMessageEvent;
        private var _furniListRemoveListener:IMessageEvent;
        private var _furniListInsertListener:IMessageEvent;


        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get type():String
        {
            return RoomWidgetEnum.PLAYLIST_EDITOR_WIDGET;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            this._container = k;
            if (this._container._Str_2476)
            {
                this._container._Str_2476.events.addEventListener(SongDiskInventoryReceivedEvent.SDIR_SONG_DISK_INVENTORY_RECEIVENT_EVENT, this._Str_4671);
                this._container._Str_2476.events.addEventListener(PlayListStatusEvent.PLUE_PLAY_LIST_UPDATED, this._Str_4671);
                this._container._Str_2476.events.addEventListener(PlayListStatusEvent.PLUE_PLAY_LIST_FULL, this._Str_4671);
                this._container._Str_2476.events.addEventListener(NowPlayingEvent.NPE_SONG_CHANGED, this._Str_4671);
                this._container._Str_2476.events.addEventListener(NowPlayingEvent.NPE_USER_PLAY_SONG, this._Str_4671);
                this._container._Str_2476.events.addEventListener(NowPlayingEvent.NPW_USER_STOP_SONG, this._Str_4671);
            }
        }

        public function set connection(k:IConnection):void
        {
            this._furniListUpdateListener = new _Str_5581(this._Str_11630);
            this._furniListRemoveListener = new _Str_6908(this._Str_11630);
            this._furniListInsertListener = new FurniListAddOrUpdateEvent(this._Str_11630);
            this._connection = k;
            this._connection.addMessageEvent(this._furniListUpdateListener);
            this._connection.addMessageEvent(this._furniListRemoveListener);
            this._connection.addMessageEvent(this._furniListInsertListener);
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this._disposed = true;
                if (this._connection)
                {
                    this._connection.removeMessageEvent(this._furniListUpdateListener);
                    this._connection.removeMessageEvent(this._furniListRemoveListener);
                    this._connection.removeMessageEvent(this._furniListInsertListener);
                }
                this._connection = null;
                this._furniListUpdateListener = null;
                if (this._container)
                {
                    if (this._container._Str_2476)
                    {
                        if (this._container._Str_2476.events)
                        {
                            this._container._Str_2476.events.removeEventListener(SongDiskInventoryReceivedEvent.SDIR_SONG_DISK_INVENTORY_RECEIVENT_EVENT, this._Str_4671);
                            this._container._Str_2476.events.removeEventListener(PlayListStatusEvent.PLUE_PLAY_LIST_UPDATED, this._Str_4671);
                            this._container._Str_2476.events.removeEventListener(PlayListStatusEvent.PLUE_PLAY_LIST_FULL, this._Str_4671);
                            this._container._Str_2476.events.removeEventListener(NowPlayingEvent.NPE_SONG_CHANGED, this._Str_4671);
                            this._container._Str_2476.events.removeEventListener(NowPlayingEvent.NPE_USER_PLAY_SONG, this._Str_4671);
                            this._container._Str_2476.events.removeEventListener(NowPlayingEvent.NPW_USER_STOP_SONG, this._Str_4671);
                        }
                    }
                    this._container = null;
                }
            }
        }

        public function _Str_2607():Array
        {
            return [RoomWidgetFurniToWidgetMessage.RWFWM_MESSAGE_REQUEST_PLAYLIST_EDITOR, RoomWidgetPlayListModificationMessage.RWPLAM_ADD_TO_PLAYLIST, RoomWidgetPlayListModificationMessage.RWPLAM_REMOVE_FROM_PLAYLIST, RoomWidgetPlayListPlayStateMessage.RWPLPS_TOGGLE_PLAY_PAUSE, RoomWidgetPlayListUserActionMessage.RWPLUA_OPEN_CATALOGUE_BUTTON_PRESSED];
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            var _local_2:RoomWidgetFurniToWidgetMessage;
            var _local_3:IRoomObject;
            var _local_4:RoomWidgetPlayListModificationMessage;
            var _local_5:RoomWidgetPlayListModificationMessage;
            var _local_6:RoomWidgetPlayListPlayStateMessage;
            var _local_7:Boolean;
            var _local_8:Boolean;
            var _local_9:_Str_2693;
            switch (k.type)
            {
                case RoomWidgetFurniToWidgetMessage.RWFWM_MESSAGE_REQUEST_PLAYLIST_EDITOR:
                    _local_2 = (k as RoomWidgetFurniToWidgetMessage);
                    _local_3 = this._container.roomEngine.getRoomObject(_local_2.roomId, _local_2.id, _local_2.category);
                    if (_local_3 != null)
                    {
                        _local_7 = this._container.isOwnerOfFurniture(_local_3);
                        _local_8 = (((this._container.roomSession.isRoomController) || (this._container.roomSession.roomControllerLevel >= RoomControllerLevel.GUEST)) || (this._container.sessionDataManager.isGodMode));
                        if (_local_7)
                        {
                            _local_9 = new _Str_2693(_Str_2693.RWPLEE_SHOW_PLAYLIST_EDITOR, _local_2.id);
                            this._container.events.dispatchEvent(_local_9);
                        }
                        else
                        {
                            if (_local_8)
                            {
                                if (this._connection != null)
                                {
                                    this._connection.send(new _Str_3382(_local_3.getId(), -2));
                                }
                            }
                        }
                    }
                    break;
                case RoomWidgetPlayListModificationMessage.RWPLAM_ADD_TO_PLAYLIST:
                    _local_4 = (k as RoomWidgetPlayListModificationMessage);
                    if (this._connection != null)
                    {
                        this._connection.send(new _Str_11152(_local_4._Str_5848, _local_4._Str_20440));
                    }
                    break;
                case RoomWidgetPlayListModificationMessage.RWPLAM_REMOVE_FROM_PLAYLIST:
                    _local_5 = (k as RoomWidgetPlayListModificationMessage);
                    if (this._connection != null)
                    {
                        this._connection.send(new _Str_11834(_local_5._Str_20440));
                    }
                    break;
                case RoomWidgetPlayListPlayStateMessage.RWPLPS_TOGGLE_PLAY_PAUSE:
                    _local_6 = (k as RoomWidgetPlayListPlayStateMessage);
                    if (this._connection != null)
                    {
                        this._connection.send(new _Str_3382(_local_6.furniId, _local_6.position));
                    }
                    break;
                case RoomWidgetPlayListUserActionMessage.RWPLUA_OPEN_CATALOGUE_BUTTON_PRESSED:
                    this._container.habboTracking.trackGoogle("playlistEditorPanelOpenCatalogue", "click");
                    break;
            }
            return null;
        }

        public function _Str_2609():Array
        {
            var k:Array = [];
            k.push(RoomObjectSoundMachineEvent.JUKEBOX_DISPOSE);
            return k;
        }

        public function _Str_2485(k:Event):void
        {
            var _local_2:RoomObjectSoundMachineEvent;
            var _local_3:_Str_2693;
            switch (k.type)
            {
                case RoomObjectSoundMachineEvent.JUKEBOX_DISPOSE:
                    _local_2 = (k as RoomObjectSoundMachineEvent);
                    _local_3 = new _Str_2693(_Str_2693.RWPLEE_HIDE_PLAYLIST_EDITOR, _local_2._Str_1577);
                    this._container.events.dispatchEvent(_local_3);
                    return;
            }
        }

        public function update():void
        {
        }

        private function _Str_11630(k:IMessageEvent):void
        {
            var _local_2:_Str_5581 = (k as _Str_5581);
            if (((_local_2) && (_local_2.getParser()._Str_9600 == 0)))
            {
                if (this._container != null)
                {
                    if (this._container.events != null)
                    {
                        this._container.events.dispatchEvent(new _Str_2693(_Str_2693.RWPLEE_INVENTORY_UPDATED, -1));
                    }
                }
            }
        }

        private function _Str_4671(k:Event):void
        {
            var _local_2:NowPlayingEvent;
            switch (k.type)
            {
                case SongDiskInventoryReceivedEvent.SDIR_SONG_DISK_INVENTORY_RECEIVENT_EVENT:
                    this._container.events.dispatchEvent(new _Str_2693(_Str_2693.RWPLEE_SONG_DISK_INVENTORY_UPDATED));
                    return;
                case PlayListStatusEvent.PLUE_PLAY_LIST_UPDATED:
                    this._container.events.dispatchEvent(new _Str_2693(_Str_2693.RWPLEE_PLAY_LIST_UPDATED));
                    return;
                case PlayListStatusEvent.PLUE_PLAY_LIST_FULL:
                    this._container.events.dispatchEvent(new _Str_2693(_Str_2693.RWPLEE_PLAY_LIST_FULL));
                    return;
                case NowPlayingEvent.NPE_SONG_CHANGED:
                    _local_2 = (k as NowPlayingEvent);
                    this._container.events.dispatchEvent(new _Str_3301(_Str_3301.RWPLENPE_SONG_CHANGED, _local_2.id, _local_2.position, _local_2.priority));
                    return;
                case NowPlayingEvent.NPE_USER_PLAY_SONG:
                    _local_2 = (k as NowPlayingEvent);
                    this._container.events.dispatchEvent(new _Str_3301(_Str_3301.RWPLENPE_USER_PLAY_SONG, _local_2.id, _local_2.position, _local_2.priority));
                    return;
                case NowPlayingEvent.NPW_USER_STOP_SONG:
                    _local_2 = (k as NowPlayingEvent);
                    this._container.events.dispatchEvent(new _Str_3301(_Str_3301.RWPLENPW_USER_STOP_SONG, _local_2.id, _local_2.position, _local_2.priority));
                    return;
            }
        }
    }
}
