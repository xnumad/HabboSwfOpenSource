package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users._Str_9596;

    public class _Str_5093 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5093(k:Function)
        {
            super(k, _Str_9596);
        }

        public function get groupId():int
        {
            return _Str_9596(_parser).groupId;
        }
    }
}
