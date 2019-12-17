package com.sulake.habbo.communication.messages.incoming._Str_433
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.bots._Str_7906;

    public class _Str_8269 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8269(k:Function)
        {
            super(k, _Str_7906);
        }

        public function getParser():_Str_7906
        {
            return _parser as _Str_7906;
        }
    }
}
