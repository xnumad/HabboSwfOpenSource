package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users._Str_8926;

    public class _Str_3921 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_3921(k:Function)
        {
            super(k, _Str_8926);
        }

        public function get data():_Str_2974
        {
            return _Str_8926(_parser).data;
        }
    }
}
