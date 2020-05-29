package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.HandItemReceivedMessageParser;

    public class _Str_8702 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8702(k:Function)
        {
            super(k, HandItemReceivedMessageParser);
        }

        public function get giverUserId():int
        {
            return HandItemReceivedMessageParser(_parser).giverUserId;
        }

        public function get handItemType():int
        {
            return HandItemReceivedMessageParser(_parser).handItemType;
        }
    }
}
