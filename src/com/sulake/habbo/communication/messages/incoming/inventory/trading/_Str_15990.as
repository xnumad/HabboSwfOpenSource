package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading._Str_10279;

    public class _Str_15990 extends MessageEvent 
    {
        public function _Str_15990(k:Function, _arg_2:Class)
        {
            super(k, _arg_2);
        }

        public function getParser():_Str_10279
        {
            return _parser as _Str_10279;
        }
    }
}
