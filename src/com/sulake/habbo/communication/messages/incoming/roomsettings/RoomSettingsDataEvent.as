package com.sulake.habbo.communication.messages.incoming.roomsettings
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.roomsettings.RoomSettingsDataMessageParser;

    public class RoomSettingsDataEvent extends MessageEvent implements IMessageEvent
    {
        public function RoomSettingsDataEvent(k:Function)
        {
            super(k, RoomSettingsDataMessageParser);
        }

        public function getParser():RoomSettingsDataMessageParser
        {
            return this._parser as RoomSettingsDataMessageParser;
        }
    }
}
