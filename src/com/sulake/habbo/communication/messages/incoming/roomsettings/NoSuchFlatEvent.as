package com.sulake.habbo.communication.messages.incoming.roomsettings
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.roomsettings.NoSuchFlatMessageParser;

    public class NoSuchFlatEvent extends MessageEvent implements IMessageEvent
    {
        public function NoSuchFlatEvent(k:Function)
        {
            super(k, NoSuchFlatMessageParser);
        }

        public function getParser():NoSuchFlatMessageParser
        {
            return this._parser as NoSuchFlatMessageParser;
        }
    }
}
