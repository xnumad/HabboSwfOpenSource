package com.sulake.habbo.sound
{
    import com.sulake.core.runtime.IUpdateReceiver;
    import flash.media.Sound;
    import flash.utils.ByteArray;
    import flash.media.SoundTransform;

    public class HabboSoundWithPitch extends HabboSoundBase implements IUpdateReceiver 
    {
        private const _Str_19531:uint = 50;
        private const _Str_19780:uint = 175;

        private var _pitch:Number;
        private var _dynamicSound:Sound;
        private var _loadedSamples:ByteArray;
        private var _numSamples:int;
        private var _updateMs:uint = 0;
        private var _startMs:uint = 0;
        private var _fadeComplete:Boolean = false;

        public function HabboSoundWithPitch(k:Sound, _arg_2:Number=1)
        {
            super(k);
            this._pitch = _arg_2;
            this._dynamicSound = new Sound();
            this._Str_23148();
            this._Str_19664(this._pitch);
        }

        override public function dispose():void
        {
            super.dispose();
            this._dynamicSound = null;
            this._loadedSamples.clear();
            this._loadedSamples = null;
        }

        override public function play(k:Number=0):Boolean
        {
            this.stop();
            this._startMs = this._updateMs;
            this._fadeComplete = false;
            _Str_22198(false);
            _Str_20695(this._dynamicSound.play(0, 0, new SoundTransform(0)));
            return true;
        }

        override public function stop():Boolean
        {
            if (_Str_15495() != null)
            {
                _Str_15495().stop();
            }
            return true;
        }

        public function update(k:uint):void
        {
            this._updateMs = (this._updateMs + k);
            var _local_2:uint = (this._updateMs - this._startMs);
            if (((this._startMs > 0) && (_local_2 < this._Str_19531)))
            {
                _Str_7399(0);
            }
            else
            {
                if ((((this._startMs > 0) && (_local_2 >= this._Str_19531)) && (_local_2 < this._Str_19780)))
                {
                    _Str_7399((_Str_3206 * (Number(_local_2) / this._Str_19780)));
                }
                else
                {
                    if (!this._fadeComplete)
                    {
                        _Str_7399(_Str_3206);
                        this._fadeComplete = true;
                    }
                }
            }
        }

        public function get disposed():Boolean
        {
            return this._loadedSamples == null;
        }

        public function _Str_19664(k:Number):void
        {
            var _local_5:Number;
            this._pitch = k;
            var _local_2:ByteArray = new ByteArray();
            var _local_3:uint = int(((this._loadedSamples.length / 4) * this._pitch));
            var _local_4:Number = 0;
            var _local_6:int;
            while (((_local_6 < _local_3) && ((int(_local_4) * 4) < this._loadedSamples.length)))
            {
                this._loadedSamples.position = (int(_local_4) * 4);
                _local_5 = this._loadedSamples.readFloat();
                _local_2.writeFloat(_local_5);
                _local_2.writeFloat(_local_5);
                _local_4 = (_local_4 + this._pitch);
                _local_6++;
            }
            _local_2.position = 0;
            this._dynamicSound.loadPCMFromByteArray(_local_2, (_local_2.length / 8), "float");
        }

        private function _Str_23148():void
        {
            var _local_2:int;
            var _local_3:Number;
            var k:ByteArray = new ByteArray();
            _Str_4166.extract(k, int((_Str_4166.length * 44.1)), 0);
            this._loadedSamples = new ByteArray();
            this._numSamples = (k.length / 8);
            k.position = 0;
            _local_2 = 0;
            while (_local_2 < this._numSamples)
            {
                _local_3 = k.readFloat();
                k.readFloat();
                this._loadedSamples.writeFloat(_local_3);
                _local_2++;
            }
        }
    }
}
