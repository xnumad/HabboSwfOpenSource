package com.sulake.habbo.notifications
{
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.core.utils.Map;

    public interface IHabboNotifications extends IUnknown 
    {
        function showNotification(_arg_1:String, _arg_2:Map=null):void;
        function addSongPlayingNotification(_arg_1:String, _arg_2:String):void;
    }
}
