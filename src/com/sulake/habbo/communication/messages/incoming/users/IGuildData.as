package com.sulake.habbo.communication.messages.incoming.users
{
    public interface IGuildData
    {
        function get ownedRooms():Array;
        function get exists():Boolean;
        function get isOwner():Boolean;
        function get groupId():int;
        function get groupName():String;
        function get groupDesc():String;
        function get baseRoomId():int;
        function get primaryColorId():int;
        function get secondaryColorId():int;
        function get badgeSettings():Array;
        function get locked():Boolean;
        function get url():String;
        function get guildType():int;
        function get guildRightsLevel():int;
        function get badgeCode():String;
        function get membershipCount():int;
    }
}
