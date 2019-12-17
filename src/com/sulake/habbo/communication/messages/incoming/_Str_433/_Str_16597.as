package com.sulake.habbo.communication.messages.incoming._Str_433
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.bots._Str_9476;

    public class _Str_16597 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_16597(k:Function)
        {
            super(k, _Str_9476);
        }

        public function getParser():_Str_9476
        {
            return _parser as _Str_9476;
        }
    }
}
