package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.userdefinedroomevents.WiredTriggerDataMessageParser;

    public class WiredTriggerDataEvent extends MessageEvent implements IMessageEvent 
    {
        public function WiredTriggerDataEvent(k:Function)
        {
            super(k, WiredTriggerDataMessageParser);
        }

        public function getParser():WiredTriggerDataMessageParser
        {
            return this._parser as WiredTriggerDataMessageParser;
        }
    }
}
