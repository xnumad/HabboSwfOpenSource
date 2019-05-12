package com.sulake.habbo.sound.trax
{
    import com.sulake.core.runtime.IDisposable;
    import __AS3__.vec.Vector;
    import flash.utils.ByteArray;
    import __AS3__.vec.*;

    public class TraxSample implements IDisposable 
    {
        public static const SAMPLE_FREQUENCY_44KHZ:String = "sample_44khz";
        public static const SAMPLE_FREQUENCY_22KHZ:String = "sample_22khz";
        public static const SAMPLE_FREQUENCY_11KHZ:String = "sample_11khz";
        public static const SAMPLE_SCALE_16BIT:String = "sample_16bit";
        public static const SAMPLE_SCALE_8BIT:String = "sample_8bit";
        public static const _Str_11575:Number = (1 / 0x8000);//3.0517578125E-5
        private static const _Str_14308:int = 32;
        private static const MASK_8BIT:int = 0xFF;
        private static const MASK_16BIT:int = 0xFFFF;
        private static const OFFSET_8BIT:int = 127;
        private static const OFFSET_16BIT:int = 32767;

        private var _disposed:Boolean = false;
        private var _sampleData:Vector.<int> = null;
        private var _id:int;
        private var _samplesPerValue:int = 2;
        private var _sampleRepeats:int = 1;
        private var _usageList:Array;
        private var _usageTimeStamp:uint;

        public function TraxSample(k:ByteArray, _arg_2:int, _arg_3:String="sample_44khz", _arg_4:String="sample_16bit")
        {
            var _local_12:Number;
            var _local_13:int;
            var _local_14:int;
            var _local_15:Number;
            var _local_16:Number;
            this._usageList = [];
            super();
            this._id = _arg_2;
            var _local_5:* = 65536;
            switch (_arg_3)
            {
                case SAMPLE_FREQUENCY_22KHZ:
                    this._sampleRepeats = 2;
                    break;
                case SAMPLE_FREQUENCY_11KHZ:
                    this._sampleRepeats = 4;
                    break;
                default:
                    this._sampleRepeats = 1;
            }
            switch (_arg_4)
            {
                case SAMPLE_SCALE_8BIT:
                    this._samplesPerValue = 4;
                    _local_5 = 0x0100;
                    break;
                default:
                    this._samplesPerValue = 2;
                    _local_5 = 65536;
            }
            var _local_6:int = (this._samplesPerValue * this._sampleRepeats);
            var _local_7:int = (k.length / 8);
            _local_7 = (int((_local_7 / _local_6)) * _local_6);
            this._sampleData = new Vector.<int>((_local_7 / _local_6), true);
            var _local_8:Number = (1 / (Number(_local_5) / 2));
            k.position = 0;
            var _local_9:int;
            var _local_10:int = (_local_7 / this._sampleRepeats);
            var _local_11:int;
            while (_local_11 < _local_10)
            {
                _local_12 = k.readFloat();
                k.readFloat();
                _local_13 = 2;
                while (_local_13 <= this._sampleRepeats)
                {
                    _local_15 = k.readFloat();
                    k.readFloat();
                    _local_16 = Number(_local_13);
                    _local_12 = (((_local_12 * (_local_16 - 1)) / _local_16) + (Number(_local_15) / _local_16));
                    _local_13++;
                }
                if (_local_11 >= ((_local_10 - 1) - _Str_14308))
                {
                    _local_12 = (_local_12 * (((_local_10 - _local_11) - 1) / Number(_Str_14308)));
                }
                _local_14 = ((_local_12 + 1) / _local_8);
                if (_local_14 < 0)
                {
                    _local_14 = 0;
                }
                else
                {
                    if (_local_14 >= _local_5)
                    {
                        _local_14 = (_local_5 - 1);
                    }
                }
                _local_9 = (_local_9 * _local_5);
                _local_9 = (_local_9 + _local_14);
                if ((_local_11 % this._samplesPerValue) == (this._samplesPerValue - 1))
                {
                    this._sampleData[int((_local_11 / this._samplesPerValue))] = _local_9;
                    _local_9 = 0;
                }
                _local_11++;
            }
        }

        public function get id():int
        {
            return this._id;
        }

        public function get length():uint
        {
            return (this._sampleData.length * this._samplesPerValue) * this._sampleRepeats;
        }

        public function get _Str_10605():int
        {
            return this._usageList.length;
        }

        public function get _Str_14695():int
        {
            return this._usageTimeStamp;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this._sampleData = null;
                this._usageList = null;
            }
        }

        public function _Str_17440(k:Vector.<int>, _arg_2:int, _arg_3:int, _arg_4:int):int
        {
            var _local_8:int;
            var _local_9:int;
            var _local_10:int;
            if (((k == null) || (this._sampleData == null)))
            {
                return _arg_4;
            }
            var _local_5:int = (this._samplesPerValue * this._sampleRepeats);
            _arg_4 = (_arg_4 / _local_5);
            if (_arg_2 < 0)
            {
                _arg_3 = (_arg_3 + _arg_2);
                _arg_2 = 0;
            }
            if (_arg_3 > (k.length - _arg_2))
            {
                _arg_3 = (k.length - _arg_2);
            }
            var _local_6:int = (_arg_3 / _local_5);
            var _local_7:int;
            if (_local_6 > (this._sampleData.length - _arg_4))
            {
                _local_7 = ((_local_6 - (this._sampleData.length - _arg_4)) * _local_5);
                _local_6 = (this._sampleData.length - _arg_4);
                if (_local_7 > (k.length - _arg_2))
                {
                    _local_7 = (k.length - _arg_2);
                }
            }
            if (this._sampleRepeats == 1)
            {
                if (this._samplesPerValue == 2)
                {
                    while (_local_6-- > 0)
                    {
                        _local_8 = this._sampleData[_arg_4++];
                        var _local_11:* = _arg_2++;
                        k[_local_11] = (((_local_8 >> 16) & MASK_16BIT) - OFFSET_16BIT);
                        var _local_12:* = _arg_2++;
                        k[_local_12] = ((_local_8 & MASK_16BIT) - OFFSET_16BIT);
                    }
                }
                else
                {
                    if (this._samplesPerValue == 4)
                    {
                        while (_local_6-- > 0)
                        {
                            _local_8 = this._sampleData[_arg_4++];
                            _local_11 = _arg_2++;
                            k[_local_11] = ((((_local_8 >> 24) & MASK_8BIT) - OFFSET_8BIT) << 8);
                            _local_12 = _arg_2++;
                            k[_local_12] = ((((_local_8 >> 16) & MASK_8BIT) - OFFSET_8BIT) << 8);
                            var _local_13:* = _arg_2++;
                            k[_local_13] = ((((_local_8 >> 8) & MASK_8BIT) - OFFSET_8BIT) << 8);
                            var _local_14:* = _arg_2++;
                            k[_local_14] = (((_local_8 & MASK_8BIT) - OFFSET_8BIT) << 8);
                        }
                    }
                }
            }
            else
            {
                if (this._sampleRepeats >= 2)
                {
                    _local_9 = 0;
                    _local_10 = 0;
                    if (this._samplesPerValue == 2)
                    {
                        while (_local_6-- > 0)
                        {
                            _local_8 = this._sampleData[_arg_4++];
                            _local_10 = (((_local_8 >> 16) & MASK_16BIT) - OFFSET_16BIT);
                            _local_9 = this._sampleRepeats;
                            while (_local_9 > 0)
                            {
                                _local_11 = _arg_2++;
                                k[_local_11] = _local_10;
                                _local_9--;
                            }
                            _local_10 = ((_local_8 & MASK_16BIT) - OFFSET_16BIT);
                            _local_9 = this._sampleRepeats;
                            while (_local_9 > 0)
                            {
                                _local_11 = _arg_2++;
                                k[_local_11] = _local_10;
                                _local_9--;
                            }
                        }
                    }
                    else
                    {
                        if (this._samplesPerValue == 4)
                        {
                            while (_local_6-- > 0)
                            {
                                _local_8 = this._sampleData[_arg_4++];
                                _local_10 = ((((_local_8 >> 24) & MASK_8BIT) - OFFSET_8BIT) << 8);
                                _local_9 = this._sampleRepeats;
                                while (_local_9 > 0)
                                {
                                    _local_11 = _arg_2++;
                                    k[_local_11] = _local_10;
                                    _local_9--;
                                }
                                _local_10 = ((((_local_8 >> 16) & MASK_8BIT) - OFFSET_8BIT) << 8);
                                _local_9 = this._sampleRepeats;
                                while (_local_9 > 0)
                                {
                                    _local_11 = _arg_2++;
                                    k[_local_11] = _local_10;
                                    _local_9--;
                                }
                                _local_10 = ((((_local_8 >> 8) & MASK_8BIT) - OFFSET_8BIT) << 8);
                                _local_9 = this._sampleRepeats;
                                while (_local_9 > 0)
                                {
                                    _local_11 = _arg_2++;
                                    k[_local_11] = _local_10;
                                    _local_9--;
                                }
                                _local_10 = (((_local_8 & MASK_8BIT) - OFFSET_8BIT) << 8);
                                _local_9 = this._sampleRepeats;
                                while (_local_9 > 0)
                                {
                                    _local_11 = _arg_2++;
                                    k[_local_11] = _local_10;
                                    _local_9--;
                                }
                            }
                        }
                    }
                }
            }
            while (_local_7-- > 0)
            {
                _local_11 = _arg_2++;
                k[_local_11] = 0;
            }
            return _arg_4 * _local_5;
        }

        public function _Str_16849(k:Vector.<int>, _arg_2:int, _arg_3:int, _arg_4:int):int
        {
            var _local_7:int;
            var _local_8:int;
            var _local_9:int;
            if (((k == null) || (this._sampleData == null)))
            {
                return _arg_4;
            }
            var _local_5:int = (this._samplesPerValue * this._sampleRepeats);
            _arg_4 = (_arg_4 / _local_5);
            if (_arg_2 < 0)
            {
                _arg_3 = (_arg_3 + _arg_2);
                _arg_2 = 0;
            }
            if (_arg_3 > (k.length - _arg_2))
            {
                _arg_3 = (k.length - _arg_2);
            }
            var _local_6:int = (_arg_3 / _local_5);
            if (_local_6 > (this._sampleData.length - _arg_4))
            {
                _local_6 = (this._sampleData.length - _arg_4);
            }
            if (this._sampleRepeats == 1)
            {
                if (this._samplesPerValue == 2)
                {
                    while (_local_6-- > 0)
                    {
                        _local_7 = this._sampleData[_arg_4++];
                        var _local_10:* = _arg_2++;
                        k[_local_10] = (k[_local_10] + (((_local_7 >> 16) & MASK_16BIT) - OFFSET_16BIT));
                        var _local_11:* = _arg_2++;
                        k[_local_11] = (k[_local_11] + ((_local_7 & MASK_16BIT) - OFFSET_16BIT));
                    }
                }
                else
                {
                    if (this._samplesPerValue == 4)
                    {
                        while (_local_6-- > 0)
                        {
                            _local_7 = this._sampleData[_arg_4++];
                            _local_10 = _arg_2++;
                            k[_local_10] = (k[_local_10] + ((((_local_7 >> 24) & MASK_8BIT) - OFFSET_8BIT) << 8));
                            _local_11 = _arg_2++;
                            k[_local_11] = (k[_local_11] + ((((_local_7 >> 16) & MASK_8BIT) - OFFSET_8BIT) << 8));
                            var _local_12:* = _arg_2++;
                            k[_local_12] = (k[_local_12] + ((((_local_7 >> 8) & MASK_8BIT) - OFFSET_8BIT) << 8));
                            var _local_13:* = _arg_2++;
                            k[_local_13] = (k[_local_13] + (((_local_7 & MASK_8BIT) - OFFSET_8BIT) << 8));
                        }
                    }
                }
            }
            else
            {
                if (this._sampleRepeats >= 2)
                {
                    _local_8 = 0;
                    _local_9 = 0;
                    if (this._samplesPerValue == 2)
                    {
                        while (_local_6-- > 0)
                        {
                            _local_7 = this._sampleData[_arg_4++];
                            _local_9 = (((_local_7 >> 16) & MASK_16BIT) - OFFSET_16BIT);
                            _local_8 = this._sampleRepeats;
                            while (_local_8 > 0)
                            {
                                _local_10 = _arg_2++;
                                k[_local_10] = (k[_local_10] + _local_9);
                                _local_8--;
                            }
                            _local_9 = ((_local_7 & MASK_16BIT) - OFFSET_16BIT);
                            _local_8 = this._sampleRepeats;
                            while (_local_8 > 0)
                            {
                                _local_10 = _arg_2++;
                                k[_local_10] = (k[_local_10] + _local_9);
                                _local_8--;
                            }
                        }
                    }
                    else
                    {
                        if (this._samplesPerValue == 4)
                        {
                            while (_local_6-- > 0)
                            {
                                _local_7 = this._sampleData[_arg_4++];
                                _local_9 = ((((_local_7 >> 24) & MASK_8BIT) - OFFSET_8BIT) << 8);
                                _local_8 = this._sampleRepeats;
                                while (_local_8 > 0)
                                {
                                    _local_10 = _arg_2++;
                                    k[_local_10] = (k[_local_10] + _local_9);
                                    _local_8--;
                                }
                                _local_9 = ((((_local_7 >> 16) & MASK_8BIT) - OFFSET_8BIT) << 8);
                                _local_8 = this._sampleRepeats;
                                while (_local_8 > 0)
                                {
                                    _local_10 = _arg_2++;
                                    k[_local_10] = (k[_local_10] + _local_9);
                                    _local_8--;
                                }
                                _local_9 = ((((_local_7 >> 8) & MASK_8BIT) - OFFSET_8BIT) << 8);
                                _local_8 = this._sampleRepeats;
                                while (_local_8 > 0)
                                {
                                    _local_10 = _arg_2++;
                                    k[_local_10] = (k[_local_10] + _local_9);
                                    _local_8--;
                                }
                                _local_9 = (((_local_7 & MASK_8BIT) - OFFSET_8BIT) << 8);
                                _local_8 = this._sampleRepeats;
                                while (_local_8 > 0)
                                {
                                    _local_10 = _arg_2++;
                                    k[_local_10] = (k[_local_10] + _local_9);
                                    _local_8--;
                                }
                            }
                        }
                    }
                }
            }
            return _arg_4 * _local_5;
        }

        public function _Str_21520(k:int, _arg_2:uint):void
        {
            if (this._usageList == null)
            {
                return;
            }
            if (this._usageList.indexOf(k) == -1)
            {
                this._usageList.push(k);
            }
            this._usageTimeStamp = _arg_2;
        }

        public function _Str_26183(k:int):Boolean
        {
            if (this._usageList == null)
            {
                return false;
            }
            return !(this._usageList.indexOf(k) == -1);
        }
    }
}
