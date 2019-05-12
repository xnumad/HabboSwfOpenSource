package com.sulake.habbo.communication.messages.parser.room.chat
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomChatSettingsParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9348 implements IMessageParser 
    {
        private var _Str_5898:RoomChatSettingsParser;


        public function flush():Boolean
        {
            this._Str_5898 = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_5898 = new RoomChatSettingsParser(k);
            return true;
        }

        public function get _Str_4965():RoomChatSettingsParser
        {
            return this._Str_5898;
        }
    }
}
