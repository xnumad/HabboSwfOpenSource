package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users._Str_9332;

    public class _Str_8194 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8194(k:Function)
        {
            super(k, _Str_9332);
        }

        public function get data():_Str_5600
        {
            return _Str_9332(_parser).data;
        }
    }
}
