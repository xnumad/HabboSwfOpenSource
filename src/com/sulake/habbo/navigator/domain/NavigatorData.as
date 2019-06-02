package com.sulake.habbo.navigator.domain
{
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5733;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_3579;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2370;
    import flash.utils.Dictionary;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2632;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5485;
    import com.sulake.habbo.navigator.roomsettings.FriendList;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_4374;
    import com.sulake.habbo.session.SecurityLevelEnum;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_4522;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_4587;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_4081;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5078;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5546;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2802;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_4253;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_6043;
    import com.sulake.habbo.communication.messages.incoming.navigator.*;
    import com.sulake.habbo.navigator.*;
    import com.sulake.habbo.communication.messages.parser.navigator.*;

    public class NavigatorData 
    {
        private static const _Str_19461:int = 10;

        private var _navigator:HabboNavigator;
        private var _lastMsg:_Str_5733;
        private var _roomEventData:_Str_3579;
        private var _eventMod:Boolean;
        private var _roomPicker:Boolean;
        private var _currentRoomOwner:Boolean;
        private var _currentRoomId:int;
        private var _avatarId:int;
        private var _enteredGuestRoom:_Str_2370;
        private var _hcMember:Boolean;
        private var _createdFlatId:int;
        private var _hotRoomPopupOpen:Boolean;
        private var _homeRoomId:int;
        private var _settingsReceived:Boolean;
        private var _allCategories:Array;
        private var _visibleCategories:Array;
        private var _allEventCategories:Array;
        private var _visibleEventCategories:Array;
        private var _favouriteLimit:int;
        private var _favouriteCount:int;
        private var _favouriteIds:Dictionary;
        private var _loading:Boolean;
        private var _currentRoomRating:int;
        private var _canRate:Boolean;
        private var _currentRoomIsStaffPick:Boolean;
        private var _adIndex:int = 0;
        private var _adRoomData:_Str_2632;
        private var _promotedRooms:_Str_5485;
        private var _friendList:FriendList;
        private var _roomSessionTags:RoomSessionTags;
        private var _competitionRoomsData:_Str_4374;

        public function NavigatorData(k:HabboNavigator)
        {
            this._allCategories = new Array();
            this._visibleCategories = new Array();
            this._allEventCategories = new Array();
            this._visibleEventCategories = new Array();
            this._favouriteIds = new Dictionary();
            this._friendList = new FriendList();
            super();
            this._navigator = k;
        }

        public function get _Str_26243():Boolean
        {
            return (!(this._enteredGuestRoom == null)) && (!(this._currentRoomOwner));
        }

        public function get _Str_11824():Boolean
        {
            return (!(this._enteredGuestRoom == null)) && ((this._currentRoomOwner) || (this._navigator._Str_2627.hasSecurity(SecurityLevelEnum._Str_3569)));
        }

        public function onCreditBalance(k:_Str_4522):void
        {
            this._enteredGuestRoom = null;
            this._currentRoomOwner = false;
            this._currentRoomOwner = k.owner;
            this._currentRoomId = k._Str_6550;
        }

        public function _Str_2960():void
        {
            if (this._roomEventData != null)
            {
                this._roomEventData.dispose();
                this._roomEventData = null;
            }
            if (this._enteredGuestRoom != null)
            {
                this._enteredGuestRoom.dispose();
                this._enteredGuestRoom = null;
            }
            this._currentRoomOwner = false;
        }

        public function set _Str_20702(k:_Str_2370):void
        {
            if (this._enteredGuestRoom != null)
            {
                this._enteredGuestRoom.dispose();
            }
            this._enteredGuestRoom = k;
        }

        public function set _Str_4112(k:_Str_3579):void
        {
            if (this._roomEventData != null)
            {
                this._roomEventData.dispose();
            }
            this._roomEventData = k;
        }

        public function get _Str_25160():Boolean
        {
            return (!(this._lastMsg == null)) && (!((this._lastMsg as _Str_4587) == null));
        }

        public function get _Str_25514():Boolean
        {
            return (!(this._lastMsg == null)) && (!((this._lastMsg as _Str_4081) == null));
        }

        public function get _Str_23411():Boolean
        {
            return (!(this._lastMsg == null)) && (!((this._lastMsg as _Str_5078) == null));
        }

        public function get _Str_26351():Boolean
        {
            return (!(this._lastMsg == null)) && (!((this._lastMsg as _Str_5546) == null));
        }

        public function set _Str_4518(k:_Str_4081):void
        {
            this._Str_12759();
            this._lastMsg = k;
            this._adRoomData = k.ad;
            this._loading = false;
        }

        public function set _Str_6697(k:_Str_4587):void
        {
            this._Str_12759();
            this._lastMsg = k;
            this._loading = false;
        }

        public function set _Str_5645(k:_Str_5078):void
        {
            this._Str_12759();
            this._lastMsg = k;
            this._loading = false;
        }

        public function set _Str_7267(k:_Str_5546):void
        {
            this._Str_12759();
            this._lastMsg = k;
            this._loading = false;
        }

        private function _Str_12759():void
        {
            if (this._lastMsg == null)
            {
                return;
            }
            this._lastMsg.dispose();
            this._lastMsg = null;
        }

        public function set _Str_5653(k:_Str_2632):void
        {
            this._adRoomData = k;
        }

        public function set _Str_5482(k:_Str_5485):void
        {
            this._promotedRooms = k;
        }

        public function get _Str_5653():_Str_2632
        {
            return this._adRoomData;
        }

        public function get _Str_4518():_Str_4081
        {
            return this._lastMsg as _Str_4081;
        }

        public function get _Str_6697():_Str_4587
        {
            return this._lastMsg as _Str_4587;
        }

        public function get _Str_5645():_Str_5078
        {
            return this._lastMsg as _Str_5078;
        }

        public function get _Str_7267():_Str_5546
        {
            return this._lastMsg as _Str_5546;
        }

        public function get _Str_5482():_Str_5485
        {
            return this._promotedRooms;
        }

        public function get _Str_4112():_Str_3579
        {
            return this._roomEventData;
        }

        public function get _Str_3251():int
        {
            return this._avatarId;
        }

        public function get _Str_15161():Boolean
        {
            return this._eventMod;
        }

        public function get _Str_14374():Boolean
        {
            return this._roomPicker;
        }

        public function get _Str_12763():Boolean
        {
            return this._currentRoomOwner;
        }

        public function get _Str_2678():_Str_2370
        {
            return this._enteredGuestRoom;
        }

        public function get _Str_20281():Boolean
        {
            return this._hcMember;
        }

        public function get _Str_11597():int
        {
            return this._createdFlatId;
        }

        public function get homeRoomId():int
        {
            return this._homeRoomId;
        }

        public function get _Str_23665():Boolean
        {
            return this._hotRoomPopupOpen;
        }

        public function get _Str_15395():int
        {
            return this._currentRoomRating;
        }

        public function get _Str_5090():Boolean
        {
            return this._canRate;
        }

        public function get _Str_17024():Boolean
        {
            return this._settingsReceived;
        }

        public function get _Str_6357():int
        {
            return this._adIndex;
        }

        public function get _Str_8299():Boolean
        {
            return this._currentRoomIsStaffPick;
        }

        public function get _Str_20386():int
        {
            return this._currentRoomId;
        }

        public function set _Str_3251(k:int):void
        {
            this._avatarId = k;
        }

        public function set _Str_11597(k:int):void
        {
            this._createdFlatId = k;
        }

        public function set _Str_20281(k:Boolean):void
        {
            this._hcMember = k;
        }

        public function set _Str_15161(k:Boolean):void
        {
            this._eventMod = k;
        }

        public function set _Str_14374(k:Boolean):void
        {
            this._roomPicker = k;
        }

        public function set _Str_23665(k:Boolean):void
        {
            this._hotRoomPopupOpen = k;
        }

        public function set homeRoomId(k:int):void
        {
            this._homeRoomId = k;
        }

        public function set _Str_15395(k:int):void
        {
            this._currentRoomRating = k;
        }

        public function set _Str_5090(k:Boolean):void
        {
            this._canRate = k;
        }

        public function set _Str_17024(k:Boolean):void
        {
            this._settingsReceived = k;
        }

        public function set _Str_6357(k:int):void
        {
            this._adIndex = k;
        }

        public function set _Str_8299(k:Boolean):void
        {
            this._currentRoomIsStaffPick = k;
        }

        public function set categories(k:Array):void
        {
            var _local_2:_Str_2802;
            this._allCategories = k;
            this._visibleCategories = new Array();
            for each (_local_2 in this._allCategories)
            {
                if (_local_2.visible)
                {
                    this._visibleCategories.push(_local_2);
                }
            }
        }

        public function get allCategories():Array
        {
            return this._allCategories;
        }

        public function get _Str_11717():Array
        {
            return this._visibleCategories;
        }

        public function _Str_26045(k:int):_Str_2802
        {
            var _local_2:_Str_2802;
            for each (_local_2 in this._allCategories)
            {
                if (_local_2._Str_4760 == k)
                {
                    return _local_2;
                }
            }
            return null;
        }

        public function set _Str_10701(k:Array):void
        {
            var _local_2:_Str_4253;
            this._allEventCategories = k;
            this._visibleEventCategories = new Array();
            for each (_local_2 in this._allEventCategories)
            {
                if (_local_2.visible)
                {
                    this._visibleEventCategories.push(_local_2);
                }
            }
        }

        public function get _Str_26015():Array
        {
            return this._allEventCategories;
        }

        public function get _Str_8075():Array
        {
            return this._visibleEventCategories;
        }

        public function _Str_26114(k:int):_Str_4253
        {
            var _local_2:_Str_4253;
            for each (_local_2 in this._allCategories)
            {
                if (_local_2._Str_2712 == k)
                {
                    return _local_2;
                }
            }
            return null;
        }

        public function _Str_8561(k:_Str_6043):void
        {
            var _local_2:int;
            this._favouriteLimit = k.limit;
            this._favouriteCount = k._Str_13809.length;
            this._favouriteIds = new Dictionary();
            for each (_local_2 in k._Str_13809)
            {
                this._favouriteIds[_local_2] = "yes";
            }
        }

        public function _Str_21350(k:int, _arg_2:Boolean):void
        {
            this._favouriteIds[k] = ((_arg_2) ? "yes" : null);
            this._favouriteCount = (this._favouriteCount + ((_arg_2) ? 1 : -1));
        }

        public function _Str_21092():Boolean
        {
            var k:int = this._enteredGuestRoom.flatId;
            return !(this._favouriteIds[k] == null);
        }

        public function _Str_26257():Boolean
        {
            if (this._enteredGuestRoom == null)
            {
                return false;
            }
            var k:int = this._enteredGuestRoom.flatId;
            return this._homeRoomId == k;
        }

        public function _Str_20543(k:int):Boolean
        {
            return !(this._favouriteIds[k] == null);
        }

        public function _Str_23152():Boolean
        {
            return this._favouriteCount >= this._favouriteLimit;
        }

        public function _Str_8458(k:int):Boolean
        {
            return k == this._homeRoomId;
        }

        public function _Str_23771():void
        {
            this._loading = true;
        }

        public function _Str_19838():Boolean
        {
            return this._loading;
        }

        public function get friendList():FriendList
        {
            return this._friendList;
        }

        public function _Str_23466():RoomSessionTags
        {
            var k:RoomSessionTags = this._roomSessionTags;
            this._roomSessionTags = null;
            return k;
        }

        public function set roomSessionTags(k:RoomSessionTags):void
        {
            this._roomSessionTags = k;
        }

        public function get _Str_4079():_Str_4374
        {
            return this._competitionRoomsData;
        }

        public function set _Str_4079(k:_Str_4374):void
        {
            this._competitionRoomsData = k;
        }
    }
}
