package com.sulake.habbo.communication.messages.incoming.sound
{
    public class SongInfoEntry extends PlayListEntry
    {
        private var _data:String = "";

        public function SongInfoEntry(id:int, length:int, name:String, creator:String, data:String)
        {
            super(id, length, name, creator);
            this._data = data;
        }

        public function get data():String
        {
            return this._data;
        }
    }
}
