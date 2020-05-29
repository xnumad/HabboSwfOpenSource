package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.ExtendedProfileChangedMessageParser;

    public class _Str_7417 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7417(k:Function)
        {
            super(k, ExtendedProfileChangedMessageParser);
        }

        public function get userId():int
        {
            return ExtendedProfileChangedMessageParser(_parser).userId;
        }
    }
}
