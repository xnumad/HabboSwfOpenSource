package com.sulake.habbo.communication.messages.incoming.sound
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.sound.OfficialSongIdMessageParser;

    public class OfficialSongIdMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function OfficialSongIdMessageEvent(k:Function)
        {
            super(k, OfficialSongIdMessageParser);
        }

        public function getParser():OfficialSongIdMessageParser
        {
            return this._parser as OfficialSongIdMessageParser;
        }
    }
}
