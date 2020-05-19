package com.sulake.habbo.communication.messages.incoming.room.action
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.action.ExpressionMessageParser;

    public class _Str_7641 extends MessageEvent 
    {
        public function _Str_7641(k:Function)
        {
            super(k, ExpressionMessageParser);
        }

        public function getParser():ExpressionMessageParser
        {
            return _parser as ExpressionMessageParser;
        }
    }
}
