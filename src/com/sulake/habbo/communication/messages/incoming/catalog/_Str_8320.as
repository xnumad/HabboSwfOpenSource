package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog._Str_9527;

    public class _Str_8320 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8320(k:Function)
        {
            super(k, _Str_9527);
        }

        public function getParser():_Str_9527
        {
            return this._parser as _Str_9527;
        }
    }
}
