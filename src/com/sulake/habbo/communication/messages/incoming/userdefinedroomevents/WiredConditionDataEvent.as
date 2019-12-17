package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.userdefinedroomevents.WiredConditionDataMessageParser;

    public class WiredConditionDataEvent extends MessageEvent implements IMessageEvent 
    {
        public function WiredConditionDataEvent(k:Function)
        {
            super(k, WiredConditionDataMessageParser);
        }

        public function getParser():WiredConditionDataMessageParser
        {
            return this._parser as WiredConditionDataMessageParser;
        }
    }
}
