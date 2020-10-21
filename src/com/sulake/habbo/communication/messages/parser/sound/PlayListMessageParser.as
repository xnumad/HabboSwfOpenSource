package com.sulake.habbo.communication.messages.parser.sound
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.sound.PlayListEntry;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PlayListMessageParser implements IMessageParser
    {
        private var _synchronizationCount:int;
        private var _playlist:Array;


        public function get synchronizationCount():int
        {
            return this._synchronizationCount;
        }

        public function get _Str_24122():Array
        {
            return this._playlist;
        }

        public function flush():Boolean
        {
            this._synchronizationCount = -1;
            this._playlist = [];
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:String;
            var _local_7:String;
            this._synchronizationCount = k.readInteger();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = k.readInteger();
                _local_5 = k.readInteger();
                _local_6 = k.readString();
                _local_7 = k.readString();
                this._playlist.push(new PlayListEntry(_local_4, _local_5, _local_6, _local_7));
                _local_3++;
            }
            return true;
        }
    }
}
