package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users._Str_6385;

    public class _Str_6293 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_6293(k:Function)
        {
            super(k, _Str_6385);
        }

        public function get reason():int
        {
            return _Str_6385(_parser).reason;
        }

        public function get _Str_3916():int
        {
            return _Str_6385(_parser)._Str_3916;
        }
    }
}
