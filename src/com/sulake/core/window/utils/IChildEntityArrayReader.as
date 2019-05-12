package com.sulake.core.window.utils
{
    public interface IChildEntityArrayReader 
    {
        function get numChildren():int;
        function getChildAt(_arg_1:int):IChildEntity;
        function getChildByID(_arg_1:int):IChildEntity;
        function getChildByName(_arg_1:String):IChildEntity;
        function getChildIndex(_arg_1:IChildEntity):int;
        function groupChildrenWithID(_arg_1:uint, _arg_2:Array):uint;
    }
}
