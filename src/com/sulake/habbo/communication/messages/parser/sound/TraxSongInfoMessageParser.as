package com.sulake.habbo.communication.messages.parser.sound
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.sound.SongInfoEntry;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class TraxSongInfoMessageParser implements IMessageParser
    {
        private var _songs:Array;


        public function get songs():Array
        {
            return this._songs;
        }

        public function flush():Boolean
        {
            this._songs = new Array();
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var id:int;
            var _local_3:String;
            var name:String;
            var data:String;
            var length:int;
            var creator:String;
            var _local_10:SongInfoEntry;
            var _local_8:int = k.readInteger();
            var _local_9:int;
            while (_local_9 < _local_8)
            {
                id = k.readInteger();
                _local_3 = k.readString();
                name = k.readString();
                data = k.readString();
                length = k.readInteger();
                creator = k.readString();
                _local_10 = new SongInfoEntry(id, length, name, creator, data);
                this._songs.push(_local_10);
                _local_9++;
            }
            return true;
        }
    }
}
