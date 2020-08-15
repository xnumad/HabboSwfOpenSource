package com.sulake.habbo.communication.messages.incoming.friendlist
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.NewConsoleMessageMessageParser;

    public class NewConsoleMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function NewConsoleMessageEvent(k:Function)
        {
            super(k, NewConsoleMessageMessageParser);
        }

        public function getParser():NewConsoleMessageMessageParser
        {
            return this._parser as NewConsoleMessageMessageParser;
        }
    }
}
