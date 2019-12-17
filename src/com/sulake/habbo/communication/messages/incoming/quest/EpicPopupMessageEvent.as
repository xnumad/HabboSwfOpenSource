package com.sulake.habbo.communication.messages.incoming.quest
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.quest.EpicPopupParser;

    public class EpicPopupMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function EpicPopupMessageEvent(k:Function)
        {
            super(k, EpicPopupParser);
        }

        public function getParser():EpicPopupParser
        {
            return _parser as EpicPopupParser;
        }
    }
}
