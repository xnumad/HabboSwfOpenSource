package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.HabboGroupDeactivatedMessageParser;

    public class _Str_7456 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7456(k:Function)
        {
            super(k, HabboGroupDeactivatedMessageParser);
        }

        public function get groupId():int
        {
            return HabboGroupDeactivatedMessageParser(_parser).groupId;
        }
    }
}
