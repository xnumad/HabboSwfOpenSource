package com.sulake.core.window.components
{
    import com.sulake.core.window.IWindow;
    import flash.display.DisplayObject;

    public interface IDisplayObjectWrapper extends IWindow 
    {
        function setDisplayObject(_arg_1:DisplayObject):void;
        function getDisplayObject():DisplayObject;
    }
}
