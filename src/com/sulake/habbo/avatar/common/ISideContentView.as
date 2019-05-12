package com.sulake.habbo.avatar.common
{
    import com.sulake.core.window.IWindowContainer;

    public interface ISideContentView 
    {
        function dispose():void;
        function getWindowContainer():IWindowContainer;
    }
}
