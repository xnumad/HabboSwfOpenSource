//com.sulake.room.object.visualization.RoomObjectSpriteVisualization

package com.sulake.room.object.visualization{
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
    import com.sulake.room.utils.IRoomGeometry;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;

    public class RoomObjectSpriteVisualization implements IRoomObjectSpriteVisualization {

        protected static const SEPARATOR:String;
        private static var _globalInstanceId:int;

        private var _layersInUse:Array;
        private var _sprites:Array;
        private var _spriteCount:int;
        private var _object:IRoomObject;
        private var _assetCollection:IGraphicAssetCollection;
        protected var _objectUpdateID:int;
        protected var _modelUpdateID:int;
        protected var _currentScale:int;
        protected var _disposed:Boolean;
        protected var _forcedCPUSpriteHandling:Boolean;
        private var _instanceId:int;
        private var _updateID:int;

        public function RoomObjectSpriteVisualization();

        public function dispose():void;

        public function hasAnimationFrames():Boolean;

        public function set assetCollection(k:IGraphicAssetCollection):void;

        public function set externalBaseUrl(k:String):void;

        public function get assetCollection():IGraphicAssetCollection;

        public function getUpdateID():int;

        public function getInstanceId():int;

        protected function createSprites(k:int):void;

        public function addSprite():IRoomObjectSprite;

        public function addSpriteAt(k:int):IRoomObjectSprite;

        public function removeSprite(k:IRoomObjectSprite):void;

        public function get spriteCount():int;

        public function getSprite(k:int):IRoomObjectSprite;

        public function get object():IRoomObject;

        public function set object(k:IRoomObject):void;

        public function update(k:IRoomGeometry, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean, _arg_5:Number, _arg_6:Number):Boolean;

        protected function increaseUpdateId():void;

        protected function reset():void;

        public function initialize(k:IRoomObjectVisualizationData):Boolean;

        public function get image():BitmapData;

        public function getImage(k:int, _arg_2:int):BitmapData;

        public function get boundingRectangle():Rectangle;

        public function forceCPUSpriteHandling():void;


    }
}//package com.sulake.room.object.visualization

