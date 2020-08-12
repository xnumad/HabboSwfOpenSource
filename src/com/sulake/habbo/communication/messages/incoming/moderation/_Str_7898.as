package com.sulake.habbo.communication.messages.incoming.moderation
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation.UserChatlogMessageParser;

    public class _Str_7898 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7898(k:Function)
        {
            super(k, UserChatlogMessageParser);
        }

        public function getParser():UserChatlogMessageParser
        {
            return _parser as UserChatlogMessageParser;
        }
    }
}
