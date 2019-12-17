package com.sulake.habbo.communication.messages.incoming.room.furniture
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture._Str_7736;

    public class _Str_8382 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8382(k:Function)
        {
            super(k, _Str_7736);
        }

        public function getParser():_Str_7736
        {
            return _parser as _Str_7736;
        }
    }
}
