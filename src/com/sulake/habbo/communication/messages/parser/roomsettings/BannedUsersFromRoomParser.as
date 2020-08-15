package com.sulake.habbo.communication.messages.parser.roomsettings
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.BannedUserData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class BannedUsersFromRoomParser implements IMessageParser
    {
        private var _roomId:int;
        private var _Str_17279:Array;


        public function flush():Boolean
        {
            this._Str_17279 = [];
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._roomId = k.readInteger();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._Str_17279.push(new BannedUserData(k));
                _local_3++;
            }
            return true;
        }

        public function get roomId():int
        {
            return this._roomId;
        }

        public function get _Str_14901():Array
        {
            return this._Str_17279;
        }
    }
}
