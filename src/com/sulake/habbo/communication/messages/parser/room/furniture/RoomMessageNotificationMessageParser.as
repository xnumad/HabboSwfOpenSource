package com.sulake.habbo.communication.messages.parser.room.furniture
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RoomMessageNotificationMessageParser implements IMessageParser
    {
        private var _roomId:int;
        private var _roomName:String;
        private var _messageCount:int;


        public function get roomId():int
        {
            return this._roomId;
        }

        public function get roomName():String
        {
            return this._roomName;
        }

        public function get _Str_25507():int
        {
            return this._messageCount;
        }

        public function flush():Boolean
        {
            this._roomId = -1;
            this._roomName = "";
            this._messageCount = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._roomId = k.readInteger();
            this._roomName = k.readString();
            this._messageCount = k.readInteger();
            return true;
        }
    }
}
