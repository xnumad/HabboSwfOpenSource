package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users._Str_6330;

    public class _Str_8702 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8702(k:Function)
        {
            super(k, _Str_6330);
        }

        public function get _Str_16798():int
        {
            return _Str_6330(_parser)._Str_16798;
        }

        public function get _Str_17975():int
        {
            return _Str_6330(_parser)._Str_17975;
        }
    }
}
