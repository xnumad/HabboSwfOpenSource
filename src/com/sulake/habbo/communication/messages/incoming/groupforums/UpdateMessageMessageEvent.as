package com.sulake.habbo.communication.messages.incoming.groupforums
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.groupforums.UpdateMessageMessageParser;

    public class UpdateMessageMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function UpdateMessageMessageEvent(k:Function)
        {
            super(k, UpdateMessageMessageParser);
        }

        public function getParser():UpdateMessageMessageParser
        {
            return this._parser as UpdateMessageMessageParser;
        }
    }
}
