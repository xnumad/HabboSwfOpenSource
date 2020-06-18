package com.sulake.habbo.communication.messages.parser.friendlist
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
    import com.sulake.habbo.communication.messages.incoming.friendlist.FriendParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class FriendListUpdateMessageParser implements IMessageParser
    {
        private var _cats:Array;
        private var _removedFriendIds:Array;
        private var _addedFriends:Array;
        private var _updatedFriends:Array;


        public function flush():Boolean
        {
            this._cats = new Array();
            this._removedFriendIds = new Array();
            this._addedFriends = new Array();
            this._updatedFriends = new Array();
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_5:int;
            var _local_6:int;
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._cats.push(new FriendCategoryData(k));
                _local_3++;
            }
            var _local_4:int = k.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_4)
            {
                _local_5 = k.readInteger();
                if (_local_5 == -1)
                {
                    _local_6 = k.readInteger();
                    this._removedFriendIds.push(_local_6);
                }
                else
                {
                    if (_local_5 == 0)
                    {
                        this._updatedFriends.push(new FriendParser(k));
                    }
                    else
                    {
                        if (_local_5 == 1)
                        {
                            this._addedFriends.push(new FriendParser(k));
                        }
                    }
                }
                _local_3++;
            }
            return true;
        }

        public function get cats():Array
        {
            return this._cats;
        }

        public function get removedFriendIds():Array
        {
            return this._removedFriendIds;
        }

        public function get addedFriends():Array
        {
            return this._addedFriends;
        }

        public function get updatedFriends():Array
        {
            return this._updatedFriends;
        }
    }
}
