package com.sulake.room.renderer
{
    import com.sulake.room.object.IRoomObject;

    public interface IRoomRendererBase 
    {
        function dispose():void;
        function reset():void;
        function _Str_17585(_arg_1:IRoomObject):void;
        function _Str_16309(_arg_1:IRoomObject):void;
        function update(_arg_1:uint):void;
    }
}
