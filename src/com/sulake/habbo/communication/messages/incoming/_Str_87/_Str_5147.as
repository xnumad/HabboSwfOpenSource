package com.sulake.habbo.communication.messages.incoming._Str_87
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.badges._Str_6941;

    public class _Str_5147 extends MessageEvent 
    {
        public function _Str_5147(k:Function)
        {
            super(k, _Str_6941);
        }

        public function getParser():_Str_6941
        {
            return _parser as _Str_6941;
        }
    }
}
