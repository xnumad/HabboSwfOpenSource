package com.sulake.habbo.communication.messages.incoming.roomsettings
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.roomsettings.FlatControllerAddedMessageParser;

    public class FlatControllerAddedEvent extends MessageEvent implements IMessageEvent
    {
        public function FlatControllerAddedEvent(k:Function)
        {
            super(k, FlatControllerAddedMessageParser);
        }

        public function getParser():FlatControllerAddedMessageParser
        {
            return this._parser as FlatControllerAddedMessageParser;
        }
    }
}
