package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog._Str_6732;

    public class _Str_5417 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5417(k:Function)
        {
            super(k, _Str_6732);
        }

        public function getParser():_Str_6732
        {
            return this._parser as _Str_6732;
        }
    }
}
