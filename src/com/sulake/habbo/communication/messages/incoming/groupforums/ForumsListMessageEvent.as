package com.sulake.habbo.communication.messages.incoming.groupforums
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.groupforums.GetForumsListMessageParser;

    public class ForumsListMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function ForumsListMessageEvent(k:Function)
        {
            super(k, GetForumsListMessageParser);
        }

        public function getParser():GetForumsListMessageParser
        {
            return GetForumsListMessageParser(this._parser);
        }
    }
}
