package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.UsersMessageParser;

    public class _Str_4085 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_4085(k:Function)
        {
            super(k, UsersMessageParser);
        }

        public function getParser():UsersMessageParser
        {
            return _parser as UsersMessageParser;
        }
    }
}
