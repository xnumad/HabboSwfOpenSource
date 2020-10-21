package com.sulake.habbo.sound.music
{
    import com.sulake.habbo.sound.IPlayListController;
    import com.sulake.habbo.sound.HabboSoundManagerFlash10;
    import com.sulake.core.communication.connection.IConnection;
    import flash.events.IEventDispatcher;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.sound.PlayListMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.sound.PlayListSongAddedMessageEvent;
    import com.sulake.habbo.sound.events.SoundControllerEvent;
    import com.sulake.habbo.sound.events.SongInfoReceivedEvent;
    import com.sulake.habbo.room.events.RoomObjectSoundMachineEvent;
    import com.sulake.habbo.sound.HabboMusicPrioritiesEnum;
    import flash.events.Event;
    import com.sulake.habbo.sound.ISongInfo;
    import com.sulake.habbo.communication.messages.outgoing.sound.GetSoundMachinePlayListMessageComposer;
    import com.sulake.habbo.communication.messages.incoming.sound.PlayListEntry;
    import com.sulake.habbo.communication.messages.parser.sound.PlayListMessageParser;
    import com.sulake.habbo.sound.events.PlayListStatusEvent;
    import com.sulake.habbo.communication.messages.parser.sound.PlayListSongAddedMessageParser;
    import com.sulake.habbo.sound.*;

    public class SoundMachinePlayListController implements IPlayListController 
    {
        private var _soundManager:HabboSoundManagerFlash10;
        private var _musicController:HabboMusicController;
        private var _connection:IConnection;
        private var _events:IEventDispatcher;
        private var _roomEvents:IEventDispatcher;
        private var _currentEntryId:int = -1;
        private var _playListEntries:Array;
        private var _isPlaying:Boolean;
        private var _disposed:Boolean = false;
        private var _messageEvents:Array;

        public function SoundMachinePlayListController(k:HabboSoundManagerFlash10, _arg_2:HabboMusicController, _arg_3:IEventDispatcher, _arg_4:IEventDispatcher, _arg_5:IConnection)
        {
            var _local_6:IMessageEvent;
            this._playListEntries = new Array();
            super();
            this._soundManager = k;
            this._events = _arg_3;
            this._roomEvents = _arg_4;
            this._connection = _arg_5;
            this._musicController = _arg_2;
            this._messageEvents = [];
            this._messageEvents.push(new PlayListMessageEvent(this.onPlayListMessage));
            this._messageEvents.push(new PlayListSongAddedMessageEvent(this.onPlayListSongAddedMessage));
            for each (_local_6 in this._messageEvents)
            {
                this._connection.addMessageEvent(_local_6);
            }
            this._events.addEventListener(SoundControllerEvent.TRAX_SONG_COMPLETE, this._Str_7805);
            this._events.addEventListener(SongInfoReceivedEvent.SIR_TRAX_SONG_INFO_RECEIVED, this.onSongInfoReceivedEvent);
            this._roomEvents.addEventListener(RoomObjectSoundMachineEvent.SOUND_MACHINE_SWITCHED_ON, this._Str_21084);
            this._roomEvents.addEventListener(RoomObjectSoundMachineEvent.SOUND_MACHINE_SWITCHED_OFF, this._Str_21376);
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get priority():int
        {
            return HabboMusicPrioritiesEnum.PRIORITY_ROOM_PLAYLIST;
        }

        public function get length():int
        {
            if (this._playListEntries == null)
            {
                return 0;
            }
            return this._playListEntries.length;
        }

        public function get playPosition():int
        {
            return -1;
        }

        public function get nowPlayingSongId():int
        {
            return this._currentEntryId;
        }

        public function get isPlaying():Boolean
        {
            return this._isPlaying;
        }

        public function set playPosition(k:int):void
        {
        }

        public function dispose():void
        {
            var k:IMessageEvent;
            if (!this._disposed)
            {
                if (this._isPlaying)
                {
                    this._Str_8507();
                }
                this._soundManager = null;
                if (this._connection)
                {
                    for each (k in this._messageEvents)
                    {
                        this._connection.removeMessageEvent(k);
                        k.dispose();
                    }
                    this._messageEvents = null;
                    this._connection = null;
                }
                this._playListEntries = null;
                this._musicController = null;
                if (this._events)
                {
                    this._events.removeEventListener(SoundControllerEvent.TRAX_SONG_COMPLETE, this._Str_7805);
                    this._events = null;
                }
                if (this._roomEvents)
                {
                    this._roomEvents.removeEventListener(RoomObjectSoundMachineEvent.SOUND_MACHINE_SWITCHED_ON, this._Str_21084);
                    this._roomEvents.removeEventListener(RoomObjectSoundMachineEvent.SOUND_MACHINE_SWITCHED_OFF, this._Str_21376);
                    this._roomEvents = null;
                }
                this._disposed = true;
            }
        }

        private function _Str_21084(k:Event):void
        {
            this._Str_18932();
        }

        private function _Str_21376(k:Event):void
        {
            this._Str_8507();
        }

        public function _Str_18932():void
        {
            if (this._isPlaying)
            {
                return;
            }
            if (((this._playListEntries == null) || (this._playListEntries.length == 0)))
            {
                this.requestPlayList();
                this._isPlaying = true;
                return;
            }
            this._Str_8507();
            this._currentEntryId = -1;
            this._isPlaying = true;
            this.playNextSong();
        }

        public function _Str_24473(k:int):void
        {
            var _local_2:SongDataEntry;
            if (this._currentEntryId == k)
            {
                this.playCurrentSongAndNotify(this._currentEntryId);
                _local_2 = this.getNextEntry();
                if (_local_2 != null)
                {
                    this._musicController.addSongInfoRequest(_local_2.id);
                }
            }
        }

        public function _Str_8507():void
        {
            this._currentEntryId = -1;
            this._isPlaying = false;
            this._musicController.stop(HabboMusicPrioritiesEnum.PRIORITY_ROOM_PLAYLIST);
        }

        public function updateVolume(k:Number):void
        {
        }

        public function addItem(k:ISongInfo, _arg_2:int=0):int
        {
            return -1;
        }

        public function _Str_26405(k:int, _arg_2:int):void
        {
        }

        public function removeItem(k:int):void
        {
        }

        private function _Str_7805(k:SoundControllerEvent):void
        {
            if (k.id == this._currentEntryId)
            {
                this.playNextSong();
            }
        }

        private function onSongInfoReceivedEvent(k:SongInfoReceivedEvent):void
        {
            var _local_2:SongDataEntry;
            var _local_4:SongDataEntry;
            if (((this._playListEntries == null) || (this._playListEntries.length == 0)))
            {
                return;
            }
            var _local_3:int;
            while (_local_3 < this._playListEntries.length)
            {
                _local_2 = this._playListEntries[_local_3];
                if (_local_2.id == k.id)
                {
                    _local_4 = (this._musicController.getSongInfo(k.id) as SongDataEntry);
                    if (_local_4 != null)
                    {
                        this._playListEntries[_local_3] = _local_4;
                    }
                    return;
                }
                _local_3++;
            }
        }

        private function playNextSong():void
        {
            var k:SongDataEntry = this.getNextEntry();
            if (k != null)
            {
                this._currentEntryId = k.id;
                this.playCurrentSongAndNotify(this._currentEntryId);
            }
        }

        private function playCurrentSongAndNotify(k:int):void
        {
            var _local_2:SongDataEntry = (this.getEntryWithId(k) as SongDataEntry);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:Number = _local_2.startPlayHeadPos;
            _local_2.startPlayHeadPos = 0;
            if (this._musicController.playSong(k, HabboMusicPrioritiesEnum.PRIORITY_ROOM_PLAYLIST, _local_3, 0, 0, 0))
            {
                Logger.log(((("Trax song started by playlist: " + _local_2.name) + " by ") + _local_2.creator));
            }
        }

        private function getNextEntry():SongDataEntry
        {
            var _local_2:SongDataEntry;
            if (((this._playListEntries == null) || (this._playListEntries.length == 0)))
            {
                return null;
            }
            var k:int;
            var _local_3:int;
            while (_local_3 < this._playListEntries.length)
            {
                _local_2 = this._playListEntries[_local_3];
                if (_local_2.id == this._currentEntryId)
                {
                    k = (_local_3 + 1);
                }
                _local_3++;
            }
            if (k >= this._playListEntries.length)
            {
                k = 0;
            }
            _local_2 = this._playListEntries[k];
            return _local_2;
        }

        public function getEntry(k:int):ISongInfo
        {
            if ((((this._playListEntries == null) || (k < 0)) || (k >= this._playListEntries.length)))
            {
                return null;
            }
            return this._playListEntries[k];
        }

        public function getEntryWithId(k:int):ISongInfo
        {
            var _local_2:SongDataEntry;
            if (((this._playListEntries == null) || (this._playListEntries.length == 0)))
            {
                return null;
            }
            var _local_3:int;
            while (_local_3 < this._playListEntries.length)
            {
                _local_2 = this._playListEntries[_local_3];
                if (_local_2.id == k)
                {
                    return _local_2;
                }
                _local_3++;
            }
            return null;
        }

        public function requestPlayList():void
        {
            if (this._connection == null)
            {
                return;
            }
            this._connection.send(new GetSoundMachinePlayListMessageComposer());
        }

        private function convertParserPlayList(k:Array):Array
        {
            var _local_3:PlayListEntry;
            var _local_2:Array = new Array();
            for each (_local_3 in k)
            {
                _local_2.push(new SongDataEntry(_local_3.id, _local_3.length, _local_3.name, _local_3.creator, null));
            }
            return _local_2;
        }

        private function onPlayListMessage(k:IMessageEvent):void
        {
            var _local_6:SongDataEntry;
            var _local_8:int;
            var _local_2:PlayListMessageEvent = (k as PlayListMessageEvent);
            var _local_3:PlayListMessageParser = (_local_2.getParser() as PlayListMessageParser);
            var _local_4:int = _local_3._Str_23052;
            var _local_5:Array = this.convertParserPlayList(_local_3._Str_24122);
            if (((_local_5 == null) || (_local_5.length == 0)))
            {
                return;
            }
            this._playListEntries = _local_5;
            var _local_7:int;
            _local_8 = 0;
            while (_local_8 < _local_5.length)
            {
                _local_6 = this._playListEntries[_local_8];
                _local_7 = (_local_7 + _local_6.length);
                _local_8++;
            }
            if (_local_4 < 0)
            {
                _local_4 = 0;
            }
            _local_4 = (_local_4 % _local_7);
            _local_8 = 0;
            while (_local_8 < _local_5.length)
            {
                _local_6 = this._playListEntries[_local_8];
                if (_local_4 > _local_6.length)
                {
                    _local_4 = (_local_4 - _local_6.length);
                }
                else
                {
                    this._currentEntryId = _local_6.id;
                    _local_6.startPlayHeadPos = (Number(_local_4) / 1000);
                    break;
                }
                _local_8++;
            }
            this._events.dispatchEvent(new PlayListStatusEvent(PlayListStatusEvent.PLUE_PLAY_LIST_UPDATED));
            if (((!(_local_6 == null)) && (this._isPlaying)))
            {
                this.playCurrentSongAndNotify(_local_6.id);
            }
        }

        private function onPlayListSongAddedMessage(k:IMessageEvent):void
        {
            var _local_2:PlayListSongAddedMessageEvent = (k as PlayListSongAddedMessageEvent);
            var _local_3:PlayListSongAddedMessageParser = (_local_2.getParser() as PlayListSongAddedMessageParser);
            var _local_4:SongDataEntry = new SongDataEntry(_local_3.entry.id, _local_3.entry.length, _local_3.entry.name, _local_3.entry.creator, null);
            if (_local_4 == null)
            {
                return;
            }
            this._playListEntries.push(_local_4);
            this._events.dispatchEvent(new PlayListStatusEvent(PlayListStatusEvent.PLUE_PLAY_LIST_UPDATED));
            if (!this._isPlaying)
            {
                return;
            }
            if (this._playListEntries.length == 1)
            {
                this.playCurrentSongAndNotify(_local_4.id);
            }
            else
            {
                this._Str_24473(_local_4.id);
            }
        }
    }
}
