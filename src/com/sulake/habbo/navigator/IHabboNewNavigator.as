package com.sulake.habbo.navigator
{
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.habbo.help.IHabboHelp;

    public interface IHabboNewNavigator extends IUnknown 
    {
        function open():void;
        function performSearch(_arg_1:String, _arg_2:String="", _arg_3:String=""):void;
        function performTagSearch(_arg_1:String):void;
        function goToRoom(_arg_1:int, _arg_2:String="mainview"):void;
        function get isReady():Boolean;
        function get legacyNavigator():IHabboNavigator;
        function get habboHelp():IHabboHelp;
    }
}
