package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog._Str_7148;

    public class _Str_6375 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_6375(k:Function)
        {
            super(k, _Str_7148);
        }

        public function getParser():_Str_7148
        {
            return this._parser as _Str_7148;
        }
    }
}
