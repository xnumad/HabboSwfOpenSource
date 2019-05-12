package com.sulake.habbo.sound.trax
{
    public class TraxChannelItem 
    {
        private var _id:int;
        private var _length:int;

        public function TraxChannelItem(k:int, _arg_2:int)
        {
            this._id = k;
            this._length = _arg_2;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get length():int
        {
            return this._length;
        }
    }
}
