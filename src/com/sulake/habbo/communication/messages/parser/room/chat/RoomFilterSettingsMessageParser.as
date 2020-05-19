package com.sulake.habbo.communication.messages.parser.room.chat
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RoomFilterSettingsMessageParser implements IMessageParser 
    {
        private var _badWords:Array;


        public function get badWords():Array
        {
            return this._badWords;
        }

        public function flush():Boolean
        {
            return false;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._badWords = new Array();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._badWords.push(k.readString());
                _local_3++;
            }
            return false;
        }
    }
}
