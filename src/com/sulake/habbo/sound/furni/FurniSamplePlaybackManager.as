package com.sulake.habbo.sound.furni
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.sound.HabboSoundManagerFlash10;
    import flash.events.IEventDispatcher;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.room.events.RoomEngineObjectSamplePlaybackEvent;
    import com.sulake.habbo.sound.HabboSoundWithPitch;
    import flash.net.URLRequest;
    import flash.media.Sound;
    import flash.events.Event;
    import flash.events.IOErrorEvent;

    public class FurniSamplePlaybackManager implements IDisposable 
    {
        private var _soundManager:HabboSoundManagerFlash10;
        private var _roomEvents:IEventDispatcher;
        private var _disposed:Boolean = false;
        private var _loadedSamples:Map;
        private var _loadingSamples:Map;
        private var _initialPitch:Map;
        private var _volume:Number = 1;

        public function FurniSamplePlaybackManager(k:HabboSoundManagerFlash10, _arg_2:IEventDispatcher)
        {
            this._loadedSamples = new Map();
            this._loadingSamples = new Map();
            this._initialPitch = new Map();
            super();
            this._soundManager = k;
            this._roomEvents = _arg_2;
            this._roomEvents.addEventListener(RoomEngineObjectSamplePlaybackEvent.REOSPE_ROOM_OBJECT_INITIALIZED, this._Str_19837);
            this._roomEvents.addEventListener(RoomEngineObjectSamplePlaybackEvent.REOSPE_ROOM_OBJECT_DISPOSED, this._Str_21969);
            this._roomEvents.addEventListener(RoomEngineObjectSamplePlaybackEvent.REOSPE_PLAY_SAMPLE, this._Str_22002);
            this._roomEvents.addEventListener(RoomEngineObjectSamplePlaybackEvent.REOSPE_CHANGE_PITCH, this._Str_20753);
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                if (this._roomEvents)
                {
                    this._roomEvents.removeEventListener(RoomEngineObjectSamplePlaybackEvent.REOSPE_ROOM_OBJECT_INITIALIZED, this._Str_19837);
                    this._roomEvents.removeEventListener(RoomEngineObjectSamplePlaybackEvent.REOSPE_ROOM_OBJECT_DISPOSED, this._Str_21969);
                    this._roomEvents.removeEventListener(RoomEngineObjectSamplePlaybackEvent.REOSPE_PLAY_SAMPLE, this._Str_22002);
                    this._roomEvents.removeEventListener(RoomEngineObjectSamplePlaybackEvent.REOSPE_CHANGE_PITCH, this._Str_20753);
                    this._roomEvents = null;
                }
                if (this._loadedSamples)
                {
                    this._loadedSamples.dispose();
                    this._loadedSamples = null;
                }
                if (this._loadingSamples)
                {
                    this._loadingSamples.dispose();
                    this._loadingSamples = null;
                }
                if (this._initialPitch)
                {
                    this._initialPitch.dispose();
                    this._initialPitch = null;
                }
                this._soundManager = null;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function _Str_7935(k:Number):void
        {
            var _local_2:HabboSoundWithPitch;
            this._volume = k;
            for each (_local_2 in this._loadedSamples.getValues())
            {
                _local_2._Str_3206 = this._volume;
            }
        }

        private function _Str_19837(k:RoomEngineObjectSamplePlaybackEvent):void
        {
            if (k._Str_6992 != -1)
            {
                this._Str_23007(k._Str_1577, k._Str_6992);
                if (this._initialPitch.hasKey(k._Str_1577))
                {
                    this._initialPitch.remove(k._Str_1577);
                }
                this._initialPitch.add(k._Str_1577, k._Str_4740);
            }
        }

        private function _Str_21969(k:RoomEngineObjectSamplePlaybackEvent):void
        {
            this._Str_25308(k._Str_1577);
        }

        private function _Str_22002(k:RoomEngineObjectSamplePlaybackEvent):void
        {
            if (this._loadedSamples.getValue(k._Str_1577) != null)
            {
                this._Str_24951(k._Str_1577);
            }
        }

        private function _Str_20753(k:RoomEngineObjectSamplePlaybackEvent):void
        {
            if (this._loadedSamples.getValue(k._Str_1577) != null)
            {
                this._Str_25082(k._Str_1577, k._Str_4740);
            }
        }

        private function _Str_23007(k:int, _arg_2:int):void
        {
            if (((this._loadedSamples.getValue(k) == null) && (this._loadingSamples.getValues().indexOf(_arg_2) == -1)))
            {
                this._Str_16532(_arg_2, k);
            }
        }

        private function _Str_25308(k:int):void
        {
            var _local_2:HabboSoundWithPitch = this._loadedSamples.getValue(k);
            if (_local_2 != null)
            {
                this._soundManager.removeUpdateReceiver(_local_2);
                _local_2.dispose();
                this._loadedSamples.remove(k);
            }
        }

        private function _Str_24951(k:int):void
        {
            var _local_2:HabboSoundWithPitch = this._loadedSamples.getValue(k);
            if (_local_2 != null)
            {
                _local_2.stop();
                _local_2.play();
            }
        }

        private function _Str_25082(k:int, _arg_2:Number):void
        {
            var _local_3:HabboSoundWithPitch = this._loadedSamples.getValue(k);
            if (_local_3 != null)
            {
                _local_3._Str_19664(_arg_2);
            }
        }

        private function _Str_16532(k:int, _arg_2:int):void
        {
            var _local_3:String = this._soundManager.getProperty("flash.dynamic.download.url");
            _local_3 = (_local_3 + this._soundManager.getProperty("flash.dynamic.download.samples.template"));
            _local_3 = _local_3.replace(/%typeid%/, k.toString());
            var _local_4:URLRequest = new URLRequest(_local_3);
            var _local_5:Sound = new Sound();
            _local_5.addEventListener(Event.COMPLETE, this._Str_18059);
            _local_5.addEventListener(IOErrorEvent.IO_ERROR, this.ioErrorHandler);
            _local_5.load(_local_4);
            this._loadingSamples.add(_local_5, _arg_2);
        }

        private function _Str_18059(k:Event):void
        {
            if (this.disposed)
            {
                return;
            }
            var _local_2:Sound = (k.target as Sound);
            if (((_local_2 == null) || (this._loadingSamples.getValue(_local_2) == null)))
            {
                return;
            }
            var _local_3:int = this._loadingSamples.getValue(_local_2);
            var _local_4:HabboSoundWithPitch = new HabboSoundWithPitch(_local_2, this._initialPitch.getValue(_local_3));
            this._soundManager.registerUpdateReceiver(_local_4, 0);
            _local_4._Str_3206 = this._volume;
            this._loadedSamples.add(_local_3, _local_4);
            this._loadingSamples.remove(_local_2);
        }

        private function ioErrorHandler(k:IOErrorEvent):void
        {
            Logger.log(((("Error loading sound " + k.target) + " text ") + k.text));
        }
    }
}
