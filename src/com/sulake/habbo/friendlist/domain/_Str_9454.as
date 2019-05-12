package com.sulake.habbo.friendlist.domain
{
    import com.sulake.habbo.friendlist._Str_6567;
    import com.sulake.habbo.messenger.IHabboMessenger;
    import com.sulake.habbo.notifications.IHabboNotifications;

    public interface _Str_9454 
    {
        function get view():_Str_6567;
        function get messenger():IHabboMessenger;
        function get notifications():IHabboNotifications;
    }
}
