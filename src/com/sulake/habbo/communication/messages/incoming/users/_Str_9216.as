package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.ScrSendKickbackInfoMessageParser;

    public class _Str_9216 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9216(k:Function)
        {
            super(k, ScrSendKickbackInfoMessageParser);
        }

        public function getParser():ScrSendKickbackInfoMessageParser
        {
            return _parser as ScrSendKickbackInfoMessageParser;
        }
    }
}
