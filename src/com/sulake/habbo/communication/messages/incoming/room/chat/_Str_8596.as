package com.sulake.habbo.communication.messages.incoming.room.chat
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.chat._Str_8568;

    public class _Str_8596 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8596(k:Function)
        {
            super(k, _Str_8568);
        }

        public function get _Str_18555():int
        {
            return _Str_8568(_parser)._Str_18555;
        }
    }
}
