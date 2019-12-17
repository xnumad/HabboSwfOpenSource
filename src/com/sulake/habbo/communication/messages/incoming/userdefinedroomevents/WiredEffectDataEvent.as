package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.userdefinedroomevents.WiredEffectDataMessageParser;

    public class WiredEffectDataEvent extends MessageEvent implements IMessageEvent 
    {
        public function WiredEffectDataEvent(k:Function)
        {
            super(k, WiredEffectDataMessageParser);
        }

        public function getParser():WiredEffectDataMessageParser
        {
            return this._parser as WiredEffectDataMessageParser;
        }
    }
}
