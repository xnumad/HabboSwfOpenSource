package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.furni.PostItPlacedParser;

    public class PostItPlacedEvent extends MessageEvent implements IMessageEvent 
    {
        public function PostItPlacedEvent(k:Function)
        {
            super(k, PostItPlacedParser);
        }

        public function getParser():PostItPlacedParser
        {
            return this._parser as PostItPlacedParser;
        }
    }
}
