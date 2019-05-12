package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users._Str_8900;

    public class _Str_7878 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7878(k:Function)
        {
            super(k, _Str_8900);
        }

        public function get data():_Str_5372
        {
            return _Str_8900(_parser).data;
        }
    }
}
