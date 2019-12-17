package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_5700;

    public class _Str_4187 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_4187(k:Function)
        {
            super(k, _Str_5700);
        }

        public function getParser():_Str_5700
        {
            return _parser as _Str_5700;
        }
    }
}
