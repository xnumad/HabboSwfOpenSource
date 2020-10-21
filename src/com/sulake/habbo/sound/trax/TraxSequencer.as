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
        private static const SAMPLES_PER_SECOND:Number = 44100;
        private static const BUFFER_LENGTH:uint = 0x2000;
        private static const SAMPLES_BAR_LENGTH:uint = 88000;
        private static const BAR_LENGTH:uint = 88000;
        private static const MIXING_BUFFER:Vector.<int> = new Vector.<int>(BUFFER_LENGTH, true);
        private static const INTERPOLATION_BUFFER:Vector.<int> = new Vector.<int>(BUFFER_LENGTH, true);

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
            this._playHead = uint((k * SAMPLES_PER_SECOND));
        }

        public function get volume():Number
        {
            return this._volume;
        }

        public function get position():Number
        {
            return this._playHead / SAMPLES_PER_SECOND;
        }

        public function get ready():Boolean
        {
            return this._ready;
        }

        public function set ready(k:Boolean):void
        {
            this._ready = k;
        }

        public function get finished():Boolean
        {
            return this._finished;
        }

        public function get fadeOutSeconds():Number
        {
            return this._fadeOutLengthSamples / SAMPLES_PER_SECOND;
        }

        public function set fadeOutSeconds(k:Number):void
        {
            this._fadeOutLengthSamples = int((k * SAMPLES_PER_SECOND));
        }

        public function get fadeInSeconds():Number
        {
            return this._fadeInLengthSamples / SAMPLES_PER_SECOND;
        }

        public function set fadeInSeconds(k:Number):void
        {
            this._fadeInLengthSamples = int((k * SAMPLES_PER_SECOND));
        }

        public function get traxData():TraxData
        {
            return this._traxData;
        }

        public function set volume(k:Number):void
        {
            this._volume = k;
            if (this._soundChannel != null)
            {
                this._soundChannel.soundTransform = new SoundTransform(this._volume);
            }
        }

        public function get length():Number
        {
            return this._lengthSamples / SAMPLES_PER_SECOND;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this.stopImmediately();
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
                    if (this._traxData.hasMetaData)
                    {
                        this._useCutMode = this._traxData.metaCutMode;
                    }
                    if (this._useCutMode)
                    {
                        if (!this.prepareSequence())
                        {
                            Logger.log("Cannot start playback, prepare sequence failed!");
                            return false;
                        }
                    }
                    else
                    {
                        if (!this.prepareLegacySequence())
                        {
                            Logger.log("Cannot start playback, prepare legacy sequence failed!");
                            return false;
                        }
                    }
                }
            }
            return true;
        }

        private function prepareLegacySequence():Boolean
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
            while (_local_2 < this._traxData.channels.length)
            {
                _local_3 = new Map();
                _local_4 = (this._traxData.channels[_local_2] as TraxChannel);
                _local_5 = 0;
                _local_6 = 0;
                _local_7 = 0;
                while (_local_7 < _local_4.itemCount)
                {
                    _local_8 = _local_4.getItem(_local_7).id;
                    _local_9 = (this._samples.getValue(_local_8) as TraxSample);
                    _local_9.setUsageFromSong(this._songId, k);
                    if (_local_9 != null)
                    {
                        _local_10 = this.getSampleBars(_local_9.length);
                        _local_11 = (_local_4.getItem(_local_7).length / _local_10);
                        _local_12 = 0;
                        while (_local_12 < _local_11)
                        {
                            if (_local_8 != 0)
                            {
                                _local_3.add(_local_5, _local_9);
                            }
                            _local_6 = (_local_6 + _local_10);
                            _local_5 = (_local_6 * BAR_LENGTH);
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

        private function prepareSequence():Boolean
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
            while (_local_2 < this._traxData.channels.length)
            {
                _local_3 = new Map();
                _local_4 = (this._traxData.channels[_local_2] as TraxChannel);
                _local_5 = 0;
                _local_6 = 0;
                _local_7 = false;
                _local_8 = 0;
                while (_local_8 < _local_4.itemCount)
                {
                    _local_9 = _local_4.getItem(_local_8).id;
                    _local_10 = (this._samples.getValue(_local_9) as TraxSample);
                    _local_10.setUsageFromSong(this._songId, k);
                    if (_local_10 != null)
                    {
                        _local_11 = _local_6;
                        _local_12 = _local_5;
                        _local_13 = this.getSampleBars(_local_10.length);
                        _local_14 = _local_4.getItem(_local_8).length;
                        while (_local_11 < (_local_6 + _local_14))
                        {
                            if (((!(_local_9 == 0)) || (_local_7)))
                            {
                                _local_3.add(_local_12, _local_10);
                                _local_7 = false;
                            }
                            _local_11 = (_local_11 + _local_13);
                            _local_12 = (_local_11 * BAR_LENGTH);
                            if (_local_11 > (_local_6 + _local_14))
                            {
                                _local_7 = true;
                            }
                        }
                        _local_6 = (_local_6 + _local_4.getItem(_local_8).length);
                        _local_5 = (_local_6 * BAR_LENGTH);
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
                this.stopImmediately();
            }
            if (this._fadeInLengthSamples > 0)
            {
                this._fadeInActive = true;
                this._fadeInSampleCounter = 0;
            }
            this._fadeOutActive = false;
            this._fadeOutSampleCounter = 0;
            this._finished = false;
            this._sound.addEventListener(SampleDataEvent.SAMPLE_DATA, this.onSampleData);
            this._playLengthSamples = (k * SAMPLES_PER_SECOND);
            this._expectedStreamPosition = 0;
            this._bufferUnderRunCount = 0;
            this._soundChannel = this._sound.play();
            this.volume = this._volume;
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
                this.onSampleData(k);
            }
            return true;
        }

        public function stop():Boolean
        {
            if (((this._fadeOutLengthSamples > 0) && (!(this._finished))))
            {
                this.stopWithFadeout();
            }
            else
            {
                this._Str_18840();
            }
            return true;
        }

        private function stopImmediately():void
        {
            this._Str_24945();
            if (this._soundChannel != null)
            {
                this._soundChannel.stop();
                this._soundChannel = null;
            }
            if (this._sound != null)
            {
                this._sound.removeEventListener(SampleDataEvent.SAMPLE_DATA, this.onSampleData);
            }
        }

        private function stopWithFadeout():void
        {
            if (this._fadeoutStopTimer == null)
            {
                this._fadeOutActive = true;
                this._fadeOutSampleCounter = 0;
                this._fadeoutStopTimer = new Timer((this._latencyMs + (this._fadeOutLengthSamples / (SAMPLES_PER_SECOND / 1000))), 1);
                this._fadeoutStopTimer.start();
                this._fadeoutStopTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this._Str_21147);
            }
        }

        private function getSampleBars(k:uint):int
        {
            if (this._useCutMode)
            {
                return Math.round((k / SAMPLES_BAR_LENGTH));
            }
            return Math.ceil((k / SAMPLES_BAR_LENGTH));
        }

        private function getChannelSequenceOffsets():Array
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

        private function mixChannelsIntoBuffer():void
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
            var k:Array = this.getChannelSequenceOffsets();
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
                _local_8 = BUFFER_LENGTH;
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
                            _local_3.setSample(MIXING_BUFFER, _local_9, _local_12);
                            _local_9 = (_local_9 + _local_12);
                        }
                        else
                        {
                            _local_14 = 0;
                            while (_local_14 < _local_12)
                            {
                                var _local_15:* = _local_9++;
                                MIXING_BUFFER[_local_15] = 0;
                                _local_14++;
                            }
                        }
                    }
                    else
                    {
                        if (_local_3 != null)
                        {
                            _local_3.addSample(MIXING_BUFFER, _local_9, _local_12);
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

        private function checkSongFinishing():void
        {
            var k:int = ((this._lengthSamples < this._playLengthSamples) ? this._lengthSamples : ((this._playLengthSamples > 0) ? this._playLengthSamples : this._lengthSamples));
            if (((this._playHead > (k + (this._latencyMs * (SAMPLES_PER_SECOND / 1000)))) && (!(this._finished))))
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

        private function onSampleData(k:SampleDataEvent):void
        {
            if (k.position > this._expectedStreamPosition)
            {
                this._bufferUnderRunCount++;
                Logger.log("Audio buffer under run...");
                this._expectedStreamPosition = k.position;
            }
            if (this.volume > 0)
            {
                this.mixChannelsIntoBuffer();
            }
            var _local_2:int = BUFFER_LENGTH;
            if ((this._lengthSamples - this._playHead) < _local_2)
            {
                _local_2 = (this._lengthSamples - this._playHead);
                if (_local_2 < 0)
                {
                    _local_2 = 0;
                }
            }
            if (this.volume <= 0)
            {
                _local_2 = 0;
            }
            this.writeAudioToOutputStream(k.data, _local_2);
            this._playHead = (this._playHead + BUFFER_LENGTH);
            this._expectedStreamPosition = (this._expectedStreamPosition + BUFFER_LENGTH);
            if (this._soundChannel != null)
            {
                this._latencyMs = (((k.position / SAMPLES_PER_SECOND) * 1000) - this._soundChannel.position);
            }
            this.checkSongFinishing();
        }

        private function writeAudioToOutputStream(k:ByteArray, _arg_2:int):void
        {
            var _local_5:Number;
            var _local_6:Number;
            if (_arg_2 > 0)
            {
                if (((!(this._fadeInActive)) && (!(this._fadeOutActive))))
                {
                    this.writeMixingBufferToOutputStream(k, _arg_2);
                }
                else
                {
                    if (this._fadeInActive)
                    {
                        _local_5 = (1 / this._fadeInLengthSamples);
                        _local_6 = (this._fadeInSampleCounter / Number(this._fadeInLengthSamples));
                        this._fadeInSampleCounter = (this._fadeInSampleCounter + BUFFER_LENGTH);
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
                            this._fadeOutSampleCounter = (this._fadeOutSampleCounter + BUFFER_LENGTH);
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
            while (_local_4 < BUFFER_LENGTH)
            {
                k.writeFloat(_local_3);
                k.writeFloat(_local_3);
                _local_4++;
            }
        }

        private function writeMixingBufferToOutputStream(k:ByteArray, _arg_2:int):void
        {
            var _local_3:Number = 0;
            var _local_4:int;
            while (_local_4 < _arg_2)
            {
                _local_3 = (Number(MIXING_BUFFER[_local_4]) * TraxSample._Str_11575);
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
                _local_5 = ((Number(MIXING_BUFFER[_local_6]) * TraxSample._Str_11575) * _arg_3);
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
                        _local_5 = (Number(MIXING_BUFFER[_local_6]) * TraxSample._Str_11575);
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
            this.stopImmediately();
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
