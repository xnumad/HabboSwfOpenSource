package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog._Str_7888;

    public class _Str_5514 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5514(callback:Function)
        {
            super(callback, _Str_7888);
        }

        public function getParser():_Str_7888
        {
            return this._parser as _Str_7888;
        }
    }
}
