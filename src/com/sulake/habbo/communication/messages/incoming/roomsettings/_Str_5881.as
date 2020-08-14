package com.sulake.habbo.communication.messages.incoming.roomsettings
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.roomsettings.BannedUsersFromRoomParser;

    public class _Str_5881 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5881(k:Function)
        {
            super(k, BannedUsersFromRoomParser);
        }

        public function getParser():BannedUsersFromRoomParser
        {
            return this._parser as BannedUsersFromRoomParser;
        }
    }
}
