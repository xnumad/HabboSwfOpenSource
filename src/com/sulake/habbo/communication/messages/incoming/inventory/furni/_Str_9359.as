package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.furni._Str_7548;

    public class _Str_9359 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9359(k:Function)
        {
            super(k, _Str_7548);
        }

        public function getParser():_Str_7548
        {
            return this._parser as _Str_7548;
        }
    }
}
