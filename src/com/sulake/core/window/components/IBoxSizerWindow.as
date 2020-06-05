package com.sulake.core.window.components
{
    import com.sulake.core.window.IWindowContainer;

    public interface IBoxSizerWindow extends IWindowContainer 
    {
        function setHorizontalPadding(_arg_1:int):void;
        function setVerticalPadding(_arg_1:int):void;
        function setSpacing(_arg_1:int):void;
        function setVertical(_arg_1:Boolean):void;
        function setAutoRearrange(_arg_1:Boolean):void;
        function getAutoRearrange():Boolean;
    }
}
