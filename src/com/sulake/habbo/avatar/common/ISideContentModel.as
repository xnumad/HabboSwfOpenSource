package com.sulake.habbo.avatar.common
{
    import com.sulake.habbo.avatar.HabboAvatarEditor;
    import com.sulake.core.window.IWindowContainer;

    public interface ISideContentModel 
    {
        function dispose():void;
        function reset():void;
        function get controller():HabboAvatarEditor;
        function getWindowContainer():IWindowContainer;
    }
}
