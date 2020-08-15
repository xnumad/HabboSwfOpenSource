package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.DoorbellMessageParser;

    public class DoorbellMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function DoorbellMessageEvent(k:Function)
        {
            super(k, DoorbellMessageParser);
        }

        public function get userName():String
        {
            return (this._parser as DoorbellMessageParser).userName;
        }
    }
}
