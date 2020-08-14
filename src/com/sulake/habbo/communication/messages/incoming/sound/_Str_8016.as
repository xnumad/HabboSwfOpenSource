package com.sulake.habbo.communication.messages.incoming.sound
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.sound.NowPlayingMessageParser;

    public class _Str_8016 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8016(k:Function)
        {
            super(k, NowPlayingMessageParser);
        }

        public function getParser():NowPlayingMessageParser
        {
            return this._parser as NowPlayingMessageParser;
        }
    }
}
