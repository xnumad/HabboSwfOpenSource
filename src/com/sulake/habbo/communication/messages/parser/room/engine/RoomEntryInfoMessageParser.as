package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RoomEntryInfoMessageParser implements IMessageParser
    {
        private var _guestRoomId:int;
        private var _owner:Boolean;


        public function get guestRoomId():int
        {
            return this._guestRoomId;
        }

        public function get owner():Boolean
        {
            return this._owner;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._guestRoomId = k.readInteger();
            this._owner = k.readBoolean();
            return true;
        }
    }
}
