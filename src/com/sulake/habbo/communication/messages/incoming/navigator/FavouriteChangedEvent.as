package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.FavouriteChangedMessageParser;

    public class FavouriteChangedEvent extends MessageEvent implements IMessageEvent
    {
        public function FavouriteChangedEvent(k:Function)
        {
            super(k, FavouriteChangedMessageParser);
        }

        public function getParser():FavouriteChangedMessageParser
        {
            return this._parser as FavouriteChangedMessageParser;
        }
    }
}
