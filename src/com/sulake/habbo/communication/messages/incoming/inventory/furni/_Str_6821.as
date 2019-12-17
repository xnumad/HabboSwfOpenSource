package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.furni._Str_9448;

    public class _Str_6821 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_6821(k:Function)
        {
            super(k, _Str_9448);
        }

        public function getParser():_Str_9448
        {
            return this._parser as _Str_9448;
        }
    }
}
