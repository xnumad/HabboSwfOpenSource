package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.furni.FurniListInvalidateParser;

    public class FurniListInvalidateEvent extends MessageEvent implements IMessageEvent 
    {
        public function FurniListInvalidateEvent(k:Function)
        {
            super(k, FurniListInvalidateParser);
        }

        public function getParser():FurniListInvalidateParser
        {
            return this._parser as FurniListInvalidateParser;
        }
    }
}
