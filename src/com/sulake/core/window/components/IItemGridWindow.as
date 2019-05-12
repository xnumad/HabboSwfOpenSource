package com.sulake.core.window.components
{
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.utils.IIterable;

    public interface IItemGridWindow extends IWindow, IScrollableWindow, IIterable 
    {
        function get spacing():int;
        function set spacing(_arg_1:int):void;
        function set _Str_13282(_arg_1:int):void;
        function get _Str_3640():Boolean;
        function set _Str_3640(_arg_1:Boolean):void;
        function get autoArrangeItems():Boolean;
        function set autoArrangeItems(_arg_1:Boolean):void;
        function get _Str_3583():Boolean;
        function set _Str_3583(_arg_1:Boolean):void;
        function get _Str_3080():uint;
        function get _Str_11491():uint;
        function get numGridItems():uint;
        function _Str_2816(_arg_1:IWindow):IWindow;
        function _Str_12115(_arg_1:IWindow, _arg_2:uint):IWindow;
        function _Str_2830(_arg_1:uint):IWindow;
        function _Str_15490(_arg_1:uint):IWindow;
        function _Str_13519(_arg_1:String):IWindow;
        function _Str_18560(_arg_1:String):IWindow;
        function _Str_3373(_arg_1:IWindow):int;
        function _Str_4725(_arg_1:IWindow):IWindow;
        function _Str_17500(_arg_1:int):IWindow;
        function _Str_17625(_arg_1:IWindow, _arg_2:int):void;
        function _Str_13972(_arg_1:IWindow, _arg_2:IWindow):void;
        function _Str_18089(_arg_1:int, _arg_2:int):void;
        function _Str_3956():void;
        function destroyGridItems():void;
        function set _Str_6405(_arg_1:Boolean):void;
        function get _Str_6405():Boolean;
        function _Str_11488():void;
        function set _Str_7858(_arg_1:Boolean):void;
        function get _Str_7858():Boolean;
        function populate(_arg_1:Array):void;
    }
}
