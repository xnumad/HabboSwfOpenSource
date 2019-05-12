package com.sulake.core.window.components
{
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.utils.IIterable;

    public interface IItemListWindow extends IWindow, IScrollableWindow, IIterable 
    {
        function get spacing():int;
        function set spacing(_arg_1:int):void;
        function get _Str_3640():Boolean;
        function set _Str_3640(_arg_1:Boolean):void;
        function get autoArrangeItems():Boolean;
        function set autoArrangeItems(_arg_1:Boolean):void;
        function get _Str_3583():Boolean;
        function set _Str_3583(_arg_1:Boolean):void;
        function get numListItems():int;
        function addListItem(_arg_1:IWindow):IWindow;
        function _Str_3015(_arg_1:IWindow, _arg_2:uint):IWindow;
        function getListItemAt(_arg_1:uint):IWindow;
        function _Str_12066(_arg_1:uint):IWindow;
        function getListItemByName(_arg_1:String):IWindow;
        function _Str_7139(_arg_1:String):IWindow;
        function _Str_3156(_arg_1:IWindow):int;
        function removeListItem(_arg_1:IWindow):IWindow;
        function _Str_2915(_arg_1:int):IWindow;
        function _Str_14121(_arg_1:IWindow, _arg_2:int):void;
        function _Str_17868(_arg_1:IWindow, _arg_2:IWindow):void;
        function _Str_11845(_arg_1:uint, _arg_2:Array, _arg_3:int=0):uint;
        function _Str_7438(_arg_1:String, _arg_2:Array, _arg_3:int=0):uint;
        function _Str_16328(_arg_1:int, _arg_2:int):void;
        function _Str_2659():void;
        function _Str_2724():void;
        function arrangeListItems():void;
        function populate(_arg_1:Array):void;
        function _Str_13999():void;
        function set _Str_6129(_arg_1:Boolean):void;
        function get _Str_8004():Boolean;
        function set _Str_8004(_arg_1:Boolean):void;
        function get _Str_6920():IWindow;
    }
}
