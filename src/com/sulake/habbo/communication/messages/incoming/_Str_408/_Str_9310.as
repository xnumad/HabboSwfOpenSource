package com.sulake.habbo.communication.messages.incoming._Str_408
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.mysterybox._Str_7765;

    public class _Str_9310 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9310(k:Function)
        {
            super(k, _Str_7765);
        }

        public function getParser():_Str_7765
        {
            return _parser as _Str_7765;
        }
    }
}
