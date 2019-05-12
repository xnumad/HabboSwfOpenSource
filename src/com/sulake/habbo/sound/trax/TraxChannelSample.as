package com.sulake.habbo.sound.trax
{
    import __AS3__.vec.Vector;

    public class TraxChannelSample 
    {
        private var _sample:TraxSample = null;
        private var _offset:int = 0;

        public function TraxChannelSample(k:TraxSample, _arg_2:int)
        {
            this._sample = k;
            this._offset = _arg_2;
        }

        public function _Str_17440(k:Vector.<int>, _arg_2:int, _arg_3:int):void
        {
            this._offset = this._sample._Str_17440(k, _arg_2, _arg_3, this._offset);
        }

        public function _Str_16849(k:Vector.<int>, _arg_2:int, _arg_3:int):void
        {
            this._offset = this._sample._Str_16849(k, _arg_2, _arg_3, this._offset);
        }
    }
}
