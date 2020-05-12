package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.UsersMessageParser;

    public class UsersEvent extends MessageEvent implements IMessageEvent 
    {
        public function UsersEvent(k:Function)
        {
            super(k, UsersMessageParser);
        }

        public function getParser():UsersMessageParser
        {
            return _parser as UsersMessageParser;
        }
    }
}
