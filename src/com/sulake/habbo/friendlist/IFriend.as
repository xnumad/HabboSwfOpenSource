package com.sulake.habbo.friendlist
{
    public interface IFriend 
    {
        function get id():int;
        function get name():String;
        function get gender():int;
        function get online():Boolean;
        function get followingAllowed():Boolean;
        function get figure():String;
        function get realName():String;
        function get persistedMessageUser():Boolean;
        function get pocketHabboUser():Boolean;
        function get relationshipStatus():int;
    }
}
