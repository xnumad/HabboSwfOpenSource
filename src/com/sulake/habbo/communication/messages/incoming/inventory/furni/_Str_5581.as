package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.furni._Str_7941;

    public class _Str_5581 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5581(k:Function)
        {
            super(k, _Str_7941);
        }

        public function getParser():_Str_7941
        {
            return this._parser as _Str_7941;
        }
    }
}
