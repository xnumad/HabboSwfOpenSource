package com.sulake.habbo.sound
{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.notifications.IHabboNotifications;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.sound.trax.TraxSequencer;
    import com.sulake.habbo.sound.music.TraxSampleManager;
    import com.sulake.habbo.sound.furni.FurniSamplePlaybackManager;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDRoomEngine;
    import com.sulake.iid.IIDHabboNotifications;
    import com.sulake.habbo.sound.events.TraxSongLoadEvent;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.room.events.RoomEnginePlaySoundEvent;
    import flash.media.Sound;
    import com.sulake.core.assets.IAsset;
    import com.sulake.habbo.sound.trax.TraxData;
    import com.sulake.core.runtime.IID;
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.habbo.sound.music.HabboMusicController;
    import com.sulake.habbo.communication.messages.incoming._Str_470._Str_3870;
    import com.sulake.habbo.communication.messages.outgoing._Str_341._Str_10678;
    import flash.events.Event;
    import com.sulake.habbo.communication.messages.outgoing._Str_370._Str_11698;
    import com.sulake.habbo.communication.messages.parser._Str_505._Str_5515;
    import com.sulake.core.communication.messages.IMessageEvent;

    public class HabboSoundManagerFlash10 extends Component implements IHabboSoundManager, IUpdateReceiver 
    {
        private var _communication:IHabboCommunicationManager;
        private var _connection:IConnection;
        private var _roomEngine:IRoomEngine;
        private var _notifications:IHabboNotifications;
        private var _genericVolume:Number = 1;
        private var _traxVolume:Number = 1;
        private var _furniVolume:Number = 1;
        private var _genericSamples:Map;
        private var _loadingSongId:int = -1;
        private var _loadingSong:TraxSequencer;
        private var _musicController:IHabboMusicController;
        private var _traxSampleManager:TraxSampleManager;
        private var _onDemandSamplePlaybackManager:FurniSamplePlaybackManager;
        private var _loadingSongQueue:Map;
        private var _muted:Boolean = false;

        public function HabboSoundManagerFlash10(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null, _arg_4:Boolean=true)
        {
            this._genericSamples = new Map();
            this._loadingSongQueue = new Map();
            super(k, _arg_2, _arg_3);
            if (_arg_4)
            {
                queueInterface(new IIDHabboCommunicationManager(), this._Str_25566);
                queueInterface(new IIDRoomEngine(), this.onRoomEngineReady);
                queueInterface(new IIDHabboNotifications(), this._Str_16511);
            }
            events.addEventListener(TraxSongLoadEvent.TSLE_TRAX_LOAD_COMPLETE, this._Str_23582);
            registerUpdateReceiver(this, 1);
            Logger.log("Sound manager 10 init");
        }

        public function get _Str_2774():IHabboMusicController
        {
            return this._musicController;
        }

        public function get _Str_3960():Number
        {
            return this._genericVolume;
        }

        public function set _Str_3960(k:Number):void
        {
            this._Str_9171(k, this._furniVolume, this._traxVolume);
            this._Str_16207();
        }

        public function get _Str_3410():Number
        {
            return this._traxVolume;
        }

        public function set _Str_3410(k:Number):void
        {
            this._Str_9171(this._genericVolume, this._furniVolume, k);
            this._Str_16207();
        }

        public function get _Str_3488():Number
        {
            return this._furniVolume;
        }

        public function set _Str_3488(k:Number):void
        {
            this._Str_9171(this._genericVolume, k, this._traxVolume);
            this._Str_16207();
        }

        public function _Str_15711(k:Number, _arg_2:Number, _arg_3:Number):void
        {
            this._Str_9171(k, _arg_2, _arg_3);
        }

        override public function dispose():void
        {
            this._connection = null;
            if (this._musicController)
            {
                this._musicController.dispose();
                this._musicController = null;
            }
            if (this._traxSampleManager)
            {
                this._traxSampleManager.dispose();
                this._traxSampleManager = null;
            }
            if (this._genericSamples)
            {
                this._genericSamples.dispose();
                this._genericSamples = null;
            }
            if (this._onDemandSamplePlaybackManager)
            {
                this._onDemandSamplePlaybackManager.dispose();
                this._onDemandSamplePlaybackManager = null;
            }
            if (this._communication)
            {
                this._communication.release(new IIDHabboCommunicationManager());
                this._communication = null;
            }
            if (this._roomEngine)
            {
                this._roomEngine.events.removeEventListener(RoomEnginePlaySoundEvent.PLAY_SOUND, this._Str_15803);
                this._roomEngine.events.removeEventListener(RoomEnginePlaySoundEvent.PLAY_SOUND_AT_PITCH, this._Str_15803);
                this._roomEngine.release(new IIDRoomEngine());
                this._roomEngine = null;
            }
            if (this._notifications)
            {
                this._notifications.release(new IIDHabboNotifications());
                this._notifications = null;
            }
            super.dispose();
        }

        public function _Str_4375(k:String, _arg_2:int=0):void
        {
            var _local_4:Sound;
            var _local_3:IHabboSound = this._genericSamples.getValue(k);
            if (_local_3 == null)
            {
                _local_4 = this._Str_21864(k);
                if (_local_4 != null)
                {
                    _local_3 = new HabboSoundBase(_local_4, _arg_2);
                    this._genericSamples.add(k, IHabboSound(_local_3));
                }
            }
            _local_3._Str_3206 = this._genericVolume;
            _local_3.play();
        }

        public function _Str_20382(k:String, _arg_2:Number):IHabboSound
        {
            var _local_3:Sound = this._Str_21864(k);
            if (_local_3 == null)
            {
                return null;
            }
            var _local_4:HabboSoundWithPitch = new HabboSoundWithPitch(_local_3, _arg_2);
            _local_4._Str_3206 = this._genericVolume;
            _local_4.play();
            return _local_4;
        }

        public function _Str_25775(k:String):void
        {
            var _local_2:IHabboSound = this._genericSamples.getValue(k);
            if (_local_2 != null)
            {
                _local_2.stop();
            }
        }

        public function get _Str_18031():int
        {
            return this._loadingSongId;
        }

        private function _Str_25112():void
        {
            this._loadingSongId = -1;
            this._loadingSong = null;
        }

        private function _Str_21864(k:String):Sound
        {
            var _local_2:String = "";
            switch (k)
            {
                case HabboSoundConstants.CALL_FOR_HELP:
                    _local_2 = "sound_call_for_help";
                    break;
                case HabboSoundConstants.GUIDE_INVITATION:
                    _local_2 = "sound_guide_received_invitation";
                    break;
                case HabboSoundConstants.GUIDE_REQUEST:
                    _local_2 = "sound_guide_help_requested";
                    break;
                case HabboSoundConstants.MESSAGE_RECEIVED:
                    _local_2 = "sound_console_new_message";
                    break;
                case HabboSoundConstants.MESSAGE_SENT:
                    _local_2 = "sound_console_message_sent";
                    break;
                case HabboSoundConstants.PIXELS:
                    _local_2 = "sound_catalogue_duckets";
                    break;
                case HabboSoundConstants.PURCHASE:
                    _local_2 = "sound_catalogue_cash";
                    break;
                case HabboSoundConstants.RESPECT:
                    _local_2 = "sound_respect_received";
                    break;
                case HabboSoundConstants.CAMERA_SHUTTER:
                    _local_2 = "sound_camera_shutter";
                    break;
                    _local_2 = k;
                    break;
                case HabboSoundConstants.GAMES_IG_COUNTDOWN:
                case HabboSoundConstants.GAMES_IG_WINNING:
                case HabboSoundConstants.GAMES_IG_LOSING:
				case HabboSoundConstants.GAMES_SW_GET_SNOWBALL:
                case HabboSoundConstants.GAMES_SW_HIT1:
                case HabboSoundConstants.GAMES_SW_HIT2:
                case HabboSoundConstants.GAMES_SW_HIT3:
                case HabboSoundConstants.GAMES_SW_MAKE_SNOWBALL:
                case HabboSoundConstants.GAMES_SW_MISS:
                case HabboSoundConstants.GAMES_SW_THROW:
                case HabboSoundConstants.GAMES_SW_WALK:
                    _local_2 = k;
                    break;
                case HabboSoundConstants.FURNITURE_CUCKOO_CLOCK:
                    _local_2 = k;
                    break;
                default:
                    Logger.log(("HabboSoundManagerFlash10: Unknown sound request: " + k));
                    return null;
            }
            return this._Str_22681(_local_2);
        }

        private function _Str_22681(k:String):Sound
        {
            var _local_2:IAsset = assets.getAssetByName(k);
            return _local_2.content as Sound;
        }

        public function _Str_17576(k:int, _arg_2:String):IHabboSound
        {
            if (this._loadingSong != null)
            {
                return this._Str_24239(k, _arg_2);
            }
            var _local_3:TraxSequencer = this._Str_19163(k, _arg_2);
            if (!_local_3.ready)
            {
                this._loadingSong = _local_3;
                this._loadingSongId = k;
            }
            return _local_3 as IHabboSound;
        }

        private function _Str_24239(k:int, _arg_2:String):IHabboSound
        {
            var _local_3:TraxSequencer = this._Str_19163(k, _arg_2, false);
            if (!_local_3.ready)
            {
                this._loadingSongQueue.add(k, _local_3);
            }
            return _local_3;
        }

        private function _Str_19163(k:int, _arg_2:String, _arg_3:Boolean=true):TraxSequencer
        {
            var _local_4:TraxData = new TraxData(_arg_2);
            var _local_5:TraxSequencer = new TraxSequencer(k, _local_4, this._traxSampleManager._Str_21843, events);
            _local_5._Str_3206 = this._genericVolume;
            this._Str_21484(_local_5, _arg_3);
            return _local_5;
        }

        private function _Str_21484(k:TraxSequencer, _arg_2:Boolean):void
        {
            var _local_3:TraxData = k._Str_17466;
            var _local_4:Array = _local_3._Str_18878();
            var _local_5:Boolean;
            var _local_6:int;
            while (_local_6 < _local_4.length)
            {
                if (this._traxSampleManager._Str_21843.getValue(int(_local_4[_local_6])) == null)
                {
                    if (_arg_2)
                    {
                        this._traxSampleManager._Str_16532(int(_local_4[_local_6]));
                    }
                    _local_5 = true;
                }
                _local_6++;
            }
            if (_local_5)
            {
                k.ready = false;
            }
            else
            {
                k.ready = true;
            }
        }

        public function _Str_22895(k:String, _arg_2:String):void
        {
            if (this._notifications == null)
            {
                return;
            }
            this._notifications._Str_15846(k, _arg_2);
        }

        private function _Str_25566(k:IID=null, _arg_2:IUnknown=null):void
        {
            var _local_3:IConnection;
            if (_arg_2 != null)
            {
                this._communication = IHabboCommunicationManager(_arg_2);
                _local_3 = this._communication.connection;
                if (_local_3 != null)
                {
                    this._Str_23041(_local_3);
                    this.init();
                }
            }
        }

        private function onRoomEngineReady(k:IID=null, _arg_2:IUnknown=null):void
        {
            if (_arg_2 == null)
            {
                return;
            }
            this._roomEngine = IRoomEngine(_arg_2);
            this.init();
        }

        private function _Str_16511(k:IID=null, _arg_2:IUnknown=null):void
        {
            if (_arg_2 == null)
            {
                return;
            }
            this._notifications = IHabboNotifications(_arg_2);
        }

        private function _Str_23041(k:IConnection):void
        {
            if (disposed)
            {
                return;
            }
            if (k != null)
            {
                this._connection = k;
            }
            this.init();
        }

        private function init():void
        {
            if ((((this._connection == null) || (this._roomEngine == null)) || (!(this._musicController == null))))
            {
                return;
            }
            this._musicController = new HabboMusicController(this, events, this._roomEngine.events, this._connection);
            this._traxSampleManager = new TraxSampleManager(this, this._Str_25112);
            this._onDemandSamplePlaybackManager = new FurniSamplePlaybackManager(this, this._roomEngine.events);
            this._roomEngine.events.addEventListener(RoomEnginePlaySoundEvent.PLAY_SOUND, this._Str_15803);
            this._roomEngine.events.addEventListener(RoomEnginePlaySoundEvent.PLAY_SOUND_AT_PITCH, this._Str_15803);
            this._connection.addMessageEvent(new _Str_3870(this._Str_24903));
            this._connection.send(new _Str_10678());
        }

        protected function _Str_25965(k:IHabboMusicController):void
        {
            this._musicController = k;
        }

        private function _Str_23582(k:Event):void
        {
            var _local_2:TraxSongLoadEvent = (k as TraxSongLoadEvent);
            if (_local_2 == null)
            {
                return;
            }
            if (this._loadingSong == null)
            {
                return;
            }
            this._loadingSong.ready = true;
            if (this._musicController == null)
            {
                return;
            }
            this._musicController._Str_21359(_local_2.id);
            this._loadingSong = null;
            this._loadingSongId = -1;
        }

        private function _Str_16207():void
        {
            if (this._connection != null)
            {
                this._connection.send(new _Str_11698((this._traxVolume * 100), (this._furniVolume * 100), (this._genericVolume * 100)));
            }
        }

        private function _Str_9171(k:Number, _arg_2:Number, _arg_3:Number):void
        {
            if (this._muted)
            {
                this._genericVolume = 0;
                this._furniVolume = 0;
                this._traxVolume = 0;
                this._musicController._Str_7935(0);
                this._onDemandSamplePlaybackManager._Str_7935(0);
            }
            else
            {
                this._genericVolume = k;
                this._furniVolume = _arg_2;
                this._traxVolume = _arg_3;
                this._musicController._Str_7935(_arg_3);
                this._onDemandSamplePlaybackManager._Str_7935(_arg_2);
            }
        }

        private function _Str_24903(k:IMessageEvent):void
        {
            var _local_2:_Str_3870 = (k as _Str_3870);
            var _local_3:_Str_5515 = (_local_2.getParser() as _Str_5515);
            var _local_4:Number = _local_3._Str_16610;
            if (_local_4 == 1)
            {
                _local_4 = 100;
            }
            this._Str_9171((_local_4 / 100), (_local_3._Str_3488 / 100), (_local_3._Str_3410 / 100));
        }

        private function _Str_23975():void
        {
            var k:int;
            var _local_2:TraxSequencer;
            if (((this._loadingSong == null) && (this._loadingSongQueue.length > 0)))
            {
                k = this._loadingSongQueue.getKey(0);
                _local_2 = this._loadingSongQueue.remove(k);
                if (((!(_local_2 == null)) && (!(_local_2.disposed))))
                {
                    this._Str_21484(_local_2, true);
                    if (_local_2.ready)
                    {
                        events.dispatchEvent(new TraxSongLoadEvent(TraxSongLoadEvent.TSLE_TRAX_LOAD_COMPLETE, k));
                    }
                    else
                    {
                        this._loadingSong = _local_2;
                        this._loadingSongId = k;
                    }
                }
            }
        }

        private function _Str_15803(k:Event):void
        {
            var _local_2:RoomEnginePlaySoundEvent = RoomEnginePlaySoundEvent(k);
            if (k.type == RoomEnginePlaySoundEvent.PLAY_SOUND)
            {
                this._Str_4375(_local_2.soundId);
            }
            if (k.type == RoomEnginePlaySoundEvent.PLAY_SOUND_AT_PITCH)
            {
                this._Str_20382(_local_2.soundId, _local_2._Str_4740);
            }
        }

        public function update(k:uint):void
        {
            if (this._traxSampleManager != null)
            {
                this._traxSampleManager.update(k);
            }
            this._Str_23975();
        }

        public function mute(k:Boolean):void
        {
            this._muted = k;
            this._Str_9171(this._genericVolume, this._furniVolume, this._traxVolume);
        }
    }
}
