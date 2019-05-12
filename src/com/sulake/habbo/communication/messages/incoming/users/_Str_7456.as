package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users._Str_8585;

    public class _Str_7456 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7456(k:Function)
        {
            super(k, _Str_8585);
        }

        public function get groupId():int
        {
            return _Str_8585(_parser).groupId;
        }
    }
}
