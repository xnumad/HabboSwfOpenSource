package com.sulake.habbo.communication.messages.incoming.users
{
    import flash.utils.Dictionary;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuildMemberData 
    {
        private var _groupId:int;
        private var _groupName:String;
        private var _baseRoomId:int;
        private var _badgeCode:String;
        private var _totalEntries:int;
        private var _entries:Array;
        private var _allowedToManage:Boolean;
        private var _pageSize:int;
        private var _pageIndex:int;
        private var _searchType:int;
        private var _userNameFilter:String;
        private var _usersById:Dictionary;

        public function GuildMemberData(k:IMessageDataWrapper)
        {
            var _local_4:_Str_2891;
            this._usersById = new Dictionary();
            super();
            this._groupId = k.readInteger();
            this._groupName = k.readString();
            this._baseRoomId = k.readInteger();
            this._badgeCode = k.readString();
            this._totalEntries = k.readInteger();
            this._entries = new Array();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = new _Str_2891(k);
                this._entries.push(_local_4);
                this._usersById[_local_4.userId] = _local_4;
                _local_3++;
            }
            this._allowedToManage = k.readBoolean();
            this._pageSize = k.readInteger();
            this._pageIndex = k.readInteger();
            this._searchType = k.readInteger();
            this._userNameFilter = k.readString();
        }

        private static function removeFromArray(k:int, _arg_2:Array):void
        {
            var _local_3:int;
            var _local_4:_Str_2891;
            while (_local_3 < _arg_2.length)
            {
                _local_4 = _arg_2[_local_3];
                if (_local_4.userId == k)
                {
                    _arg_2.splice(_local_3, 1);
                }
                else
                {
                    _local_3++;
                }
            }
        }


        public function get groupId():int
        {
            return this._groupId;
        }

        public function get groupName():String
        {
            return this._groupName;
        }

        public function get baseRoomId():int
        {
            return this._baseRoomId;
        }

        public function get badgeCode():String
        {
            return this._badgeCode;
        }

        public function get totalEntries():int
        {
            return this._totalEntries;
        }

        public function get pageSize():int
        {
            return this._pageSize;
        }

        public function get pageIndex():int
        {
            return this._pageIndex;
        }

        public function get searchType():int
        {
            return this._searchType;
        }

        public function get entries():Array
        {
            return this._entries;
        }

        public function get allowedToManage():Boolean
        {
            return this._allowedToManage;
        }

        public function get userNameFilter():String
        {
            return this._userNameFilter;
        }

        public function get totalPages():int
        {
            return Math.max(1, Math.ceil((this._totalEntries / this._pageSize)));
        }

        public function update(k:_Str_2891):void
        {
            var _local_2:int;
            var _local_3:_Str_2891;
            this._usersById[k.userId] = k;
            while (_local_2 < this._entries.length)
            {
                _local_3 = this._entries[_local_2];
                if (_local_3.userId == k.userId)
                {
                    this._entries[_local_2] = k;
                    return;
                }
                _local_2++;
            }
            this._entries.push(k);
        }

        public function remove(k:int):void
        {
            removeFromArray(k, this._entries);
            delete this._usersById[k];
        }

        public function _Str_5126(k:int):_Str_2891
        {
            return this._usersById[k];
        }
    }
}
