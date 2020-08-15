package com.sulake.habbo.communication.messages.incoming.room.furniture
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture.DiceValueMessageParser;

    public class DiceValueMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function DiceValueMessageEvent(k:Function)
        {
            super(k, DiceValueMessageParser);
        }

        public function getParser():DiceValueMessageParser
        {
            return _parser as DiceValueMessageParser;
        }
    }
}
