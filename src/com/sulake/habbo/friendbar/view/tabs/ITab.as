package com.sulake.habbo.friendbar.view.tabs
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindowContainer;

    public interface ITab extends IDisposable 
    {
        function get window():IWindowContainer;
        function get selected():Boolean;
        function get _Str_6044():Boolean;
        function select(_arg_1:Boolean):void;
        function deselect(_arg_1:Boolean):void;
        function recycle():void;
    }
}
