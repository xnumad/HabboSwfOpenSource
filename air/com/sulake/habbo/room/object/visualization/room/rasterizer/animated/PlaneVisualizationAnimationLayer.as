//com.sulake.habbo.room.object.visualization.room.rasterizer.animated.PlaneVisualizationAnimationLayer

package com.sulake.habbo.room.object.visualization.room.rasterizer.animated{
    import com.sulake.core.runtime.IDisposable;
    import flash.display.BitmapData;
    import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
    import com.sulake.room.utils.IVector3d;

    public class PlaneVisualizationAnimationLayer implements IDisposable {

        private var _color:uint;
        private var _bitmapData:BitmapData;
        private var _isDisposed:Boolean;
        private var _items:Array;

        public function PlaneVisualizationAnimationLayer(k:XML, _arg_2:IGraphicAssetCollection);

        public function get disposed():Boolean;

        public function dispose():void;

        public function clearCache():void;

        public function render(k:BitmapData, _arg_2:int, _arg_3:int, _arg_4:IVector3d, _arg_5:int, _arg_6:int, _arg_7:int, _arg_8:int, _arg_9:Number, k0:Number, k1:int):BitmapData;


    }
}//package com.sulake.habbo.room.object.visualization.room.rasterizer.animated

