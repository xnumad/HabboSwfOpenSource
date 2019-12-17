package com.sulake.habbo.communication.messages.incoming._Str_516
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser._Str_524._Str_7576;

    public class PongMessageParser extends MessageEvent implements IMessageEvent 
    {
        public function PongMessageParser(k:Function)
        {
            super(k, _Str_7576);
        }

        public function getParser():_Str_7576
        {
            return _parser as _Str_7576;
        }
    }
}
