package com.sulake.habbo.communication.messages.parser.sound
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.sound.SongEntry;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class JukeBoxPlayListAddSongMessageParser implements IMessageParser 
    {
        private var _entry:SongEntry;


        public function get entry():SongEntry
        {
            return this._entry;
        }

        public function flush():Boolean
        {
            this._entry = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._entry = new SongEntry(k.readInteger(), k.readInteger(), k.readString(), k.readString());
            return true;
        }
    }
}
