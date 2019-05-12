package com.sulake.habbo.sound.trax
{
    import com.sulake.habbo.sound.IHabboSound;
    import com.sulake.core.runtime.IDisposable;
    import __AS3__.vec.Vector;
    import flash.events.IEventDispatcher;
    import flash.media.Sound;
    import flash.media.SoundChannel;
    import com.sulake.core.utils.Map;
    import flash.utils.Timer;
    import flash.media.SoundTransform;
    import flash.utils.getTimer;
    import flash.events.SampleDataEvent;
    import flash.events.TimerEvent;
    import flash.utils.ByteArray;
    import com.sulake.habbo.sound.events.SoundControllerEvent;
    import __AS3__.vec.*;

    public class TraxSequencer implements IHabboSound, IDisposable 
    {
        private static const _Str_4502:Number = 44100;
        private static const _Str_5149:uint = 0x2000;
        private static const _Str_14348:uint = 88000;
        private static const _Str_10958:uint = 88000;
        private static const _Str_6865:Vector.<int> = new Vector.<int>(_Str_5149, true);
        private static const _Str_19164:Vector.<int> = new Vector.<int>(_Str_5149, true);

        private var _disposed:Boolean = false;
        private var _events:IEventDispatcher;
        private var _volume:Number;
        private var _sound:Sound;
        private var _soundChannel:SoundChannel;
        private var _traxData:TraxData;
        private var _samples:Map;
        private var _ready:Boolean;
        private var _songId:int;
        private var _playLengthSamples:int = 0;
        private var _playHead:uint;
        private var _sequence:Array;
        private var _prepared:Boolean;
        private var _finished:Boolean = true;
        private var _lengthSamples:uint;
        private var _latencyMs:uint;
        private var _fadeInActive:Boolean;
        private var _fadeOutActive:Boolean;
        private var _fadeInLengthSamples:int;
        private var _fadeOutLengthSamples:int;
        private var _fadeInSampleCounter:int;
        private var _fadeOutSampleCounter:int;
        private var _fadeoutStopTimer:Timer;
        private var _stopTimer:Timer;
        private var _useCutMode:Boolean;
        private var _expectedStreamPosition:int = 0;
        private var _bufferUnderRunCount:int = 0;

        public function TraxSequencer(k:int, _arg_2:TraxData, _arg_3:Map, _arg_4:IEventDispatcher)
        {
            this._latencyMs = uint(30);
            super();
            this._events = _arg_4;
            this._songId = k;
            this._volume = 1;
            this._sound = new Sound();
            this._soundChannel = null;
            this._samples = _arg_3;
            this._traxData = _arg_2;
            this._ready = true;
            this._playHead = 0;
            this._sequence = [];
            this._prepared = false;
            this._lengthSamples = 0;
            this._finished = false;
            this._fadeInActive = false;
            this._fadeOutActive = false;
            this._fadeInLengthSamples = 0;
            this._fadeOutLengthSamples = 0;
            this._fadeInSampleCounter = 0;
            this._fadeOutSampleCounter = 0;
        }

        public function set position(k:Number):void
        {
            this._playHead = uint((k * _Str_4502));
        }

        public function get _Str_3206():Number
        {
            return this._volume;
        }

        public function get position():Number
        {
            return this._playHead / _Str_4502;
        }

        public function get ready():Boolean
        {
            return this._ready;
        }

        public function set ready(k:Boolean):void
        {
            this._ready = k;
        }

        public function get _Str_21060():Boolean
        {
            return this._finished;
        }

        public function get _Str_4908():Number
        {
            return this._fadeOutLengthSamples / _Str_4502;
        }

        public function set _Str_4908(k:Number):void
        {
            this._fadeOutLengthSamples = int((k * _Str_4502));
        }

        public function get _Str_6653():Number
        {
            return this._fadeInLengthSamples / _Str_4502;
        }

        public function set _Str_6653(k:Number):void
        {
            this._fadeInLengthSamples = int((k * _Str_4502));
        }

        public function get _Str_17466():TraxData
        {
            return this._traxData;
        }

        public function set _Str_3206(k:Number):void
        {
            this._volume = k;
            if (this._soundChannel != null)
            {
                this._soundChannel.soundTransform = new SoundTransform(this._volume);
            }
        }

        public function get length():Number
        {
            return this._lengthSamples / _Str_4502;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this._Str_16744();
                this._traxData = null;
                this._samples = null;
                this._sequence = null;
                this._events = null;
                this._sound = null;
                this._disposed = true;
            }
        }

        public function prepare():Boolean
        {
            if (!this._ready)
            {
                Logger.log("Cannot start trax playback until samples ready!");
                return false;
            }
            if (!this._prepared)
            {
                if (this._traxData != null)
                {
                    this._useCutMode = false;
                    if (this._traxData._Str_25573)
                    {
                        this._useCutMode = this._traxData._Str_22931;
                    }
                    if (this._useCutMode)
                    {
                        if (!this._Str_23486())
                        {
                            Logger.log("Cannot start playback, prepare sequence failed!");
                            return false;
                        }
                    }
                    else
                    {
                        if (!this._Str_25172())
                        {
                            Logger.log("Cannot start playback, prepare legacy sequence failed!");
                            return false;
                        }
                    }
                }
            }
            return true;
        }

        private function _Str_25172():Boolean
        {
            var _local_3:Map;
            var _local_4:TraxChannel;
            var _local_5:uint;
            var _local_6:uint;
            var _local_7:int;
            var _local_8:int;
            var _local_9:TraxSample;
            var _local_10:int;
            var _local_11:int;
            var _local_12:int;
            if (this._sequence == null)
            {
                return false;
            }
            var k:uint = getTimer();
            var _local_2:int;
            while (_local_2 < this._traxData._Str_15653.length)
            {
                _local_3 = new Map();
                _local_4 = (this._traxData._Str_15653[_local_2] as TraxChannel);
                _local_5 = 0;
                _local_6 = 0;
                _local_7 = 0;
                while (_local_7 < _local_4._Str_11307)
                {
                    _local_8 = _local_4._Str_2990(_local_7).id;
                    _local_9 = (this._samples.getValue(_local_8) as TraxSample);
                    _local_9._Str_21520(this._songId, k);
                    if (_local_9 != null)
                    {
                        _local_10 = this._Str_20071(_local_9.length);
                        _local_11 = (_local_4._Str_2990(_local_7).length / _local_10);
                        _local_12 = 0;
                        while (_local_12 < _local_11)
                        {
                            if (_local_8 != 0)
                            {
                                _local_3.add(_local_5, _local_9);
                            }
                            _local_6 = (_local_6 + _local_10);
                            _local_5 = (_local_6 * _Str_10958);
                            _local_12++;
                        }
                    }
                    else
                    {
                        Logger.log("Error in prepareLegacySequence(), sample was null!");
                        return false;
                    }
                    if (this._lengthSamples < _local_5)
                    {
                        this._lengthSamples = _local_5;
                    }
                    _local_7++;
                }
                this._sequence.push(_local_3);
                _local_2++;
            }
            this._prepared = true;
            return true;
        }

        private function _Str_23486():Boolean
        {
            var _local_3:Map;
            var _local_4:TraxChannel;
            var _local_5:uint;
            var _local_6:uint;
            var _local_7:Boolean;
            var _local_8:int;
            var _local_9:int;
            var _local_10:TraxSample;
            var _local_11:int;
            var _local_12:int;
            var _local_13:int;
            var _local_14:int;
            if (this._sequence == null)
            {
                return false;
            }
            var k:uint = getTimer();
            var _local_2:int;
            while (_local_2 < this._traxData._Str_15653.length)
            {
                _local_3 = new Map();
                _local_4 = (this._traxData._Str_15653[_local_2] as TraxChannel);
                _local_5 = 0;
                _local_6 = 0;
                _local_7 = false;
                _local_8 = 0;
                while (_local_8 < _local_4._Str_11307)
                {
                    _local_9 = _local_4._Str_2990(_local_8).id;
                    _local_10 = (this._samples.getValue(_local_9) as TraxSample);
                    _local_10._Str_21520(this._songId, k);
                    if (_local_10 != null)
                    {
                        _local_11 = _local_6;
                        _local_12 = _local_5;
                        _local_13 = this._Str_20071(_local_10.length);
                        _local_14 = _local_4._Str_2990(_local_8).length;
                        while (_local_11 < (_local_6 + _local_14))
                        {
                            if (((!(_local_9 == 0)) || (_local_7)))
                            {
                                _local_3.add(_local_12, _local_10);
                                _local_7 = false;
                            }
                            _local_11 = (_local_11 + _local_13);
                            _local_12 = (_local_11 * _Str_10958);
                            if (_local_11 > (_local_6 + _local_14))
                            {
                                _local_7 = true;
                            }
                        }
                        _local_6 = (_local_6 + _local_4._Str_2990(_local_8).length);
                        _local_5 = (_local_6 * _Str_10958);
                    }
                    else
                    {
                        Logger.log("Error in prepareSequence(), sample was null!");
                        return false;
                    }
                    if (this._lengthSamples < _local_5)
                    {
                        this._lengthSamples = _local_5;
                    }
                    _local_8++;
                }
                this._sequence.push(_local_3);
                _local_2++;
            }
            this._prepared = true;
            return true;
        }

        public function play(k:Number=0):Boolean
        {
            if (!this.prepare())
            {
                return false;
            }
            this._Str_21321();
            if (this._soundChannel != null)
            {
                this._Str_16744();
            }
            if (this._fadeInLengthSamples > 0)
            {
                this._fadeInActive = true;
                this._fadeInSampleCounter = 0;
            }
            this._fadeOutActive = false;
            this._fadeOutSampleCounter = 0;
            this._finished = false;
            this._sound.addEventListener(SampleDataEvent.SAMPLE_DATA, this._Str_18381);
            this._playLengthSamples = (k * _Str_4502);
            this._expectedStreamPosition = 0;
            this._bufferUnderRunCount = 0;
            this._soundChannel = this._sound.play();
            this._Str_3206 = this._volume;
            return true;
        }

        public function render(k:SampleDataEvent):Boolean
        {
            if (!this.prepare())
            {
                return false;
            }
            while ((!(this._finished)))
            {
                this._Str_18381(k);
            }
            return true;
        }

        public function stop():Boolean
        {
            if (((this._fadeOutLengthSamples > 0) && (!(this._finished))))
            {
                this._Str_24766();
            }
            else
            {
                this._Str_18840();
            }
            return true;
        }

        private function _Str_16744():void
        {
            this._Str_24945();
            if (this._soundChannel != null)
            {
                this._soundChannel.stop();
                this._soundChannel = null;
            }
            if (this._sound != null)
            {
                this._sound.removeEventListener(SampleDataEvent.SAMPLE_DATA, this._Str_18381);
            }
        }

        private function _Str_24766():void
        {
            if (this._fadeoutStopTimer == null)
            {
                this._fadeOutActive = true;
                this._fadeOutSampleCounter = 0;
                this._fadeoutStopTimer = new Timer((this._latencyMs + (this._fadeOutLengthSamples / (_Str_4502 / 1000))), 1);
                this._fadeoutStopTimer.start();
                this._fadeoutStopTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this._Str_21147);
            }
        }

        private function _Str_20071(k:uint):int
        {
            if (this._useCutMode)
            {
                return Math.round((k / _Str_14348));
            }
            return Math.ceil((k / _Str_14348));
        }

        private function _Str_22396():Array
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:Map;
            var _local_5:int;
            var k:Array = [];
            if (this._sequence != null)
            {
                _local_2 = this._sequence.length;
                _local_3 = 0;
                while (_local_3 < _local_2)
                {
                    _local_4 = this._sequence[_local_3];
                    _local_5 = 0;
                    while (((_local_5 < _local_4.length) && (_local_4.getKey(_local_5) < this._playHead)))
                    {
                        _local_5++;
                    }
                    k.push((_local_5 - 1));
                    _local_3++;
                }
            }
            return k;
        }

        private function _Str_23903():void
        {
            var _local_5:Map;
            var _local_6:int;
            var _local_7:TraxSample;
            var _local_8:int;
            var _local_9:int;
            var _local_10:int;
            var _local_11:int;
            var _local_12:int;
            var _local_13:int;
            var _local_14:int;
            if (this._sequence == null)
            {
                return;
            }
            var k:Array = this._Str_22396();
            var _local_2:int = this._sequence.length;
            var _local_3:TraxChannelSample;
            var _local_4:int = (_local_2 - 1);
            while (_local_4 >= 0)
            {
                _local_5 = this._sequence[_local_4];
                _local_6 = k[_local_4];
                _local_7 = _local_5.getWithIndex(_local_6);
                if (_local_7 == null)
                {
                    _local_3 = null;
                }
                else
                {
                    _local_10 = _local_5.getKey(_local_6);
                    _local_11 = (this._playHead - _local_10);
                    if (((_local_7.id == 0) || (_local_11 < 0)))
                    {
                        _local_3 = null;
                    }
                    else
                    {
                        _local_3 = new TraxChannelSample(_local_7, _local_11);
                    }
                }
                _local_8 = _Str_5149;
                if ((this._lengthSamples - this._playHead) < _local_8)
                {
                    _local_8 = (this._lengthSamples - this._playHead);
                }
                _local_9 = 0;
                while (_local_9 < _local_8)
                {
                    _local_12 = _local_8;
                    if (_local_6 < (_local_5.length - 1))
                    {
                        _local_13 = _local_5.getKey((_local_6 + 1));
                        if ((_local_8 + this._playHead) >= _local_13)
                        {
                            _local_12 = (_local_13 - this._playHead);
                        }
                    }
                    if (_local_12 > (_local_8 - _local_9))
                    {
                        _local_12 = (_local_8 - _local_9);
                    }
                    if (_local_4 == (_local_2 - 1))
                    {
                        if (_local_3 != null)
                        {
                            _local_3._Str_17440(_Str_6865, _local_9, _local_12);
                            _local_9 = (_local_9 + _local_12);
                        }
                        else
                        {
                            _local_14 = 0;
                            while (_local_14 < _local_12)
                            {
                                var _local_15:* = _local_9++;
                                _Str_6865[_local_15] = 0;
                                _local_14++;
                            }
                        }
                    }
                    else
                    {
                        if (_local_3 != null)
                        {
                            _local_3._Str_16849(_Str_6865, _local_9, _local_12);
                        }
                        _local_9 = (_local_9 + _local_12);
                    }
                    if (_local_9 < _local_8)
                    {
                        _local_7 = _local_5.getWithIndex(++_local_6);
                        if (((_local_7 == null) || (_local_7.id == 0)))
                        {
                            _local_3 = null;
                        }
                        else
                        {
                            _local_3 = new TraxChannelSample(_local_7, 0);
                        }
                    }
                }
                _local_4--;
            }
        }

        private function _Str_23628():void
        {
            var k:int = ((this._lengthSamples < this._playLengthSamples) ? this._lengthSamples : ((this._playLengthSamples > 0) ? this._playLengthSamples : this._lengthSamples));
            if (((this._playHead > (k + (this._latencyMs * (_Str_4502 / 1000)))) && (!(this._finished))))
            {
                this._finished = true;
                if (this._stopTimer != null)
                {
                    this._stopTimer.reset();
                    this._stopTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, this._Str_17559);
                }
                this._stopTimer = new Timer(2, 1);
                this._stopTimer.start();
                this._stopTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this._Str_17559);
            }
            else
            {
                if (((this._playHead > (k - this._fadeOutLengthSamples)) && (!(this._fadeOutActive))))
                {
                    this._fadeInActive = false;
                    this._fadeOutActive = true;
                    this._fadeOutSampleCounter = 0;
                }
            }
        }

        private function _Str_18381(k:SampleDataEvent):void
        {
            if (k.position > this._expectedStreamPosition)
            {
                this._bufferUnderRunCount++;
                Logger.log("Audio buffer under run...");
                this._expectedStreamPosition = k.position;
            }
            if (this._Str_3206 > 0)
            {
                this._Str_23903();
            }
            var _local_2:int = _Str_5149;
            if ((this._lengthSamples - this._playHead) < _local_2)
            {
                _local_2 = (this._lengthSamples - this._playHead);
                if (_local_2 < 0)
                {
                    _local_2 = 0;
                }
            }
            if (this._Str_3206 <= 0)
            {
                _local_2 = 0;
            }
            this._Str_24218(k.data, _local_2);
            this._playHead = (this._playHead + _Str_5149);
            this._expectedStreamPosition = (this._expectedStreamPosition + _Str_5149);
            if (this._soundChannel != null)
            {
                this._latencyMs = (((k.position / _Str_4502) * 1000) - this._soundChannel.position);
            }
            this._Str_23628();
        }

        private function _Str_24218(k:ByteArray, _arg_2:int):void
        {
            var _local_5:Number;
            var _local_6:Number;
            if (_arg_2 > 0)
            {
                if (((!(this._fadeInActive)) && (!(this._fadeOutActive))))
                {
                    this._Str_25471(k, _arg_2);
                }
                else
                {
                    if (this._fadeInActive)
                    {
                        _local_5 = (1 / this._fadeInLengthSamples);
                        _local_6 = (this._fadeInSampleCounter / Number(this._fadeInLengthSamples));
                        this._fadeInSampleCounter = (this._fadeInSampleCounter + _Str_5149);
                        if (this._fadeInSampleCounter > this._fadeInLengthSamples)
                        {
                            this._fadeInActive = false;
                        }
                    }
                    else
                    {
                        if (this._fadeOutActive)
                        {
                            _local_5 = (-1 / this._fadeOutLengthSamples);
                            _local_6 = (1 - (this._fadeOutSampleCounter / Number(this._fadeOutLengthSamples)));
                            this._fadeOutSampleCounter = (this._fadeOutSampleCounter + _Str_5149);
                            if (this._fadeOutSampleCounter > this._fadeOutLengthSamples)
                            {
                                this._fadeOutSampleCounter = this._fadeOutLengthSamples;
                            }
                        }
                    }
                    this._Str_25194(k, _arg_2, _local_6, _local_5);
                }
            }
            var _local_3:Number = 0;
            var _local_4:int = _arg_2;
            while (_local_4 < _Str_5149)
            {
                k.writeFloat(_local_3);
                k.writeFloat(_local_3);
                _local_4++;
            }
        }

        private function _Str_25471(k:ByteArray, _arg_2:int):void
        {
            var _local_3:Number = 0;
            var _local_4:int;
            while (_local_4 < _arg_2)
            {
                _local_3 = (Number(_Str_6865[_local_4]) * TraxSample._Str_11575);
                k.writeFloat(_local_3);
                k.writeFloat(_local_3);
                _local_4++;
            }
        }

        private function _Str_25194(k:ByteArray, _arg_2:int, _arg_3:Number, _arg_4:Number):void
        {
            var _local_5:Number = 0;
            var _local_6:int;
            _local_6 = 0;
            while (_local_6 < _arg_2)
            {
                if (((_arg_3 < 0) || (_arg_3 > 1)))
                {
                    break;
                }
                _local_5 = ((Number(_Str_6865[_local_6]) * TraxSample._Str_11575) * _arg_3);
                _arg_3 = (_arg_3 + _arg_4);
                k.writeFloat(_local_5);
                k.writeFloat(_local_5);
                _local_6++;
            }
            if (_arg_3 < 0)
            {
                while (_local_6 < _arg_2)
                {
                    k.writeFloat(0);
                    k.writeFloat(0);
                    _local_6++;
                }
            }
            else
            {
                if (_arg_3 > 1)
                {
                    while (_local_6 < _arg_2)
                    {
                        _local_5 = (Number(_Str_6865[_local_6]) * TraxSample._Str_11575);
                        _arg_3 = (_arg_3 + _arg_4);
                        k.writeFloat(_local_5);
                        k.writeFloat(_local_5);
                        _local_6++;
                    }
                }
            }
        }

        private function _Str_17559(k:TimerEvent):void
        {
            if (this._finished)
            {
                this._Str_18840();
            }
        }

        private function _Str_21147(k:TimerEvent):void
        {
            this._Str_21321();
            this._Str_18840();
        }

        private function _Str_18840():void
        {
            this._Str_16744();
            this._events.dispatchEvent(new SoundControllerEvent(SoundControllerEvent.TRAX_SONG_COMPLETE, this._songId));
        }

        private function _Str_21321():void
        {
            if (this._fadeoutStopTimer != null)
            {
                this._fadeoutStopTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, this._Str_21147);
                this._fadeoutStopTimer.reset();
                this._fadeoutStopTimer = null;
            }
        }

        private function _Str_24945():void
        {
            if (this._stopTimer != null)
            {
                this._stopTimer.reset();
                this._stopTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, this._Str_17559);
                this._stopTimer = null;
            }
        }
    }
}
