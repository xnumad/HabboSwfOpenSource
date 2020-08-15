package com.sulake.habbo.friendlist.domain
{
    import flash.utils.Dictionary;
    import com.sulake.habbo.communication.messages.parser.friendlist.FriendListUpdateMessageParser;
    import com.sulake.habbo.communication.messages.incoming.friendlist.FriendParser;
    import com.sulake.habbo.communication.messages.incoming.friendlist.FriendListUpdateEvent;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
    import com.sulake.habbo.friendlist.Util;
    import com.sulake.habbo.friendlist._Str_6567;
    import com.sulake.habbo.communication.messages.incoming.friendlist.*;
    import com.sulake.habbo.communication.messages.parser.friendlist.*;

    public class FriendCategories 
    {
        private var _deps:_Str_9454;
        private var _categories:Array;
        private var _friendsById:Dictionary;

        public function FriendCategories(k:_Str_9454)
        {
            this._categories = new Array();
            this._friendsById = new Dictionary();
            super();
            this._deps = k;
        }

        public function _Str_11247(k:Friend):FriendCategory
        {
            var _local_2:int = ((k.online) ? k.categoryId : FriendCategory._Str_7666);
            var _local_3:FriendCategory = this._Str_5067(_local_2);
            if (_local_3 != null)
            {
                _local_3._Str_11247(k);
                this._friendsById[k.id] = k;
                return _local_3;
            }
            Logger.log((((("No category " + _local_2) + " found for friend ") + k.id) + ". Ignoring"));
            return null;
        }

        public function _Str_8217():Array
        {
            var _local_2:FriendCategory;
            var k:Array = new Array();
            for each (_local_2 in this._categories)
            {
                _local_2._Str_8217(k);
            }
            return k;
        }

        public function _Str_23393():Friend
        {
            var k:Array = this._Str_8217();
            return (k.length == 1) ? k[0] : null;
        }

        public function _Str_22560():Dictionary
        {
            return this._friendsById;
        }

        public function getFriendCount(k:Boolean, _arg_2:Boolean=false):int
        {
            var _local_4:FriendCategory;
            var _local_3:int;
            for each (_local_4 in this._categories)
            {
                _local_3 = (_local_3 + _local_4.getFriendCount(k, _arg_2));
            }
            return _local_3;
        }

        public function _Str_17858():Array
        {
            return this._categories;
        }

        public function _Str_15664(k:FriendCategory):void
        {
            this._categories.push(k);
        }

        public function _Str_13534(k:int):Friend
        {
            return this._friendsById[k];
        }

        public function _Str_5067(k:int):FriendCategory
        {
            var _local_2:FriendCategory;
            for each (_local_2 in this._categories)
            {
                if (_local_2.id == k)
                {
                    return _local_2;
                }
            }
            return null;
        }

        public function onFriendListUpdate(event:IMessageEvent):void
        {
            var status:int;
            var p:FriendListUpdateMessageParser;
            var removedFriendId:int;
            var updatedFriend:FriendParser;
            var addedFriend:FriendParser;
            var currentlyOnline:Boolean;
            var wasSelected:Boolean;
            var friend:Friend;
            Logger.log("Received friend list update");
            status = 0;
            try
            {
                p = (event as FriendListUpdateEvent).getParser();
                status = 1;
                this._Str_22561(p.cats);
                status = 2;
                for each (removedFriendId in p.removedFriendIds)
                {
                    this._Str_8793(removedFriendId, true);
                }
                status = 3;
                for each (updatedFriend in p.updatedFriends)
                {
                    Logger.log(((((((("Got UPDATE: " + updatedFriend.id) + ", ") + updatedFriend.online) + ", ") + updatedFriend.name) + ", ") + updatedFriend.followingAllowed));
                    this._deps.messenger.setFollowingAllowed(updatedFriend.id, ((updatedFriend.followingAllowed) && (updatedFriend.online)));
                    currentlyOnline = this._Str_25874(updatedFriend.id);
                    if (((currentlyOnline) && (!(updatedFriend.online))))
                    {
                        this._deps.messenger.setOnlineStatus(updatedFriend.id, updatedFriend.online);
                    }
                    if (((!(currentlyOnline)) && (updatedFriend.online)))
                    {
                        this._deps.messenger.setOnlineStatus(updatedFriend.id, updatedFriend.online);
                        this._deps.view._Str_9276();
                    }
                    wasSelected = this._Str_8793(updatedFriend.id, true);
                    friend = new Friend(updatedFriend);
                    friend.selected = wasSelected;
                    this._Str_11247(friend);
                }
                status = 4;
                for each (addedFriend in p.addedFriends)
                {
                    Logger.log(((("Got INSERT: " + addedFriend.id) + ", ") + addedFriend.name));
                    this._Str_8793(addedFriend.id, true);
                    this._Str_11247(new Friend(addedFriend));
                }
                status = 5;
                this._deps.view._Str_3836();
                status = 6;
            }
            catch(e:Error)
            {
                ErrorReportStorage.addDebugData("FriendCategories", (("onFriendListUpdate crashed, status = " + String(status)) + "!"));
                throw (e);
            }
        }

        private function _Str_22561(k:Array):void
        {
            var _local_2:FriendCategoryData;
            var _local_3:FriendCategory;
            var _local_4:FriendCategory;
            var _local_5:FriendCategory;
            this._Str_22708();
            this._Str_5067(FriendCategory._Str_7666).received = true;
            this._Str_5067(FriendCategory._Str_15031).received = true;
            for each (_local_2 in k)
            {
                _local_4 = this._Str_5067(_local_2.id);
                if (_local_4 != null)
                {
                    _local_4.received = true;
                    if (_local_4.name != _local_2.name)
                    {
                        _local_4.name = _local_2.name;
                    }
                }
                else
                {
                    _local_5 = new FriendCategory(_local_2.id, _local_2.name);
                    _local_5.received = true;
                    this._Str_15664(_local_5);
                }
            }
            for each (_local_3 in this._Str_22944())
            {
                if (_local_3.friends.length > 0)
                {
                }
                else
                {
                    Util.remove(this._categories, _local_3);
                    _local_3.dispose();
                }
            }
        }

        private function _Str_8793(k:int, _arg_2:Boolean):Boolean
        {
            var _local_4:FriendCategory;
            var _local_5:Friend;
            if (_arg_2)
            {
                this._friendsById[k] = null;
            }
            var _local_3:Boolean;
            for each (_local_4 in this._categories)
            {
                _local_5 = _local_4._Str_8793(k);
                if (_local_5 != null)
                {
                    _local_3 = _local_5.selected;
                    if (_arg_2)
                    {
                        _local_5.dispose();
                    }
                }
            }
            return _local_3;
        }

        private function _Str_22708():void
        {
            var k:FriendCategory;
            for each (k in this._categories)
            {
                k.received = false;
            }
        }

        private function _Str_22944():Array
        {
            var _local_2:FriendCategory;
            var k:Array = new Array();
            for each (_local_2 in this._categories)
            {
                if (!_local_2.received)
                {
                    k.push(_local_2);
                }
            }
            return k;
        }

        private function _Str_25874(k:int):Boolean
        {
            var _local_2:Friend = this._Str_13534(k);
            return (_local_2 == null) ? false : _local_2.online;
        }

        public function getFriendNames():Array
        {
            var _local_2:Friend;
            if (this._friendsById == null)
            {
                return [];
            }
            var k:Array = [];
            for each (_local_2 in this._friendsById)
            {
                if (_local_2 != null)
                {
                    k.push(_local_2.name);
                }
            }
            return k;
        }

        public function get view():_Str_6567
        {
            return this._deps.view;
        }
    }
}
