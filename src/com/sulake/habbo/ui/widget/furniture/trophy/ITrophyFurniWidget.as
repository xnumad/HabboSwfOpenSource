package com.sulake.habbo.ui.widget.furniture.trophy
{
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.window.IHabboWindowManager;

    public interface ITrophyFurniWidget 
    {
        function get assets():IAssetLibrary;
        function get name():String;
        function get date():String;
        function get color():int;
        function get windowManager():IHabboWindowManager;
        function get message():String;
    }
}
