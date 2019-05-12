package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users._Str_8198;

    public class _Str_7294 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7294(k:Function)
        {
            super(k, _Str_8198);
        }

        public function get reason():int
        {
            return _Str_8198(_parser).reason;
        }
    }
}
