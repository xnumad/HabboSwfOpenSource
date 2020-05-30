package com.sulake.habbo.communication.messages.incoming.room.session
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.session.FlatAccessibleMessageParser;

    public class _Str_4265 extends MessageEvent 
    {
        public function _Str_4265(k:Function)
        {
            super(k, FlatAccessibleMessageParser);
        }

        public function getParser():FlatAccessibleMessageParser
        {
            return _parser as FlatAccessibleMessageParser;
        }
    }
}
