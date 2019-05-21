package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window.IWidget;
    import com.sulake.habbo.room.preview.RoomPreviewer;
    import flash.display.BitmapData;

    public interface _Str_4709 extends IWidget 
    {
        function get scale():int;
        function set scale(_arg_1:int):void;
        function get _Str_26451():RoomPreviewer;
        function _Str_9202(_arg_1:BitmapData):void;
        function get offsetX():int;
        function set offsetX(_arg_1:int):void;
        function get offsetY():int;
        function set offsetY(_arg_1:int):void;
        function get zoom():int;
        function set zoom(_arg_1:int):void;
    }
}
