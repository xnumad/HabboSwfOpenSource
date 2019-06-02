package com.sulake.habbo.sound.music
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.sound.HabboSoundManagerFlash10;
    import com.sulake.core.utils.Map;
    import flash.utils.ByteArray;
    import flash.net.URLRequest;
    import flash.media.Sound;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import com.sulake.habbo.sound.events.TraxSongLoadEvent;
    import com.sulake.habbo.sound.trax.TraxSample;
    import flash.utils.getTimer;

    public class TraxSampleManager implements IDisposable 
    {
        private static const _Str_17010:int = 60;
        private static const _Str_18145:int = 25165823;
        private static const _Str_17865:int = 0xFFFFFF;

        private var _soundManager:HabboSoundManagerFlash10;
        private var _loadingSamples:Map;
        private var _loadedSamples:Array;
        private var _traxSamples:Map;
        private var _byteBuffer:ByteArray;
        private var _loadErrorCallback:Function;
        private var _purgeSamplesEnabled:Boolean = false;
        private var _disposed:Boolean = false;

        public function TraxSampleManager(k:HabboSoundManagerFlash10, _arg_2:Function)
        {
            this._loadingSamples = new Map();
            this._loadedSamples = [];
            this._traxSamples = new Map();
            this._byteBuffer = new ByteArray();
            super();
            this._loadErrorCallback = _arg_2;
            this._soundManager = k;
            if (this._soundManager.getBoolean("trax.player.sample.memory.purge.enabled"))
            {
                this._purgeSamplesEnabled = true;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this._byteBuffer = null;
                this._loadedSamples = null;
                if (this._traxSamples != null)
                {
                    this._traxSamples.dispose();
                    this._traxSamples = null;
                }
                if (this._loadingSamples != null)
                {
                    this._loadingSamples.dispose();
                    this._loadingSamples = null;
                }
                this._soundManager = null;
                this._disposed = true;
            }
        }

        public function get _Str_21843():Map
        {
            return this._traxSamples;
        }

        public function _Str_16532(k:int):void
        {
            var _local_2:String = this._soundManager.getProperty("flash.dynamic.download.url");
            _local_2 = (_local_2 + this._soundManager.getProperty("flash.dynamic.download.samples.template"));
            _local_2 = _local_2.replace(/%typeid%/, k.toString());
            var _local_3:URLRequest = new URLRequest(_local_2);
            var _local_4:Sound = new Sound();
            _local_4.addEventListener(Event.COMPLETE, this._Str_18059);
            _local_4.addEventListener(IOErrorEvent.IO_ERROR, this.ioErrorHandler);
            _local_4.load(_local_3);
            this._loadingSamples.add(_local_4, k);
        }

        public function update(k:uint):void
        {
            this._Str_23313();
        }

        private function _Str_18059(k:Event):void
        {
            var _local_2:Sound = (k.target as Sound);
            this._loadedSamples.push(_local_2);
        }

        private function ioErrorHandler(k:Event):void
        {
            this._soundManager.events.dispatchEvent(new TraxSongLoadEvent(TraxSongLoadEvent.TSLE_TRAX_LOAD_FAILED, this._soundManager._Str_18031));
            this._loadErrorCallback.call();
        }

        private function _Str_25674(k:Sound):void
        {
            var _local_2:int;
            var _local_3:Number;
            var _local_4:TraxSample;
            if (this._loadingSamples.getValue(k) != null)
            {
                _local_2 = this._loadingSamples.remove(k);
                if (this._traxSamples.getValue(_local_2) == null)
                {
                    this._byteBuffer.clear();
                    _local_3 = k.length;
                    k.extract(this._byteBuffer, int((_local_3 * 44.1)));
                    _local_4 = new TraxSample(this._byteBuffer, _local_2, TraxSample.SAMPLE_FREQUENCY_44KHZ, TraxSample.SAMPLE_SCALE_16BIT);
                    this._traxSamples.add(_local_2, _local_4);
                }
            }
        }

        private function _Str_23313():void
        {
            var k:int;
            var _local_2:int;
            var _local_3:Sound;
            if (this._loadedSamples.length > 0)
            {
                k = getTimer();
                _local_2 = k;
                while ((((_local_2 - k) < _Str_17010) && (this._loadedSamples.length > 0)))
                {
                    _local_3 = this._loadedSamples.splice(0, 1)[0];
                    this._Str_25674(_local_3);
                    _local_2 = getTimer();
                }
                if (((this._loadingSamples.length == 0) && (!(this._soundManager._Str_18031 == -1))))
                {
                    this._soundManager.events.dispatchEvent(new TraxSongLoadEvent(TraxSongLoadEvent.TSLE_TRAX_LOAD_COMPLETE, this._soundManager._Str_18031));
                    if (this._purgeSamplesEnabled)
                    {
                        this._Str_24614();
                    }
                }
            }
        }

        private function _Str_25906():void
        {
        }

        private function _Str_24614():void
        {
            var _local_5:int;
            var _local_6:TraxSample;
            var _local_7:Array;
            var _local_8:uint;
            var _local_9:int;
            var _local_10:TraxSample;
            var _local_11:int;
            var _local_12:TraxSample;
            var k:uint;
            var _local_2:Array = [];
            var _local_3:Array = this._soundManager._Str_2774._Str_19189;
            var _local_4:int;
            while (_local_4 < this._traxSamples.length)
            {
                _local_5 = this._traxSamples.getKey(_local_4);
                _local_6 = this._traxSamples.getWithIndex(_local_4);
                if (((!(_local_6._Str_10605 == 0)) && (_local_3.indexOf(_local_5) == -1)))
                {
                    _local_2.push(_local_6);
                }
                k = (k + _local_6.length);
                _local_4++;
            }
            if (k > _Str_18145)
            {
                _local_7 = [];
                Logger.log("Sample memory limit reached, clearing the oldest and least frequently used samples");
                _local_2.sort(this._Str_23844);
                _local_8 = 0;
                _local_9 = 0;
                while (((_local_8 < (k - _Str_17865)) && (_local_9 < _local_2.length)))
                {
                    _local_10 = _local_2[_local_9++];
                    _local_8 = (_local_8 + _local_10.length);
                    _local_7.push(_local_10.id);
                }
                _local_2 = null;
                if (_local_7.length > 0)
                {
                    for each (_local_11 in _local_7)
                    {
                        Logger.log(("Purging sample : " + _local_11));
                        _local_12 = (this._traxSamples.getValue(_local_11) as TraxSample);
                        _local_12.dispose();
                        this._traxSamples.remove(_local_11);
                    }
                    this._soundManager._Str_2774._Str_20915(_local_7);
                }
            }
        }

        private function _Str_23844(k:TraxSample, _arg_2:TraxSample):int
        {
            if (k._Str_10605 < _arg_2._Str_10605)
            {
                return -1;
            }
            if (k._Str_10605 > _arg_2._Str_10605)
            {
                return 1;
            }
            if (k._Str_14695 < _arg_2._Str_14695)
            {
                return -1;
            }
            if (k._Str_14695 > _arg_2._Str_14695)
            {
                return 1;
            }
            return 0;
        }
    }
}
