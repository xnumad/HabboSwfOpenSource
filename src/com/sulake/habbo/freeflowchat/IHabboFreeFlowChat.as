package com.sulake.habbo.freeflowchat
{
    import com.sulake.core.runtime.IUnknown;
    import flash.display.DisplayObject;
    import com.sulake.habbo.freeflowchat.style.IChatStyleLibrary;

    public interface IHabboFreeFlowChat extends IUnknown 
    {
        function get displayObject():DisplayObject;
        function get chatStyleLibrary():IChatStyleLibrary;
        function get isDisabledInPreferences():Boolean;
        function set isDisabledInPreferences(_arg_1:Boolean):void;
        function get preferedChatStyle():int;
        function set preferedChatStyle(_arg_1:int):void;
        function clear():void;
        function toggleVisibility():void;
    }
}
