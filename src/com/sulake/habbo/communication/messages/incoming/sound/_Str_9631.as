package com.sulake.habbo.communication.messages.incoming.sound
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.sound.OfficialSongIdMessageParser;

    public class _Str_9631 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9631(k:Function)
        {
            super(k, OfficialSongIdMessageParser);
        }

        public function getParser():OfficialSongIdMessageParser
        {
            return this._parser as OfficialSongIdMessageParser;
        }
    }
}
