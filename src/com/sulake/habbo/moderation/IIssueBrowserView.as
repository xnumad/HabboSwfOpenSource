package com.sulake.habbo.moderation
{
    import com.sulake.core.window.IWindowContainer;

    public interface IIssueBrowserView 
    {
        function set visible(_arg_1:Boolean):void;
        function update():void;
        function get view():IWindowContainer;
    }
}
