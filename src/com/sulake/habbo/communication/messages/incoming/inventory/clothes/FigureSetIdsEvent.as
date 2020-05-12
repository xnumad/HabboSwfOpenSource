package com.sulake.habbo.communication.messages.incoming.inventory.clothes
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.clothing.FigureSetIdsMessageParser;

    public class FigureSetIdsEvent extends MessageEvent implements IMessageEvent 
    {
        public function FigureSetIdsEvent(k:Function)
        {
            super(k, FigureSetIdsMessageParser);
        }

        public function getParser():FigureSetIdsMessageParser
        {
            return _parser as FigureSetIdsMessageParser;
        }
    }
}
