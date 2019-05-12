package com.sulake.core.window.utils
{
    public interface IChildEntityArray extends IChildEntityArrayReader 
    {
        function addChild(_arg_1:IChildEntity):IChildEntity;
        function addChildAt(_arg_1:IChildEntity, _arg_2:int):IChildEntity;
        function removeChild(_arg_1:IChildEntity):IChildEntity;
        function removeChildAt(_arg_1:int):IChildEntity;
        function setChildIndex(_arg_1:IChildEntity, _arg_2:int):void;
        function swapChildren(_arg_1:IChildEntity, _arg_2:IChildEntity):void;
        function swapChildrenAt(_arg_1:int, _arg_2:int):void;
    }
}
