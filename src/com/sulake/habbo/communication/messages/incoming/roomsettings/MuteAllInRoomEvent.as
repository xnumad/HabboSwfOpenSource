package com.sulake.habbo.communication.messages.incoming.roomsettings
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.roomsettings.MuteAllInRoomParser;

    public class MuteAllInRoomEvent extends MessageEvent implements IMessageEvent
    {
        public function MuteAllInRoomEvent(k:Function)
        {
            super(k, MuteAllInRoomParser);
        }

        public function getParser():MuteAllInRoomParser
        {
            return this._parser as MuteAllInRoomParser;
        }
    }
}
