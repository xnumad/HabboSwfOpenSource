package com.sulake.habbo.sound.music
{
    import com.sulake.habbo.sound.IPlayListController;
    import com.sulake.habbo.sound.IHabboMusicController;
    import flash.events.IEventDispatcher;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.sound.HabboSoundManagerFlash10;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.sound.NowPlayingMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.sound.JukeboxSongDisksMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.sound.JukeboxPlayListFullMessageEvent;
    import com.sulake.habbo.sound.events.SoundControllerEvent;
    import com.sulake.habbo.sound.events.SongInfoReceivedEvent;
    import com.sulake.habbo.sound.HabboMusicPrioritiesEnum;
    import com.sulake.habbo.communication.messages.outgoing.sound.GetJukeboxPlayListMessageComposer;
    import com.sulake.habbo.sound.ISongInfo;
    import com.sulake.habbo.communication.messages.parser.sound.NowPlayingMessageParser;
    import com.sulake.habbo.sound.events.NowPlayingEvent;
    import com.sulake.habbo.communication.messages.parser.sound.JukeboxSongDisksMessageParser;
    import com.sulake.habbo.sound.events.PlayListStatusEvent;

    public class JukeboxPlayListController implements IPlayListController 
    {
        private var _disposed:Boolean = false;
        private var _isPlaying:Boolean = false;
        private var _entries:Array;
        private var _musicController:IHabboMusicController;
        private var _events:IEventDispatcher;
        private var _connection:IConnection;
        private var _soundManager:HabboSoundManagerFlash10;
        private var _currentEntryId:int = -1;
        private var _missingSongInfo:Array;
        private var _messageEvents:Array;
        private var _playPosition:int = -1;

        public function JukeboxPlayListController(k:HabboSoundManagerFlash10, _arg_2:HabboMusicController, _arg_3:IEventDispatcher, _arg_4:IConnection)
        {
            var _local_5:IMessageEvent;
            this._entries = new Array();
            this._missingSongInfo = new Array();
            super();
            this._soundManager = k;
            this._musicController = _arg_2;
            this._events = _arg_3;
            this._connection = _arg_4;
            this._messageEvents = [];
            this._messageEvents.push(new NowPlayingMessageEvent(this._Str_25253));
            this._messageEvents.push(new JukeboxSongDisksMessageEvent(this._Str_24814));
            this._messageEvents.push(new JukeboxPlayListFullMessageEvent(this._Str_22626));
            for each (_local_5 in this._messageEvents)
            {
                this._connection.addMessageEvent(_local_5);
            }
            this._events.addEventListener(SoundControllerEvent.TRAX_SONG_COMPLETE, this.onSongFinishedPlayingEvent);
            this._musicController.events.addEventListener(SongInfoReceivedEvent.SIR_TRAX_SONG_INFO_RECEIVED, this.onSongInfoReceivedEvent);
        }

        public function get priority():int
        {
            return HabboMusicPrioritiesEnum.PRIORITY_ROOM_PLAYLIST;
        }

        public function get nowPlayingSongId():int
        {
            return this._currentEntryId;
        }

        public function get playPosition():int
        {
            return this._playPosition;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get isPlaying():Boolean
        {
            return this._isPlaying;
        }

        public function get length():int
        {
            if (this._entries == null)
            {
                return 0;
            }
            return this._entries.length;
        }

        public function dispose():void
        {
            var k:IMessageEvent;
            if (!this._disposed)
            {
                this.stopPlaying();
                if (this._musicController.events)
                {
                    this._musicController.events.removeEventListener(SongInfoReceivedEvent.SIR_TRAX_SONG_INFO_RECEIVED, this.onSongInfoReceivedEvent);
                }
                this._musicController = null;
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
                if (this._events)
                {
                    this._events.removeEventListener(SoundControllerEvent.TRAX_SONG_COMPLETE, this.onSongFinishedPlayingEvent);
                    this._events = null;
                }
                this._disposed = true;
            }
        }

        public function stopPlaying():void
        {
            this._musicController.stop(this.priority);
            this._currentEntryId = -1;
            this._playPosition = -1;
            this._isPlaying = false;
        }

        public function requestPlayList():void
        {
            if (this._connection == null)
            {
                return;
            }
            this._connection.send(new GetJukeboxPlayListMessageComposer());
        }

        public function getEntry(k:int):ISongInfo
        {
            if (((k < 0) || (k >= this._entries.length)))
            {
                return null;
            }
            return this._entries[k];
        }

        protected function onSongFinishedPlayingEvent(k:SoundControllerEvent):void
        {
        }

        private function _Str_25253(k:IMessageEvent):void
        {
            var _local_2:NowPlayingMessageEvent = (k as NowPlayingMessageEvent);
            var _local_3:NowPlayingMessageParser = (_local_2.getParser() as NowPlayingMessageParser);
            Logger.log(((((("Received Now Playing message with: " + _local_3.currentSongId) + ", ") + _local_3.nextSongId) + ", ") + _local_3.syncCount));
            this._isPlaying = (!(_local_3.currentSongId == -1));
            if (_local_3.currentSongId >= 0)
            {
                this._musicController.playSong(_local_3.currentSongId, HabboMusicPrioritiesEnum.PRIORITY_ROOM_PLAYLIST, (_local_3.syncCount / 1000), 0, 1, 1);
                this._currentEntryId = _local_3.currentSongId;
            }
            else
            {
                this.stopPlaying();
            }
            if (_local_3.nextSongId >= 0)
            {
                this._musicController.addSongInfoRequest(_local_3.nextSongId);
            }
            this._playPosition = _local_3.currentPosition;
            this._soundManager.events.dispatchEvent(new NowPlayingEvent(NowPlayingEvent.NPE_SONG_CHANGED, HabboMusicPrioritiesEnum.PRIORITY_ROOM_PLAYLIST, _local_3.currentSongId, _local_3.currentPosition));
        }

        private function _Str_24814(k:IMessageEvent):void
        {
            var _local_5:int;
            var _local_6:int;
            var _local_7:SongDataEntry;
            var _local_2:JukeboxSongDisksMessageEvent = (k as JukeboxSongDisksMessageEvent);
            var _local_3:JukeboxSongDisksMessageParser = (_local_2.getParser() as JukeboxSongDisksMessageParser);
            Logger.log(("Received Jukebox song disks (=playlist) message, length of playlist: " + _local_3._Str_14484.length));
            this._entries = new Array();
            var _local_4:int;
            while (_local_4 < _local_3._Str_14484.length)
            {
                _local_5 = _local_3._Str_14484.getWithIndex(_local_4);
                _local_6 = _local_3._Str_14484.getKey(_local_4);
                _local_7 = (this._musicController.getSongInfo(_local_5) as SongDataEntry);
                if (_local_7 == null)
                {
                    _local_7 = new SongDataEntry(_local_5, -1, null, null, null);
                    if (this._missingSongInfo.indexOf(_local_5) < 0)
                    {
                        this._missingSongInfo.push(_local_5);
                        this._musicController.requestSongInfoWithoutSamples(_local_5);
                    }
                }
                _local_7._Str_5848 = _local_6;
                this._entries.push(_local_7);
                _local_4++;
            }
            if (this._missingSongInfo.length == 0)
            {
                this._events.dispatchEvent(new PlayListStatusEvent(PlayListStatusEvent.PLUE_PLAY_LIST_UPDATED));
            }
        }

        private function _Str_22626(k:IMessageEvent):void
        {
            Logger.log("Received jukebox playlist full message.");
            this._events.dispatchEvent(new PlayListStatusEvent(PlayListStatusEvent.PLUE_PLAY_LIST_FULL));
        }

        private function onSongInfoReceivedEvent(k:SongInfoReceivedEvent):void
        {
            var _local_4:ISongInfo;
            var _local_5:int;
            var _local_6:SongDataEntry;
            var _local_2:int;
            while (_local_2 < this.length)
            {
                _local_4 = this._entries[_local_2];
                if (_local_4.id == k.id)
                {
                    _local_5 = _local_4._Str_5848;
                    _local_6 = (this._musicController.getSongInfo(k.id) as SongDataEntry);
                    if (_local_6 != null)
                    {
                        _local_6._Str_5848 = _local_5;
                        this._entries[_local_2] = _local_6;
                    }
                    break;
                }
                _local_2++;
            }
            var _local_3:int = this._missingSongInfo.indexOf(k.id);
            if (_local_3 >= 0)
            {
                this._missingSongInfo.splice(_local_3, 1);
            }
            if (this._missingSongInfo.length == 0)
            {
                this._events.dispatchEvent(new PlayListStatusEvent(PlayListStatusEvent.PLUE_PLAY_LIST_UPDATED));
            }
        }
    }
}

