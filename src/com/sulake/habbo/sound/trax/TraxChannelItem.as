package com.sulake.habbo.sound.trax
{
    public class TraxChannelItem 
    {
        private var _id:int;
        private var _length:int;

        public function TraxChannelItem(id:int, length:int)
        {
            this._id = id;
            this._length = length;
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
