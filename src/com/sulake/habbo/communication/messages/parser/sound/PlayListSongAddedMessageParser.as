package com.sulake.habbo.communication.messages.parser.sound
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.sound.PlayListEntry;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PlayListSongAddedMessageParser implements IMessageParser
    {
        private var _entry:PlayListEntry;


        public function get entry():PlayListEntry
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
            this._entry = new PlayListEntry(k.readInteger(), k.readInteger(), k.readString(), k.readString());
            return true;
        }
    }
}
