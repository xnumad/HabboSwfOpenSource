package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users._Str_6592;

    public class _Str_6633 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_6633(k:Function)
        {
            super(k, _Str_6592);
        }

        public function get baseRoomId():int
        {
            return _Str_6592(_parser).baseRoomId;
        }

        public function get groupId():int
        {
            return _Str_6592(_parser).groupId;
        }
    }
}
