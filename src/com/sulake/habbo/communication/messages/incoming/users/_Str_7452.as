package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users._Str_9319;

    public class _Str_7452 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7452(k:Function)
        {
            super(k, _Str_9319);
        }

        public function get guilds():Array
        {
            return _Str_9319(_parser).guilds;
        }
    }
}
