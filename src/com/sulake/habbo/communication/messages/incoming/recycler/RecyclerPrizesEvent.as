package com.sulake.habbo.communication.messages.incoming.recycler
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.recycler.RecyclerPrizesMessageParser;

    public class RecyclerPrizesEvent extends MessageEvent implements IMessageEvent 
    {
        public function RecyclerPrizesEvent(k:Function)
        {
            super(k, RecyclerPrizesMessageParser);
        }

        public function getParser():RecyclerPrizesMessageParser
        {
            return _parser as RecyclerPrizesMessageParser;
        }
    }
}
