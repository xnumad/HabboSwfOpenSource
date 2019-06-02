//com.sulake.habbo.room.object.visualization.furniture.FurnitureVisualization

package com.sulake.habbo.room.object.visualization.furniture{
    import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.room.object.visualization.utils.IGraphicAsset;
    import com.sulake.room.object.visualization.IRoomObjectSprite;
    import com.sulake.room.object.IRoomObjectModel;

    public class FurnitureVisualization extends RoomObjectSpriteVisualization {

        private static var MAX_ASSET_WIDTH:int;
        protected static const Z_MULTIPLIER:Number;

        private var _direction:int;
        private var _lastCameraAngle:Number;
        private var _selectedColor:int;
        protected var _alphaMultiplier:Number;
        private var _clickUrl:String;
        private var _clickHandling:Boolean;
        private var _data:FurnitureVisualizationData;
        private var _type:String;
        private var _assetNames:Array;
        private var _assetNamesFrame:Array;
        private var _cacheSize:int;
        private var _spriteTags:Array;
        private var _spriteAlphas:Array;
        private var _spriteColors:Array;
        private var _spriteXOffsets:Array;
        private var _spriteYOffsets:Array;
        private var _spriteZOffsets:Array;
        private var _spriteMouseCaptures:Array;
        private var _spriteInks:Array;
        protected var _alphaChanged:Boolean;
        protected var _layerCount:int;
        protected var _shadowLayerIndex:int;
        private var _updatedLayers:int;
        private var _furnitureLift:Number = 0;
        private var _gpuMode:Boolean;
        private var _maskLayerIndex:int;
        protected var _isHole:Boolean;

        public function FurnitureVisualization();

        private static function resetArr(k:Array):Array;


        protected function set direction(k:int):void;

        protected function get direction():int;

        protected function get type():String;

        override public function dispose():void;

        override protected function reset():void;

        private function resetCacheArrays():void;

        override public function initialize(k:IRoomObjectVisualizationData):Boolean;

        override public function update(k:IRoomGeometry, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean, _arg_5:Number, _arg_6:Number):Boolean;

        protected function updateAllSprites(k:int):void;

        protected function updateSprites(k:int, _arg_2:int):void;

        private function updateSprite(k:int, _arg_2:int):void;

        private function updateSpriteCPU(k:IGraphicAsset, _arg_2:IRoomObjectSprite):void;

        protected function updateSpriteGPU(k:String, _arg_2:IGraphicAsset, _arg_3:IRoomObjectSprite, _arg_4:int, _arg_5:Boolean):void;

        protected function resetSprite(k:IRoomObjectSprite):void;

        protected function getBlendMode(k:int):String;

        protected function updateObject(k:Number, _arg_2:Number):Boolean;

        protected function updateModel(k:Number):Boolean;

        protected function getAdClickUrl(k:IRoomObjectModel):String;

        protected function updateAnimation(k:Number, _arg_2:Boolean=false):int;

        private function updateAssetAndSpriteCache(k:Number, _arg_2:int):void;

        protected function updateLayerCount(k:int):void;

        protected function getAdditionalSpriteCount():int;

        protected function getFrameNumber(k:int, _arg_2:int):int;

        protected function getAsset(k:String, _arg_2:int=-1):IGraphicAsset;

        protected function getSpriteAssetName(k:int, _arg_2:int):String;

        protected function getSpriteAssetNameWithoutFrame(k:int, _arg_2:int, _arg_3:Boolean):String;

        protected function getSpriteTag(k:int, _arg_2:int, _arg_3:int):String;

        protected function getSpriteAlpha(k:int, _arg_2:int, _arg_3:int):int;

        protected function getSpriteColor(k:int, _arg_2:int, _arg_3:int):int;

        protected function getSpriteXOffset(k:int, _arg_2:int, _arg_3:int):int;

        protected function getSpriteYOffset(k:int, _arg_2:int, _arg_3:int):int;

        protected function getSpriteMouseCapture(k:int, _arg_2:int, _arg_3:int):Boolean;

        protected function getSpriteInk(k:int, _arg_2:int, _arg_3:int):int;

        protected function getSpriteZOffset(k:int, _arg_2:int, _arg_3:int):Number;

        protected function getSize(k:int):int;

        protected function get data():FurnitureVisualizationData;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

