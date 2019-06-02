//com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager

package com.sulake.habbo.room.object.visualization.room.mask{
    import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
    import com.sulake.core.utils.Map;
    import flash.display.BitmapData;
    import com.sulake.room.utils.IVector3d;

    public class PlaneMaskManager {

        private var _assetCollection:IGraphicAssetCollection;
        private var _masks:Map;
        private var _data:XML;

        public function PlaneMaskManager();

        public function get data():XML;

        public function dispose():void;

        public function initialize(k:XML):void;

        public function initializeAssetCollection(k:IGraphicAssetCollection):void;

        private function parseMasks(k:XML, _arg_2:IGraphicAssetCollection):void;

        private function parseMaskBitmaps(k:XMLList, _arg_2:PlaneMaskVisualization, _arg_3:IGraphicAssetCollection):void;

        public function updateMask(k:BitmapData, _arg_2:String, _arg_3:Number, _arg_4:IVector3d, _arg_5:int, _arg_6:int):Boolean;


    }
}//package com.sulake.habbo.room.object.visualization.room.mask

