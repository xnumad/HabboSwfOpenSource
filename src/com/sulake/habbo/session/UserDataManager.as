package com.sulake.habbo.session
{
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_6996;
    import com.sulake.habbo.communication.messages.outgoing._Str_381._Str_11731;

    public class UserDataManager
    {
        private static const TYPE_USER:int = 1;
        private static const TYPE_PET:int = 2;
        private static const TYPE_BOT:int = 3;
        private static const TYPE_RENTABLE_BOT:int = 4;

        private var _userDataByType:Map;
        private var _userDataByRoomIndex:Map;
        private var _userBadges:Map;
        private var _connection:IConnection;

        public function UserDataManager()
        {
            this._userDataByType = new Map();
            this._userDataByRoomIndex = new Map();
            this._userBadges = new Map();
        }

        public function dispose():void
        {
            this._connection = null;
            this._userDataByType.dispose();
            this._userDataByType = null;
            this._userDataByRoomIndex.dispose();
            this._userDataByRoomIndex = null;
            this._userBadges.dispose();
            this._userBadges = null;
        }

        public function set connection(k:IConnection):void
        {
            this._connection = k;
        }

        public function getUserData(k:int):RoomUserData
        {
            return this._Str_6958(k, TYPE_USER);
        }

        public function _Str_6958(k:int, _arg_2:int):RoomUserData
        {
            var _local_3:RoomUserData;
            var _local_4:Map = this._userDataByType.getValue(_arg_2);
            if (_local_4 != null)
            {
                _local_3 = _local_4.getValue(k);
            }
            return _local_3;
        }

        public function getUserDataByIndex(k:int):RoomUserData
        {
            return this._userDataByRoomIndex.getValue(k);
        }

        public function _Str_10979(k:String):RoomUserData
        {
            var _local_2:RoomUserData;
            for each (_local_2 in this._userDataByRoomIndex)
            {
                if (_local_2.name == k)
                {
                    return _local_2;
                }
            }
            return null;
        }

        public function getUserBadges(k:int):Array
        {
            if (this._connection != null)
            {
                this._connection.send(new _Str_6996(k));
            }
            var _local_2:Array = (this._userBadges.getValue(k) as Array);
            if (_local_2 == null)
            {
                _local_2 = [];
            }
            return _local_2;
        }

        public function _Str_22067(k:RoomUserData):void
        {
            if (k == null)
            {
                return;
            }
            this.removeUserDataByRoomIndex(k._Str_2713);
            var _local_2:Map = this._userDataByType.getValue(k.type);
            if (_local_2 == null)
            {
                _local_2 = new Map();
                this._userDataByType.add(k.type, _local_2);
            }
            _local_2.add(k._Str_2394, k);
            this._userDataByRoomIndex.add(k._Str_2713, k);
        }

        public function removeUserDataByRoomIndex(k:int):void
        {
            var _local_3:Map;
            var _local_4:RoomUserData;
            var _local_2:RoomUserData = this._userDataByRoomIndex.remove(k);
            if (_local_2 != null)
            {
                _local_3 = this._userDataByType.getValue(_local_2.type);
                if (_local_3 != null)
                {
                    _local_4 = _local_3.remove(_local_2._Str_2394);
                    if (_local_4 != null)
                    {
                    }
                }
            }
        }

        public function setUserBadges(k:int, _arg_2:Array):void
        {
            this._userBadges.remove(k);
            this._userBadges.add(k, _arg_2);
        }

        public function updateFigure(k:int, _arg_2:String, _arg_3:String, _arg_4:Boolean, _arg_5:Boolean):void
        {
            var _local_6:RoomUserData = this.getUserDataByIndex(k);
            if (_local_6 != null)
            {
                _local_6.figure = _arg_2;
                _local_6._Str_3344 = _arg_3;
                _local_6._Str_4799 = _arg_4;
                _local_6.isRiding = _arg_5;
            }
        }

        public function updatePetLevel(k:int, _arg_2:int):void
        {
            var _local_3:RoomUserData = this.getUserDataByIndex(k);
            if (_local_3 != null)
            {
                _local_3._Str_3897 = _arg_2;
            }
        }

        public function updatePetBreedingStatus(k:int, _arg_2:Boolean, _arg_3:Boolean, _arg_4:Boolean, _arg_5:Boolean):void
        {
            var _local_6:RoomUserData = this.getUserDataByIndex(k);
            if (_local_6 != null)
            {
                _local_6.canBreed = _arg_2;
                _local_6.canHarvest = _arg_3;
                _local_6.canRevive = _arg_4;
                _local_6.hasBreedingPermission = _arg_5;
            }
        }

        public function updateCustom(k:int, _arg_2:String):void
        {
            var _local_3:RoomUserData = this.getUserDataByIndex(k);
            if (_local_3 != null)
            {
                _local_3.custom = _arg_2;
            }
        }

        public function updateAchievementScore(k:int, _arg_2:int):void
        {
            var _local_3:RoomUserData = this.getUserDataByIndex(k);
            if (_local_3 != null)
            {
                _local_3.activityPoints = _arg_2;
            }
        }

        public function updateNameByIndex(k:int, _arg_2:String):void
        {
            var _local_3:RoomUserData = this.getUserDataByIndex(k);
            if (_local_3 != null)
            {
                _local_3.name = _arg_2;
            }
        }

        public function _Str_8631(k:int):RoomUserData
        {
            return this._Str_6958(k, TYPE_PET);
        }

        public function _Str_17237(k:int):RoomUserData
        {
            return this._Str_6958(k, TYPE_RENTABLE_BOT);
        }

        public function requestPetInfo(k:int):void
        {
            var _local_2:RoomUserData = this._Str_8631(k);
            if (((!(_local_2 == null)) && (!(this._connection == null))))
            {
                this._connection.send(new _Str_11731(_local_2._Str_2394));
            }
        }

        public function _Str_23028():Array
        {
            var _local_2:RoomUserData;
            var k:Array = new Array();
            for each (_local_2 in this._userDataByRoomIndex)
            {
                k.push(_local_2._Str_2394);
            }
            return k;
        }
    }
}
