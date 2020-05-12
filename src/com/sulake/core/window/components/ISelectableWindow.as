package com.sulake.core.window.components
{
    import com.sulake.core.window.IWindow;

    public interface ISelectableWindow extends IWindow 
    {
        function get selector():ISelectorWindow;
        function get Selected():Boolean;
        function set Selected(_arg_1:Boolean):void;
        function select():Boolean;
        function unselect():Boolean;
    }
}
