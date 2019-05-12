package com.sulake.habbo.ui
{
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.core.window.components.IDisplayObjectWrapper;
    import flash.events.MouseEvent;

    public interface IRoomUI extends IUnknown 
    {
        function _Str_16218(_arg_1:IRoomSession):IRoomDesktop;
        function get _Str_10612():IDisplayObjectWrapper;
        function _Str_17382(_arg_1:String):void;
        function getDesktop(_arg_1:String):IRoomDesktop;
        function _Str_17538(_arg_1:int):int;
        function set visible(_arg_1:Boolean):void;
        function _Str_25327(_arg_1:String):void;
        function _Str_9753(_arg_1:int, _arg_2:String, _arg_3:uint, _arg_4:int):void;
        function _Str_21446(_arg_1:MouseEvent):Boolean;
        function _Str_22028():void;
    }
}
