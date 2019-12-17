package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.furni._Str_8074;

    public class _Str_6908 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_6908(k:Function)
        {
            super(k, _Str_8074);
        }

        public function getParser():_Str_8074
        {
            return this._parser as _Str_8074;
        }
    }
}
