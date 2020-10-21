package com.sulake.habbo.sound.music
{
    import com.sulake.habbo.sound.IHabboMusicController;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.sound.HabboMusicPrioritiesEnum;
    import com.sulake.habbo.sound.HabboSoundManagerFlash10;
    import com.sulake.core.communication.connection.IConnection;
    import flash.events.IEventDispatcher;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.sound.IPlayListController;
    import flash.utils.Timer;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.sound.TraxSongInfoMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.sound.UserSongDisksInventoryMessageEvent;
    import com.sulake.habbo.room.events.RoomObjectSoundMachineEvent;
    import flash.events.TimerEvent;
    import com.sulake.habbo.sound.events.SoundControllerEvent;
    import com.sulake.habbo.sound.events.NowPlayingEvent;
    import com.sulake.habbo.sound.IHabboSound;
    import com.sulake.habbo.sound.ISongInfo;
    import com.sulake.habbo.communication.messages.outgoing.sound.GetUserSongDisksMessageComposer;
    import com.sulake.habbo.sound.trax.TraxSequencer;
    import com.sulake.habbo.communication.messages.outgoing.sound.GetSongInfoMessageComposer;
    import com.sulake.habbo.communication.messages.incoming.sound.SongInfoEntry;
    import com.sulake.habbo.communication.messages.parser.sound.TraxSongInfoMessageParser;
    import com.sulake.habbo.sound.events.SongInfoReceivedEvent;
    import com.sulake.habbo.sound.events.SongDiskInventoryReceivedEvent;
    import flash.utils.getTimer;
    import com.sulake.habbo.communication.messages.parser.sound.UserSongDisksInventoryMessageParser;
    import flash.events.Event;
    import com.sulake.habbo.communication.messages.outgoing.sound.GetNowPlayingMessageComposer;
    import com.sulake.habbo.sound.*;

    public class HabboMusicController implements IHabboMusicController, IDisposable 
    {
        public static const SKIP_POSITION_SET:int = -1;
        private static const MAXIMUM_NOTIFY_PRIORITY:int = HabboMusicPrioritiesEnum.PRIORITY_ROOM_PLAYLIST;//0

        private var _soundManager:HabboSoundManagerFlash10;
        private var _connection:IConnection;
        private var _events:IEventDispatcher;
        private var _roomEvents:IEventDispatcher;
        private var _availableSongs:Map;
        private var _requestedSongs:Map;
        private var _songRequestList:Array;
        private var _roomItemPlaylist:IPlayListController = null;
        private var _disposed:Boolean = false;
        private var _songRequestsPerPriority:Array;
        private var _songRequestCountsPerPriority:Array;
        private var _priorityPlaying:int = -1;
        private var _songIdPlaying:int = -1;
        private var _requestNumberPlaying:int = -1;
        private var _songRequestTimer:Timer;
        private var _songDiskInventory:Map;
        private var _diskInventoryMissingData:Array;
        private var _messageEvents:Array;
        private var _previousNotifiedSongId:int = -1;
        private var _previousNotificationTime:int = -1;

        public function HabboMusicController(k:HabboSoundManagerFlash10, _arg_2:IEventDispatcher, _arg_3:IEventDispatcher, _arg_4:IConnection)
        {
            var _local_5:IMessageEvent;
            var _local_6:int;
            this._availableSongs = new Map();
            this._requestedSongs = new Map();
            this._songRequestList = new Array();
            this._songRequestsPerPriority = [];
            this._songRequestCountsPerPriority = [];
            this._songDiskInventory = new Map();
            this._diskInventoryMissingData = new Array();
            this._messageEvents = [];
            super();
            this._soundManager = k;
            this._events = _arg_2;
            this._roomEvents = _arg_3;
            this._connection = _arg_4;
            this._messageEvents.push(new TraxSongInfoMessageEvent(this.onSongInfoMessage));
            this._messageEvents.push(new UserSongDisksInventoryMessageEvent(this.onSongDiskInventoryMessage));
            for each (_local_5 in this._messageEvents)
            {
                this._connection.addMessageEvent(_local_5);
            }
            this._roomEvents.addEventListener(RoomObjectSoundMachineEvent.JUKEBOX_INIT, this.onJukeboxInit);
            this._roomEvents.addEventListener(RoomObjectSoundMachineEvent.JUKEBOX_DISPOSE, this.onJukeboxDispose);
            this._roomEvents.addEventListener(RoomObjectSoundMachineEvent.SOUND_MACHINE_INIT, this.onSoundMachineInit);
            this._roomEvents.addEventListener(RoomObjectSoundMachineEvent.SOUND_MACHINE_DISPOSE, this.onSoundMachineDispose);
            this._songRequestTimer = new Timer(1000);
            this._songRequestTimer.start();
            this._songRequestTimer.addEventListener(TimerEvent.TIMER, this.onTimerEvent);
            this._events.addEventListener(SoundControllerEvent.TRAX_SONG_COMPLETE, this.onTraxSongComplete);
            _local_6 = 0;
            while (_local_6 < HabboMusicPrioritiesEnum.PRIORITY_COUNT)
            {
                this._songRequestsPerPriority[_local_6] = null;
                this._songRequestCountsPerPriority[_local_6] = 0;
                _local_6++;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get events():IEventDispatcher
        {
            return this._events;
        }

        protected function onTraxSongComplete(k:SoundControllerEvent):void
        {
            var _local_2:int;
            Logger.log((("Song " + k.id) + " finished playing"));
            if (this.getSongIdPlayingAtPriority(this._priorityPlaying) == k.id)
            {
                if (((this.getTopRequestPriority() == this._priorityPlaying) && (this.getSongRequestCountAtPriority(this._priorityPlaying) == this._requestNumberPlaying)))
                {
                    this.resetSongStartRequest(this._priorityPlaying);
                }
                _local_2 = this._priorityPlaying;
                this.playSongWithHighestPriority();
                if (_local_2 >= HabboMusicPrioritiesEnum.PRIORITY_SONG_PLAY)
                {
                    this._events.dispatchEvent(new NowPlayingEvent(NowPlayingEvent.NPW_USER_STOP_SONG, _local_2, k.id, -1));
                }
            }
        }

        public function dispose():void
        {
            var k:IMessageEvent;
            var _local_2:int;
            var _local_3:SongDataEntry;
            var _local_4:IHabboSound;
            if (!this._disposed)
            {
                this._soundManager = null;
                this._songRequestList = null;
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
                if (this._roomItemPlaylist)
                {
                    this._roomItemPlaylist.dispose();
                    this._roomItemPlaylist = null;
                }
                if (this._availableSongs)
                {
                    _local_2 = 0;
                    while (_local_2 < this._availableSongs.length)
                    {
                        _local_3 = (this._availableSongs.getWithIndex(_local_2) as SongDataEntry);
                        _local_4 = (_local_3.soundObject as IHabboSound);
                        if (_local_4 != null)
                        {
                            _local_4.stop();
                        }
                        _local_3.soundObject = null;
                        _local_2++;
                    }
                    this._availableSongs.dispose();
                    this._availableSongs = null;
                }
                if (this._requestedSongs != null)
                {
                    this._requestedSongs.dispose();
                    this._requestedSongs = null;
                }
                this._songRequestTimer.stop();
                this._songRequestTimer = null;
                if (this._roomEvents)
                {
                    this._roomEvents.removeEventListener(RoomObjectSoundMachineEvent.JUKEBOX_INIT, this.onJukeboxInit);
                    this._roomEvents.removeEventListener(RoomObjectSoundMachineEvent.JUKEBOX_DISPOSE, this.onJukeboxDispose);
                    this._roomEvents.removeEventListener(RoomObjectSoundMachineEvent.SOUND_MACHINE_INIT, this.onSoundMachineInit);
                    this._roomEvents.removeEventListener(RoomObjectSoundMachineEvent.SOUND_MACHINE_DISPOSE, this.onSoundMachineDispose);
                }
                if (this._songDiskInventory != null)
                {
                    this._songDiskInventory.dispose();
                    this._songDiskInventory = null;
                }
                this._disposed = true;
            }
        }

        public function getRoomItemPlaylist(k:int=-1):IPlayListController
        {
            return this._roomItemPlaylist;
        }

        private function addSongStartRequest(k:int, _arg_2:int, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Number):Boolean
        {
            if (((k < 0) || (k >= HabboMusicPrioritiesEnum.PRIORITY_COUNT)))
            {
                return false;
            }
            var _local_7:SongStartRequestData = new SongStartRequestData(_arg_2, _arg_3, _arg_4, _arg_5, _arg_6);
            this._songRequestsPerPriority[k] = _local_7;
            this._songRequestCountsPerPriority[k] = (this._songRequestCountsPerPriority[k] + 1);
            return true;
        }

        private function getSongStartRequest(k:int):SongStartRequestData
        {
            return this._songRequestsPerPriority[k];
        }

        private function getSongIdRequestedAtPriority(k:int):int
        {
            if (((k < 0) || (k >= HabboMusicPrioritiesEnum.PRIORITY_COUNT)))
            {
                return -1;
            }
            if (this._songRequestsPerPriority[k] == null)
            {
                return -1;
            }
            var _local_2:SongStartRequestData = this._songRequestsPerPriority[k];
            return _local_2.songId;
        }

        private function getSongRequestCountAtPriority(k:int):int
        {
            if (((k < 0) || (k >= HabboMusicPrioritiesEnum.PRIORITY_COUNT)))
            {
                return -1;
            }
            return this._songRequestCountsPerPriority[k];
        }

        private function getTopRequestPriority():int
        {
            var k:int = (this._songRequestsPerPriority.length - 1);
            while (k >= 0)
            {
                if (this._songRequestsPerPriority[k] != null)
                {
                    return k;
                }
                k--;
            }
            return -1;
        }

        private function resetSongStartRequest(k:int):void
        {
            if (((k >= 0) && (k < HabboMusicPrioritiesEnum.PRIORITY_COUNT)))
            {
                this._songRequestsPerPriority[k] = null;
            }
        }

        private function reRequestSongAtPriority(k:int):void
        {
            this._songRequestCountsPerPriority[k] = (this._songRequestCountsPerPriority[k] + 1);
        }

        private function processSongEntryForPlaying(k:int, _arg_2:Boolean=true):Boolean
        {
            var _local_3:SongDataEntry = this.getSongDataEntry(k);
            if (_local_3 == null)
            {
                this.addSongInfoRequest(k);
                return false;
            }
            if (_local_3.soundObject == null)
            {
                _local_3.soundObject = this._soundManager.loadTraxSong(_local_3.id, _local_3.songData);
            }
            var _local_4:IHabboSound = _local_3.soundObject;
            if (!_local_4.ready)
            {
                return false;
            }
            return true;
        }

        public function playSong(k:int, _arg_2:int, _arg_3:Number=0, _arg_4:Number=0, _arg_5:Number=0.5, _arg_6:Number=0.5):Boolean
        {
            Logger.log((("Requesting " + k) + " for playing"));
            if (!this.addSongStartRequest(_arg_2, k, _arg_3, _arg_4, _arg_5, _arg_6))
            {
                return false;
            }
            if (!this.processSongEntryForPlaying(k))
            {
                return false;
            }
            if (_arg_2 >= this._priorityPlaying)
            {
                this.playSongObject(_arg_2, k);
            }
            else
            {
                Logger.log(((("Higher priority song blocked playing. Stored song " + k) + " for priority ") + _arg_2));
            }
            return true;
        }

        private function playSongWithHighestPriority():void
        {
            var _local_3:int;
            this._priorityPlaying = -1;
            this._songIdPlaying = -1;
            this._requestNumberPlaying = -1;
            var k:int = this.getTopRequestPriority();
            var _local_2:int = k;
            while (_local_2 >= 0)
            {
                _local_3 = this.getSongIdRequestedAtPriority(_local_2);
                if (((_local_3 >= 0) && (this.playSongObject(_local_2, _local_3))))
                {
                    return;
                }
                _local_2--;
            }
        }

        public function stop(k:int):void
        {
            var _local_2:* = (k == this._priorityPlaying);
            var _local_3:* = (this.getTopRequestPriority() == k);
            if (_local_2)
            {
                this.resetSongStartRequest(k);
                this.stopSongAtPriority(k);
            }
            else
            {
                this.resetSongStartRequest(k);
                if (_local_3)
                {
                    this.reRequestSongAtPriority(this._priorityPlaying);
                }
            }
        }

        private function stopSongAtPriority(k:int):Boolean
        {
            var _local_2:int;
            var _local_3:SongDataEntry;
            if (((k == this._priorityPlaying) && (this._priorityPlaying >= 0)))
            {
                _local_2 = this.getSongIdPlayingAtPriority(k);
                if (_local_2 >= 0)
                {
                    _local_3 = this.getSongDataEntry(_local_2);
                    this.stopSongDataEntry(_local_3);
                    return true;
                }
            }
            return false;
        }

        private function stopSongDataEntry(k:SongDataEntry):void
        {
            var _local_2:IHabboSound;
            if (k != null)
            {
                Logger.log(("Stopping current song " + k.id));
                _local_2 = k.soundObject;
                if (_local_2 != null)
                {
                    _local_2.stop();
                }
            }
        }

        private function getSongDataEntry(k:int):SongDataEntry
        {
            var _local_2:SongDataEntry;
            if (this._availableSongs != null)
            {
                _local_2 = (this._availableSongs.getValue(k) as SongDataEntry);
            }
            return _local_2;
        }

        public function updateVolume(k:Number):void
        {
            var _local_3:int;
            var _local_4:SongDataEntry;
            var _local_2:int;
            while (_local_2 < HabboMusicPrioritiesEnum.PRIORITY_COUNT)
            {
                _local_3 = this.getSongIdPlayingAtPriority(_local_2);
                if (_local_3 >= 0)
                {
                    _local_4 = (this.getSongDataEntry(_local_3) as SongDataEntry);
                    if (((!(_local_4 == null)) && (!(_local_4.soundObject == null))))
                    {
                        _local_4.soundObject.volume = k;
                    }
                }
                _local_2++;
            }
        }

        public function onSongLoaded(k:int):void
        {
            var _local_3:int;
            Logger.log(("Song loaded : " + k));
            var _local_2:int = this.getTopRequestPriority();
            if (_local_2 >= 0)
            {
                _local_3 = this.getSongIdRequestedAtPriority(_local_2);
                if (k == _local_3)
                {
                    this.playSongObject(_local_2, k);
                }
            }
        }

        public function addSongInfoRequest(k:int):void
        {
            this.requestSong(k, true);
        }

        public function requestSongInfoWithoutSamples(k:int):void
        {
            this.requestSong(k, false);
        }

        private function requestSong(k:int, _arg_2:Boolean):void
        {
            if (this._requestedSongs.getValue(k) == null)
            {
                this._requestedSongs.add(k, _arg_2);
                this._songRequestList.push(k);
            }
        }

        public function getSongInfo(k:int):ISongInfo
        {
            var _local_2:SongDataEntry = this.getSongDataEntry(k);
            if (_local_2 == null)
            {
                this.requestSongInfoWithoutSamples(k);
            }
            return _local_2;
        }

        public function requestUserSongDisks():void
        {
            if (this._connection == null)
            {
                return;
            }
            this._connection.send(new GetUserSongDisksMessageComposer());
        }

        public function getSongDiskInventorySize():int
        {
            return this._songDiskInventory.length;
        }

        public function getSongDiskInventoryDiskId(k:int):int
        {
            if (((k >= 0) && (k < this._songDiskInventory.length)))
            {
                return this._songDiskInventory.getKey(k);
            }
            return -1;
        }

        public function getSongDiskInventorySongId(k:int):int
        {
            if (((k >= 0) && (k < this._songDiskInventory.length)))
            {
                return this._songDiskInventory.getWithIndex(k);
            }
            return -1;
        }

        public function getSongIdPlayingAtPriority(k:int):int
        {
            if (k != this._priorityPlaying)
            {
                return -1;
            }
            return this._songIdPlaying;
        }

        public function samplesUnloaded(k:Array):void
        {
            var _local_3:SongDataEntry;
            var _local_4:TraxSequencer;
            var _local_5:Array;
            var _local_6:int;
            var _local_2:int;
            while (_local_2 < this._availableSongs.length)
            {
                _local_3 = (this._availableSongs.getWithIndex(_local_2) as SongDataEntry);
                _local_4 = (_local_3.soundObject as TraxSequencer);
                if ((((!(_local_3.id == this._songIdPlaying)) && (!(_local_4 == null))) && (_local_4.ready)))
                {
                    _local_5 = _local_4._Str_17466.getSampleIds();
                    _local_6 = 0;
                    while (_local_6 < k.length)
                    {
                        if (_local_5.indexOf(k[_local_6]) != -1)
                        {
                            _local_3.soundObject = null;
                            _local_4.dispose();
                            Logger.log(((("Unloaded " + _local_3.name) + " by ") + _local_3.creator));
                        }
                        _local_6++;
                    }
                }
                _local_2++;
            }
        }

        public function get samplesIdsInUse():Array
        {
            var _local_3:SongStartRequestData;
            var _local_4:SongDataEntry;
            var _local_5:TraxSequencer;
            var k:Array = [];
            var _local_2:int;
            while (_local_2 < this._songRequestsPerPriority.length)
            {
                if (this._songRequestsPerPriority[_local_2] != null)
                {
                    _local_3 = this._songRequestsPerPriority[_local_2];
                    _local_4 = this._availableSongs.getValue(_local_3.songId);
                    if (_local_4 != null)
                    {
                        _local_5 = (_local_4.soundObject as TraxSequencer);
                        if (_local_5 != null)
                        {
                            k = k.concat(_local_5._Str_17466.getSampleIds());
                        }
                    }
                }
                _local_2++;
            }
            return k;
        }

        private function onTimerEvent(k:TimerEvent):void
        {
            if (this._songRequestList.length < 1)
            {
                return;
            }
            if (this._connection == null)
            {
                return;
            }
            this._connection.send(new GetSongInfoMessageComposer(this._songRequestList));
            Logger.log(("Requested song info's : " + this._songRequestList));
            this._songRequestList = new Array();
        }

        private function onSongInfoMessage(k:IMessageEvent):void
        {
            var _local_6:SongInfoEntry;
            var _local_7:Boolean;
            var _local_8:Boolean;
            var _local_9:IHabboSound;
            var _local_10:SongDataEntry;
            var _local_11:int;
            var _local_12:int;
            var _local_2:TraxSongInfoMessageEvent = (k as TraxSongInfoMessageEvent);
            var _local_3:TraxSongInfoMessageParser = (_local_2.getParser() as TraxSongInfoMessageParser);
            var _local_4:Array = _local_3.songs;
            var _local_5:int;
            while (_local_5 < _local_4.length)
            {
                _local_6 = _local_4[_local_5];
                _local_7 = (this.getSongDataEntry(_local_6.id) == null);
                _local_8 = this.areSamplesRequested(_local_6.id);
                if (_local_7)
                {
                    _local_9 = null;
                    if (_local_8)
                    {
                        _local_9 = this._soundManager.loadTraxSong(_local_6.id, _local_6.data);
                    }
                    _local_10 = new SongDataEntry(_local_6.id, _local_6.length, _local_6.name, _local_6.creator, _local_9);
                    _local_10.songData = _local_6.data;
                    this._availableSongs.add(_local_6.id, _local_10);
                    _local_11 = this.getTopRequestPriority();
                    _local_12 = this.getSongIdRequestedAtPriority(_local_11);
                    if ((((!(_local_9 == null)) && (_local_9.ready)) && (_local_6.id == _local_12)))
                    {
                        this.playSongObject(_local_11, _local_12);
                    }
                    this._events.dispatchEvent(new SongInfoReceivedEvent(SongInfoReceivedEvent.SIR_TRAX_SONG_INFO_RECEIVED, _local_6.id));
                    while (this._diskInventoryMissingData.indexOf(_local_6.id) != -1)
                    {
                        this._diskInventoryMissingData.splice(this._diskInventoryMissingData.indexOf(_local_6.id), 1);
                        if (this._diskInventoryMissingData.length == 0)
                        {
                            this._events.dispatchEvent(new SongDiskInventoryReceivedEvent(SongDiskInventoryReceivedEvent.SDIR_SONG_DISK_INVENTORY_RECEIVENT_EVENT));
                        }
                    }
                    Logger.log(("Received song info : " + _local_6.id));
                }
                _local_5++;
            }
        }

        private function playSongObject(k:int, _arg_2:int):Boolean
        {
            if ((((_arg_2 == -1) || (k < 0)) || (k >= HabboMusicPrioritiesEnum.PRIORITY_COUNT)))
            {
                return false;
            }
            var _local_3:Boolean;
            if (this.stopSongAtPriority(this._priorityPlaying))
            {
                _local_3 = true;
            }
            var _local_4:SongDataEntry = this.getSongDataEntry(_arg_2);
            if (_local_4 == null)
            {
                Logger.log((("WARNING: Unable to find song entry id " + _arg_2) + " that was supposed to be loaded."));
                return false;
            }
            var _local_5:IHabboSound = _local_4.soundObject;
            if (((_local_5 == null) || (!(_local_5.ready))))
            {
                return false;
            }
            if (_local_3)
            {
                Logger.log(("Waiting previous song to stop before playing song " + _arg_2));
                return true;
            }
            _local_5.volume = this._soundManager.traxVolume;
            var _local_6:Number = SKIP_POSITION_SET;
            var _local_7:Number = 0;
            var _local_8:Number = 2;
            var _local_9:Number = 1;
            var _local_10:SongStartRequestData = this.getSongStartRequest(k);
            if (_local_10 != null)
            {
                _local_6 = _local_10.startPos;
                _local_7 = _local_10.playLength;
                _local_8 = _local_10.fadeInSeconds;
                _local_9 = _local_10.fadeOutSeconds;
            }
            if (_local_6 >= (_local_4.length / 1000))
            {
                return false;
            }
            if (_local_6 == SKIP_POSITION_SET)
            {
                _local_6 = 0;
            }
            _local_5.fadeInSeconds = _local_8;
            _local_5.fadeOutSeconds = _local_9;
            _local_5.position = _local_6;
            _local_5.play(_local_7);
            this._priorityPlaying = k;
            this._requestNumberPlaying = this.getSongRequestCountAtPriority(k);
            this._songIdPlaying = _arg_2;
            if (this._priorityPlaying <= MAXIMUM_NOTIFY_PRIORITY)
            {
                this.notifySongPlaying(_local_4);
            }
            if (k > HabboMusicPrioritiesEnum.PRIORITY_ROOM_PLAYLIST)
            {
                this._events.dispatchEvent(new NowPlayingEvent(NowPlayingEvent.NPE_USER_PLAY_SONG, k, _local_4.id, -1));
            }
            Logger.log(((((((((("Started playing song " + _arg_2) + " at position ") + _local_6) + " for ") + _local_7) + " seconds (length ") + (_local_4.length / 1000)) + ") with priority ") + k));
            return true;
        }

        private function notifySongPlaying(k:SongDataEntry):void
        {
            var _local_2:* = 8000;
            var _local_3:int = getTimer();
            if (((k.length >= _local_2) && ((!(this._previousNotifiedSongId == k.id)) || (_local_3 > (this._previousNotificationTime + _local_2)))))
            {
                this._soundManager._Str_22895(k.name, k.creator);
                this._previousNotifiedSongId = k.id;
                this._previousNotificationTime = _local_3;
            }
        }

        private function areSamplesRequested(k:int):Boolean
        {
            if (this._requestedSongs.getValue(k) == null)
            {
                return false;
            }
            return this._requestedSongs.getValue(k);
        }

        private function onSongDiskInventoryMessage(k:IMessageEvent):void
        {
            var _local_5:int;
            var _local_6:int;
            var _local_2:UserSongDisksInventoryMessageEvent = (k as UserSongDisksInventoryMessageEvent);
            var _local_3:UserSongDisksInventoryMessageParser = (_local_2.getParser() as UserSongDisksInventoryMessageParser);
            this._songDiskInventory.reset();
            var _local_4:int;
            while (_local_4 < _local_3._Str_22284)
            {
                _local_5 = _local_3._Str_23874(_local_4);
                _local_6 = _local_3._Str_24056(_local_4);
                this._songDiskInventory.add(_local_5, _local_6);
                if (this._availableSongs.getValue(_local_6) == null)
                {
                    this._diskInventoryMissingData.push(_local_6);
                    this.requestSongInfoWithoutSamples(_local_6);
                }
                _local_4++;
            }
            if (this._diskInventoryMissingData.length == 0)
            {
                this._events.dispatchEvent(new SongDiskInventoryReceivedEvent(SongDiskInventoryReceivedEvent.SDIR_SONG_DISK_INVENTORY_RECEIVENT_EVENT));
            }
        }

        private function onSoundMachineInit(k:Event):void
        {
            this.disposeRoomPlaylist();
            this._roomItemPlaylist = (new SoundMachinePlayListController(this._soundManager, this, this._events, this._roomEvents, this._connection) as IPlayListController);
        }

        private function onSoundMachineDispose(k:Event):void
        {
            this.disposeRoomPlaylist();
        }

        private function onJukeboxInit(k:Event):void
        {
            this.disposeRoomPlaylist();
            this._roomItemPlaylist = (new JukeboxPlayListController(this._soundManager, this, this._events, this._connection) as IPlayListController);
            this._connection.send(new GetNowPlayingMessageComposer());
        }

        private function onJukeboxDispose(k:Event):void
        {
            this.disposeRoomPlaylist();
        }

        private function disposeRoomPlaylist():void
        {
            if (this._roomItemPlaylist != null)
            {
                this._roomItemPlaylist.dispose();
                this._roomItemPlaylist = null;
            }
        }
    }
}
