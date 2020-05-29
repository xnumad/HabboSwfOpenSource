package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_5600 implements _Str_5716 
    {
        private var _costInCredits:int;
        private var _ownedRooms:Array;
        private var _badgeSettings:Array;

        public function _Str_5600(k:IMessageDataWrapper)
        {
            var _local_2:int;
            var _local_3:int;
            super();
            this._costInCredits = k.readInteger();
            this._ownedRooms = new Array();
            _local_3 = k.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                this._ownedRooms.push(new _Str_2866(k.readInteger(), k.readString(), k.readBoolean()));
                _local_2++;
            }
            _local_3 = k.readInteger();
            this._badgeSettings = new Array();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                this._badgeSettings.push(new _Str_5965(k));
                _local_2++;
            }
        }

        public function get _Str_23650():int
        {
            return this._costInCredits;
        }

        public function get _Str_6848():Array
        {
            return this._ownedRooms;
        }

        public function get _Str_2811():Boolean
        {
            return false;
        }

        public function get isOwner():Boolean
        {
            return true;
        }

        public function get groupId():int
        {
            return 0;
        }

        public function get groupName():String
        {
            return "";
        }

        public function get _Str_17501():String
        {
            return "";
        }

        public function get baseRoomId():int
        {
            return 0;
        }

        public function get _Str_7342():int
        {
            return 0;
        }

        public function get _Str_7590():int
        {
            return 0;
        }

        public function get _Str_6089():Array
        {
            return this._badgeSettings;
        }

        public function get locked():Boolean
        {
            return false;
        }

        public function get url():String
        {
            return "";
        }

        public function get _Str_4830():int
        {
            return 0;
        }

        public function get _Str_17566():int
        {
            return 0;
        }

        public function get badgeCode():String
        {
            return "";
        }

        public function get _Str_16539():int
        {
            return 0;
        }
    }
}
