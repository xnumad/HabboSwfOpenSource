package com.sulake.habbo.communication.messages.incoming.sound
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.sound.TraxSongInfoMessageParser;

    public class TraxSongInfoMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function TraxSongInfoMessageEvent(k:Function)
        {
            super(k, TraxSongInfoMessageParser);
        }

        public function getParser():TraxSongInfoMessageParser
        {
            return this._parser as TraxSongInfoMessageParser;
        }
    }
}
