package com.sulake.habbo.communication.messages.incoming.room.session
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.session.YouAreSpectatorMessageParser;

    public class _Str_8292 extends MessageEvent 
    {
        public function _Str_8292(k:Function)
        {
            super(k, YouAreSpectatorMessageParser);
        }

        public function getParser():YouAreSpectatorMessageParser
        {
            return _parser as YouAreSpectatorMessageParser;
        }
    }
}
