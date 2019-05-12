package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users._Str_6411;

    public class _Str_5979 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5979(k:Function)
        {
            super(k, _Str_6411);
        }

        public function userId():int
        {
            return _Str_6411(_parser).userId;
        }

        public function _Str_10882():int
        {
            return _Str_6411(_parser)._Str_10882;
        }
    }
}
