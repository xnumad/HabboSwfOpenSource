package com.sulake.habbo.communication.messages.incoming.roomsettings
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.roomsettings.RoomSettingsDataMessageParser;

    public class _Str_5993 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5993(k:Function)
        {
            super(k, RoomSettingsDataMessageParser);
        }

        public function getParser():RoomSettingsDataMessageParser
        {
            return this._parser as RoomSettingsDataMessageParser;
        }
    }
}
