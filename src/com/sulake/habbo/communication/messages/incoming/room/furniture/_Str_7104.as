package com.sulake.habbo.communication.messages.incoming.room.furniture
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture._Str_7443;

    public class _Str_7104 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7104(k:Function)
        {
            super(k, _Str_7443);
        }

        public function getParser():_Str_7443
        {
            return _parser as _Str_7443;
        }
    }
}
