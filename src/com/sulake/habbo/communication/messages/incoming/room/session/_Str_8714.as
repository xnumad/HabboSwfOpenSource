package com.sulake.habbo.communication.messages.incoming.room.session
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.session.YouArePlayingGameMessageParser;

    public class _Str_8714 extends MessageEvent 
    {
        public function _Str_8714(k:Function)
        {
            super(k, YouArePlayingGameMessageParser);
        }

        public function getParser():YouArePlayingGameMessageParser
        {
            return _parser as YouArePlayingGameMessageParser;
        }
    }
}
