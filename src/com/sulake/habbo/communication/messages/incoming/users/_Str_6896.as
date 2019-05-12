package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users._Str_6619;

    public class _Str_6896 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_6896(k:Function)
        {
            super(k, _Str_6619);
        }

        public function get data():_Str_2891
        {
            return _Str_6619(_parser).data;
        }

        public function get _Str_3916():int
        {
            return _Str_6619(_parser)._Str_3916;
        }
    }
}
