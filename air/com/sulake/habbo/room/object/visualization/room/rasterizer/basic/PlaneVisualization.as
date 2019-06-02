//com.sulake.habbo.room.object.visualization.room.rasterizer.basic.PlaneVisualization

package com.sulake.habbo.room.object.visualization.room.rasterizer.basic{
    import com.sulake.room.utils.IRoomGeometry;
    import flash.display.BitmapData;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
    import com.sulake.room.utils.IVector3d;

    public class PlaneVisualization {

        private var _layers:Array;
        private var _geometry:IRoomGeometry;
        private var _cachedBitmapData:BitmapData;
        private var _cachedBitmapNormal:Vector3d;
        private var _isCached:Boolean;
        private var _hasAnimationLayers:Boolean;

        public function PlaneVisualization(k:Number, _arg_2:int, _arg_3:IRoomGeometry);

        public function get geometry():IRoomGeometry;

        public function get hasAnimationLayers():Boolean;

        public function dispose():void;

        public function clearCache():void;

        public function setLayer(k:int, _arg_2:PlaneMaterial, _arg_3:uint, _arg_4:int, _arg_5:int=0):Boolean;

        public function setAnimationLayer(k:int, _arg_2:XML, _arg_3:IGraphicAssetCollection):Boolean;

        public function render(k:BitmapData, _arg_2:int, _arg_3:int, _arg_4:IVector3d, _arg_5:Boolean, _arg_6:int=0, _arg_7:int=0, _arg_8:int=0, _arg_9:int=0, k0:Number=0, k1:Number=0, k2:int=0):BitmapData;

        public function get firstLayer():PlaneVisualizationLayer;


    }
}//package com.sulake.habbo.room.object.visualization.room.rasterizer.basic

