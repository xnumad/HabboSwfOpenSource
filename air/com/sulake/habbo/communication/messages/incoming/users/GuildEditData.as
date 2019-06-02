//com.sulake.habbo.communication.messages.incoming.users.GuildEditData

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuildEditData implements IGuildData {

        private var _ownedRooms:Array;
        private var _isOwner:Boolean;
        private var _groupId:int;
        private var _groupName:String;
        private var _groupDesc:String;
        private var _baseRoomId:int;
        private var _primaryColorId:int;
        private var _secondaryColorId:int;
        private var _locked:Boolean;
        private var _url:String;
        private var _guildType:int;
        private var _guildRightsLevel:int;
        private var _badgeSettings:Array;
        private var _badgeCode:String;
        private var _membershipCount:int;

        public function GuildEditData(k:IMessageDataWrapper);

        public function get ownedRooms():Array;

        public function get exists():Boolean;

        public function get isOwner():Boolean;

        public function get groupId():int;

        public function get groupName():String;

        public function get groupDesc():String;

        public function get baseRoomId():int;

        public function get primaryColorId():int;

        public function get secondaryColorId():int;

        public function get badgeSettings():Array;

        public function get locked():Boolean;

        public function get url():String;

        public function get guildType():int;

        public function get guildRightsLevel():int;

        public function get badgeCode():String;

        public function get membershipCount():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

