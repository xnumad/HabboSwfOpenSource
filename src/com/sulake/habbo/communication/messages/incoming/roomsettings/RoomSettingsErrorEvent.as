package com.sulake.habbo.communication.messages.incoming.roomsettings
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.roomsettings.RoomSettingsErrorMessageParser;

    public class RoomSettingsErrorEvent extends MessageEvent implements IMessageEvent
    {
        public function RoomSettingsErrorEvent(k:Function)
        {
            super(k, RoomSettingsErrorMessageParser);
        }

        public function getParser():RoomSettingsErrorMessageParser
        {
            return this._parser as RoomSettingsErrorMessageParser;
        }
    }
}
