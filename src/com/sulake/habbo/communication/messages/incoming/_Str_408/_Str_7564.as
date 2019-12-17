package com.sulake.habbo.communication.messages.incoming._Str_408
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.mysterybox._Str_9603;

    public class _Str_7564 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7564(k:Function)
        {
            super(k, _Str_9603);
        }

        public function getParser():_Str_9603
        {
            return _parser as _Str_9603;
        }
    }
}
