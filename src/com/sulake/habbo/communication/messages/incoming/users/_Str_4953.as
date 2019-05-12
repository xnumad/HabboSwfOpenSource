package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users._Str_8936;

    public class _Str_4953 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_4953(k:Function)
        {
            super(k, _Str_8936);
        }

        public function get userId():int
        {
            return (_parser as _Str_8936).userId;
        }

        public function get _Str_10295():int
        {
            return (_parser as _Str_8936)._Str_10295;
        }
    }
}
