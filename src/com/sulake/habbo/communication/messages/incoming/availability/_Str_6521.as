package com.sulake.habbo.communication.messages.incoming.availability
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.availability._Str_7315;

    public class _Str_6521 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_6521(k:Function)
        {
            super(k, _Str_7315);
        }

        public function getParser():_Str_7315
        {
            return _parser as _Str_7315;
        }
    }
}
