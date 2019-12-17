package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.furni.FurniListAddOrUpdateParser;

    public class FurniListAddOrUpdateEvent extends MessageEvent implements IMessageEvent 
    {
        public function FurniListAddOrUpdateEvent(k:Function)
        {
            super(k, FurniListAddOrUpdateParser);
        }

        public function getParser():FurniListAddOrUpdateParser
        {
            return this._parser as FurniListAddOrUpdateParser;
        }
    }
}
