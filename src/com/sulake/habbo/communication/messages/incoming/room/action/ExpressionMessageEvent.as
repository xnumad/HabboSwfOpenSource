package com.sulake.habbo.communication.messages.incoming.room.action
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.action.ExpressionMessageParser;

    public class ExpressionMessageEvent extends MessageEvent 
    {
        public function ExpressionMessageEvent(k:Function)
        {
            super(k, ExpressionMessageParser);
        }

        public function getParser():ExpressionMessageParser
        {
            return _parser as ExpressionMessageParser;
        }
    }
}
