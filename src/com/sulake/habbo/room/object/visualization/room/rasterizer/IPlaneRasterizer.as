package com.sulake.habbo.room.object.visualization.room.rasterizer
{
    import flash.display.BitmapData;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.habbo.room.object.visualization.room.utils.PlaneBitmapData;

    public interface IPlaneRasterizer 
    {
        function initializeDimensions(_arg_1:int, _arg_2:int):Boolean;
        function render(_arg_1:BitmapData, _arg_2:String, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:IVector3d, _arg_7:Boolean, _arg_8:Number=0, _arg_9:Number=0, _arg_10:Number=0, _arg_11:Number=0, _arg_12:int=0):PlaneBitmapData;
        function getTextureIdentifier(_arg_1:Number, _arg_2:IVector3d):String;
        function _Str_8988(_arg_1:String):Array;
        function _Str_24005():void;
    }
}
