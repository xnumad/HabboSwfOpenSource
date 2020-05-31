package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class FavouriteMembershipUpdateMessageParser implements IMessageParser
    {
        private var _roomIndex:int;
        private var _habboGroupId:int;
        private var _status:int;
        private var _habboGroupName:String;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._roomIndex = k.readInteger();
            this._habboGroupId = k.readInteger();
            this._status = k.readInteger();
            this._habboGroupName = k.readString();
            return true;
        }

        public function get roomIndex():int
        {
            return this._roomIndex;
        }

        public function get habboGroupId():int
        {
            return this._habboGroupId;
        }

        public function get status():int
        {
            return this._status;
        }

        public function get habboGroupName():String
        {
            return this._habboGroupName;
        }
    }
}
