package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog._Str_7694;

    public class _Str_8078 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8078(k:Function)
        {
            super(k, _Str_7694);
        }

        public function getParser():_Str_7694
        {
            return this._parser as _Str_7694;
        }
    }
}
