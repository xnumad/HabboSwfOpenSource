package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog._Str_8673;

    public class _Str_8409 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8409(k:Function)
        {
            super(k, _Str_8673);
        }

        public function getParser():_Str_8673
        {
            return this._parser as _Str_8673;
        }
    }
}
