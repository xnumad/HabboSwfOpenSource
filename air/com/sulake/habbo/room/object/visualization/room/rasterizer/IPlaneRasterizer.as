//com.sulake.habbo.room.object.visualization.room.rasterizer.IPlaneRasterizer

package com.sulake.habbo.room.object.visualization.room.rasterizer{
    import flash.display.BitmapData;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.habbo.room.object.visualization.room.utils.PlaneBitmapData;
    import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.Plane;

    public /*dynamic*/ interface IPlaneRasterizer {

        function initializeDimensions(k:int, _arg_2:int):Boolean;
        function render(k:BitmapData, _arg_2:String, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:IVector3d, _arg_7:Boolean, _arg_8:Number=0, _arg_9:Number=0, k0:Number=0, k1:Number=0, k2:int=0):PlaneBitmapData;
        function getTextureIdentifier(k:Number, _arg_2:IVector3d):String;
        function reinitialize():void;
        function getPlane(k:String):Plane;

    }
}//package com.sulake.habbo.room.object.visualization.room.rasterizer

