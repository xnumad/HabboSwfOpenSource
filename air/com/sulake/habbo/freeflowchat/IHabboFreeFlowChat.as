//com.sulake.habbo.freeflowchat.IHabboFreeFlowChat

package com.sulake.habbo.freeflowchat{
    import com.sulake.core.runtime.IUnknown;
    import flash.display.DisplayObject;
    import com.sulake.habbo.freeflowchat.style.IChatStyleLibrary;

    public /*dynamic*/ interface IHabboFreeFlowChat extends IUnknown {

        function get displayObject():DisplayObject;
        function get chatStyleLibrary():IChatStyleLibrary;
        function get isDisabledInPreferences():Boolean;
        function set isDisabledInPreferences(k:Boolean):void;
        function clear():void;
        function toggleVisibility():void;

    }
}//package com.sulake.habbo.freeflowchat

