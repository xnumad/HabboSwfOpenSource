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
        function get _Str_6089():Array;
        function get locked():Boolean;
        function get url():String;
        function get _Str_4830():int;
        function get _Str_17566():int;
        function get badgeCode():String;
        function get _Str_16539():int;
    }
}
