package com.sulake.habbo.sound.trax
{
    public class TraxChannel 
    {
        private var _id:int;
        private var _items:Array;

        public function TraxChannel(k:int)
        {
            this._id = k;
            this._items = [];
        }

        public function get _Str_11307():int
        {
            return this._items.length;
        }

        public function _Str_25570(k:TraxChannelItem):void
        {
            this._items.push(k);
        }

        public function _Str_2990(k:int):TraxChannelItem
        {
            return this._items[k] as TraxChannelItem;
        }
    }
}
