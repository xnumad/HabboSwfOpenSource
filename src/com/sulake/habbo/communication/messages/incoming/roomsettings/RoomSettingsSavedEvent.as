package com.sulake.habbo.communication.messages.incoming.roomsettings
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.roomsettings.RoomSettingsSavedMessageParser;

    public class RoomSettingsSavedEvent extends MessageEvent implements IMessageEvent
    {
        public function RoomSettingsSavedEvent(k:Function)
        {
            super(k, RoomSettingsSavedMessageParser);
        }

        public function getParser():RoomSettingsSavedMessageParser
        {
            return this._parser as RoomSettingsSavedMessageParser;
        }
    }
}
