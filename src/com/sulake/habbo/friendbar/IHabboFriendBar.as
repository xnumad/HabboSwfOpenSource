package com.sulake.habbo.friendbar
{
    import com.sulake.core.runtime.IUnknown;
    import flash.events.IEventDispatcher;

    public interface IHabboFriendBar extends IUnknown 
    {
        function get events():IEventDispatcher;
        function set visible(_arg_1:Boolean):void;
    }
}
