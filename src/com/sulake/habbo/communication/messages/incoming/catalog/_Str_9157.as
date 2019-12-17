package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog._Str_8077;

    public class _Str_9157 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9157(k:Function)
        {
            super(k, _Str_8077);
        }

        public function getParser():_Str_8077
        {
            return this._parser as _Str_8077;
        }
    }
}
