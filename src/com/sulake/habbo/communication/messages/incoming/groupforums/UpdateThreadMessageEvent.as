package com.sulake.habbo.communication.messages.incoming.groupforums
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.groupforums.UpdateThreadMessageParser;

    public class UpdateThreadMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function UpdateThreadMessageEvent(k:Function)
        {
            super(k, UpdateThreadMessageParser);
        }

        public function getParser():UpdateThreadMessageParser
        {
            return this._parser as UpdateThreadMessageParser;
        }
    }
}
