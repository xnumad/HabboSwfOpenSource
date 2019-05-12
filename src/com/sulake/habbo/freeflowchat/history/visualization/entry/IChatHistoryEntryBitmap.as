package com.sulake.habbo.freeflowchat.history.visualization.entry
{
    import flash.display.BitmapData;
    import flash.geom.Rectangle;

    public interface IChatHistoryEntryBitmap 
    {
        function get bitmap():BitmapData;
        function get overlap():Rectangle;
        function get userId():int;
        function get roomId():int;
        function get _Str_6123():Boolean;
        function get userName():String;
    }
}
