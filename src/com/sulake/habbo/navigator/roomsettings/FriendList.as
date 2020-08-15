package com.sulake.habbo.navigator.roomsettings
{
    import flash.utils.Dictionary;
    import com.sulake.habbo.communication.messages.incoming.friendlist.FriendParser;
    import com.sulake.habbo.communication.messages.incoming.friendlist.FriendListFragmentMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.FriendsListFragmentMessageParser;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist.FriendListUpdateEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.FriendListUpdateMessageParser;

    public class FriendList 
    {
        private var _namesById:Dictionary;
        private var _list:Array;

        public function FriendList()
        {
            this._namesById = new Dictionary();
            super();
        }

        public function onFriendsListFragment(k:IMessageEvent):void
        {
            var _local_3:FriendParser;
            var _local_2:FriendsListFragmentMessageParser = (k as FriendListFragmentMessageEvent).getParser();
            if (_local_2 == null)
            {
                return;
            }
            for each (_local_3 in _local_2.friendFragment)
            {
                this._namesById[_local_3.id] = _local_3.name;
            }
        }

        public function onFriendListUpdate(k:IMessageEvent):void
        {
            var _local_3:int;
            var _local_4:FriendParser;
            var _local_2:FriendListUpdateMessageParser = (k as FriendListUpdateEvent).getParser();
            for each (_local_3 in _local_2.removedFriendIds)
            {
                this._namesById[_local_3] = null;
            }
            for each (_local_4 in _local_2.addedFriends)
            {
                this._namesById[_local_4.id] = _local_4.name;
            }
            this._list = (((_local_2.removedFriendIds.length > 0) || (_local_2.addedFriends.length > 0)) ? null : this._list);
        }

        public function get list():Array
        {
            var k:String;
            var _local_2:int;
            var _local_3:String;
            if (this._list == null)
            {
                this._list = new Array();
                for (k in this._namesById)
                {
                    _local_2 = int(k);
                    _local_3 = this._namesById[_local_2];
                    if (_local_3 != null)
                    {
                        this._list.push(new FriendEntryData(_local_2, _local_3));
                    }
                }
                this._list.sortOn("userName", Array.CASEINSENSITIVE);
            }
            return this._list;
        }
    }
}
