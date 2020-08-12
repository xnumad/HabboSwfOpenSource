package com.sulake.habbo.communication.messages.parser.moderation
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.moderation.RoomModerationData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ModeratorRoomInfoMessageParser implements IMessageParser
    {
        private var _data:RoomModerationData;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._data = new RoomModerationData(k);
            return true;
        }

        public function get data():RoomModerationData
        {
            return this._data;
        }
    }
}
