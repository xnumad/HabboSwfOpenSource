package com.sulake.habbo.communication.messages.incoming.roomsettings
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.roomsettings.FlatControllersMessageParser;

    public class FlatControllersEvent extends MessageEvent implements IMessageEvent
    {
        public function FlatControllersEvent(k:Function)
        {
            super(k, FlatControllersMessageParser);
        }

        public function getParser():FlatControllersMessageParser
        {
            return this._parser as FlatControllersMessageParser;
        }
    }
}
