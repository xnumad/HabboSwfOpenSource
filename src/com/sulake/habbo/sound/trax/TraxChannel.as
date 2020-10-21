package com.sulake.habbo.sound.trax
{
    public class TraxChannel 
    {
        private var _id:int;
        private var _items:Array;

        public function TraxChannel(id:int)
        {
            this._id = id;
            this._items = [];
        }

        public function get itemCount():int
        {
            return this._items.length;
        }

        public function addChannelItem(k:TraxChannelItem):void
        {
            this._items.push(k);
        }

        public function getItem(k:int):TraxChannelItem
        {
            return this._items[k] as TraxChannelItem;
        }
    }
}
