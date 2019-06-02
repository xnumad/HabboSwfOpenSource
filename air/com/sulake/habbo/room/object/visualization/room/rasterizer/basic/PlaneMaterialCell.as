//com.sulake.habbo.room.object.visualization.room.rasterizer.basic.PlaneMaterialCell

package com.sulake.habbo.room.object.visualization.room.rasterizer.basic{
    import com.sulake.room.utils.Vector3d;
    import flash.display.BitmapData;
    import com.sulake.room.utils.IVector3d;

    public class PlaneMaterialCell {

        private static const zeroVector:Vector3d;

        private var _cachedBitmapData:BitmapData;
        private var _texture:PlaneTexture;
        private var _extraItemOffsets:Array;
        private var _extraItemAssets:Array;
        private var _extraItemCount:int;

        public function PlaneMaterialCell(k:PlaneTexture, _arg_2:Array=null, _arg_3:Array=null, _arg_4:int=0);

        public function get isStatic():Boolean;

        public function dispose():void;

        public function clearCache():void;

        public function getHeight(k:IVector3d):int;

        public function render(k:IVector3d, _arg_2:int, _arg_3:int):BitmapData;

        public function renderSample():BitmapData;


    }
}//package com.sulake.habbo.room.object.visualization.room.rasterizer.basic

