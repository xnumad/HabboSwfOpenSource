package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.HabboGroupBadgesMessageParser;
    import com.sulake.core.utils.Map;

    public class _Str_5458 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5458(k:Function)
        {
            super(k, HabboGroupBadgesMessageParser);
        }

        public function get badges():Map
        {
            return (_parser as HabboGroupBadgesMessageParser).badges;
        }
    }
}
