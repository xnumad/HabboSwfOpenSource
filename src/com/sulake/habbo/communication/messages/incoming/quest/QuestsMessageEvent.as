package com.sulake.habbo.communication.messages.incoming.quest
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.quest.QuestsParser;

    public class QuestsMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function QuestsMessageEvent(k:Function)
        {
            super(k, QuestsParser);
        }

        public function getParser():QuestsParser
        {
            return _parser as QuestsParser;
        }
    }
}
