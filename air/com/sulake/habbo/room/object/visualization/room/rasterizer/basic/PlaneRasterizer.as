//com.sulake.habbo.room.object.visualization.room.rasterizer.basic.PlaneRasterizer

package com.sulake.habbo.room.object.visualization.room.rasterizer.basic{
    import com.sulake.habbo.room.object.visualization.room.rasterizer.IPlaneRasterizer;
    import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
    import com.sulake.core.utils.Map;
    import com.sulake.room.utils.IRoomGeometry;
    import flash.display.BitmapData;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.habbo.room.object.visualization.room.utils.PlaneBitmapData;

    public class PlaneRasterizer implements IPlaneRasterizer {

        protected static const DEFAULT_TYPE:String;

        private var _assetCollection:IGraphicAssetCollection;
        private var _materials:Map;
        private var _textures:Map;
        private var _planes:Map;
        private var _geometries:Map;
        private var _data:XML;

        public function PlaneRasterizer();

        protected function get data():XML;

        protected function get assetCollection():IGraphicAssetCollection;

        public function initializeDimensions(k:int, _arg_2:int):Boolean;

        public function dispose():void;

        public function clearCache():void;

        public function initialize(k:XML):void;

        public function reinitialize():void;

        private function resetMaterials():void;

        private function resetTextures():void;

        public function getTexture(k:String):PlaneTexture;

        protected function getMaterial(k:String):PlaneMaterial;

        public function getPlane(k:String):Plane;

        protected function addPlane(k:String, _arg_2:Plane):Boolean;

        public function initializeAssetCollection(k:IGraphicAssetCollection):void;

        private function initializeAll():void;

        private function initializeTexturesAndMaterials():void;

        protected function initializePlanes():void;

        private function parseTextures(k:XML, _arg_2:IGraphicAssetCollection):void;

        private function parsePlaneMaterials(k:XML):void;

        private function parsePlaneMaterialCellColumn(k:XML, _arg_2:PlaneMaterialCellMatrix, _arg_3:int):void;

        private function parsePlaneMaterialCells(k:XML):Array;

        private function parseExtraItemTypes(k:XML):Array;

        private function parseExtraItemOffsets(k:XML):Array;

        protected function getGeometry(k:int, _arg_2:Number, _arg_3:Number):IRoomGeometry;

        protected function parseVisualizations(k:Plane, _arg_2:XMLList):void;

        public function render(k:BitmapData, _arg_2:String, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:IVector3d, _arg_7:Boolean, _arg_8:Number=0, _arg_9:Number=0, k0:Number=0, k1:Number=0, k2:int=0):PlaneBitmapData;

        public function getTextureIdentifier(k:Number, _arg_2:IVector3d):String;


    }
}//package com.sulake.habbo.room.object.visualization.room.rasterizer.basic

