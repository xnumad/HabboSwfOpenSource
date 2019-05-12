package com.sulake.room
{
    import com.sulake.core.runtime.IUnknown;

    public interface IRoomManager extends IUnknown 
    {
        function initialize(_arg_1:XML, _arg_2:IRoomManagerListener):Boolean;
        function update(_arg_1:uint):void;
        function _Str_22189(_arg_1:IRoomContentLoader):void;
        function _Str_4608(_arg_1:int):void;
        function _Str_9123(_arg_1:int):void;
        function _Str_5942(_arg_1:String, _arg_2:XML):IRoomInstance;
        function _Str_7482(_arg_1:String):Boolean;
        function _Str_2881(_arg_1:String):IRoomInstance;
        function _Str_19091(_arg_1:int):IRoomInstance;
        function _Str_20300():int;
        function _Str_19453(_arg_1:String):Boolean;
    }
}
