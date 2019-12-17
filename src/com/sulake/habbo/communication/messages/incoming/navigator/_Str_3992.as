package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_5936;

    public class _Str_3992 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_3992(k:Function)
        {
            super(k, _Str_5936);
        }

        public function getParser():_Str_5936
        {
            return this._parser as _Str_5936;
        }
    }
}
