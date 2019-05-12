package com.sulake.room
{
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.renderer.IRoomRendererBase;

    public interface IRoomInstance 
    {
        function getNumber(_arg_1:String):Number;
        function setNumber(_arg_1:String, _arg_2:Number, _arg_3:Boolean=false):void;
        function getString(_arg_1:String):String;
        function setString(_arg_1:String, _arg_2:String, _arg_3:Boolean=false):void;
        function dispose():void;
        function update():void;
        function _Str_5865(_arg_1:int, _arg_2:String, _arg_3:int):IRoomObject;
        function _Str_3299(_arg_1:int, _arg_2:int):IRoomObject;
        function _Str_9669(_arg_1:int):Array;
        function _Str_3915(_arg_1:int, _arg_2:int):Boolean;
        function _Str_4421(_arg_1:int):int;
        function _Str_11503(_arg_1:int, _arg_2:String, _arg_3:int):IRoomObject;
        function _Str_9675(_arg_1:String, _arg_2:int):int;
        function _Str_5477(_arg_1:int, _arg_2:int):IRoomObject;
        function _Str_20931(_arg_1:int):int;
        function _Str_21782(_arg_1:IRoomRendererBase):void;
        function _Str_11132():IRoomRendererBase;
    }
}
