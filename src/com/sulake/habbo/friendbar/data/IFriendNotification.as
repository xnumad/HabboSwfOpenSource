package com.sulake.habbo.friendbar.data
{
    public interface IFriendNotification 
    {
        function get typeCode():int;
        function set typeCode(_arg_1:int):void;
        function get message():String;
        function set message(_arg_1:String):void;
        function get viewOnce():Boolean;
        function set viewOnce(_arg_1:Boolean):void;
    }
}
