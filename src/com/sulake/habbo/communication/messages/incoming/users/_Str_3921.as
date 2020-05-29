package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.HabboGroupDetailsMessageParser;

    public class _Str_3921 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_3921(k:Function)
        {
            super(k, HabboGroupDetailsMessageParser);
        }

        public function get data():HabboGroupDetailsData
        {
            return HabboGroupDetailsMessageParser(_parser).data;
        }
    }
}
