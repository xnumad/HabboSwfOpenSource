//com.sulake.habbo.communication.messages.incoming.users.GuildCreationData

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuildCreationData implements IGuildData {

        private var _costInCredits:int;
        private var _ownedRooms:Array;
        private var _badgeSettings:Array;

        public function GuildCreationData(k:IMessageDataWrapper);

        public function get costInCredits():int;

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

