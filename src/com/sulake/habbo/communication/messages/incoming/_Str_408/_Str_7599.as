package com.sulake.habbo.communication.messages.incoming._Str_408
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.mysterybox._Str_7374;

    public class _Str_7599 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7599(k:Function)
        {
            super(k, _Str_7374);
        }

        public function getParser():_Str_7374
        {
            return _parser as _Str_7374;
        }
    }
}
