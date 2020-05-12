package com.sulake.habbo.communication.messages.incoming.recycler
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.recycler.RecyclerFinishedMessageParser;

    public class RecyclerFinishedEvent extends MessageEvent implements IMessageEvent 
    {
        public static const _Str_15052:int = 1;
        public static const _Str_18717:int = 2;

        public function RecyclerFinishedEvent(k:Function)
        {
            super(k, RecyclerFinishedMessageParser);
        }

        public function getParser():RecyclerFinishedMessageParser
        {
            return _parser as RecyclerFinishedMessageParser;
        }
    }
}
