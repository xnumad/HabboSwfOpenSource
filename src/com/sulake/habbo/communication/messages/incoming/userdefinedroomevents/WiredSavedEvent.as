package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.userdefinedroomevents.WiredSavedMessageParser;

    public class WiredSavedEvent extends MessageEvent implements IMessageEvent 
    {
        public function WiredSavedEvent(k:Function)
        {
            super(k, WiredSavedMessageParser);
        }

        public function getParser():WiredSavedMessageParser
        {
            return this._parser as WiredSavedMessageParser;
        }
    }
}
