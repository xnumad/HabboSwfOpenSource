//com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData

package com.sulake.habbo.communication.messages.incoming.navigator{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuestRoomData implements IDisposable {

        private var _flatId:int;
        private var _roomName:String;
        private var _showOwner:Boolean;
        private var _ownerId:int;
        private var _ownerName:String;
        private var _doorMode:int;
        private var _userCount:int;
        private var _maxUserCount:int;
        private var _description:String;
        private var _srchSpecPrm:int;
        private var _tradeMode:int;
        private var _score:int;
        private var _ranking:int;
        private var _categoryId:int;
        private var _habboGroupId:int;
        private var _groupName:String;
        private var _groupBadgeCode:String;
        private var _eventCreationTime:String;
        private var _tags:Array;
        private var _thumbnail:RoomThumbnailData;
        private var _allowPets:Boolean;
        private var _displayRoomEntryAd:Boolean;
        private var _roomAdName:String;
        private var _roomAdDescription:String;
        private var _roomAdExpiresInMin:int;
        private var _allInRoomMuted:Boolean;
        private var _canMute:Boolean;
        private var _disposed:Boolean;

        public function GuestRoomData(k:IMessageDataWrapper);

        public function dispose():void;

        public function get disposed():Boolean;

        public function get flatId():int;

        public function get roomName():String;

        public function get showOwner():Boolean;

        public function get ownerId():int;

        public function get ownerName():String;

        public function get doorMode():int;

        public function get userCount():int;

        public function get maxUserCount():int;

        public function get description():String;

        public function get srchSpecPrm():int;

        public function get tradeMode():int;

        public function get score():int;

        public function get ranking():int;

        public function get categoryId():int;

        public function get habboGroupId():int;

        public function get groupName():String;

        public function get groupBadgeCode():String;

        public function get eventCreationTime():String;

        public function get tags():Array;

        public function get thumbnail():RoomThumbnailData;

        public function get allowPets():Boolean;

        public function get displayRoomEntryAd():Boolean;

        public function get roomAdName():String;

        public function get roomAdDescription():String;

        public function get roomAdExpiresInMin():int;

        public function get allInRoomMuted():Boolean;

        public function set allInRoomMuted(k:Boolean):void;

        public function get canMute():Boolean;

        public function set canMute(k:Boolean):void;


    }
}//package com.sulake.habbo.communication.messages.incoming.navigator

