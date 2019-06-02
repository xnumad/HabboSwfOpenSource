//com.sulake.room.renderer.RoomSpriteCanvas

package com.sulake.room.renderer{
    import flash.geom.Point;
    import com.sulake.room.utils.RoomGeometry;
    import flash.display.Sprite;
    import com.sulake.core.utils.Map;
    import com.sulake.room.renderer.cache.BitmapDataCache;
    import com.sulake.room.renderer.cache.RoomObjectCache;
    import flash.geom.ColorTransform;
    import flash.geom.Matrix;
    import flash.display.DisplayObject;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.room.renderer.cache.RoomObjectCacheItem;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.renderer.utils.ExtendedSprite;
    import com.sulake.room.renderer.utils.SortableSprite;
    import com.sulake.room.object.visualization.IRoomObjectSprite;
    import flash.display.BitmapData;
    import com.sulake.room.renderer.utils.ExtendedBitmapData;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import flash.events.MouseEvent;
    import flash.display.DisplayObjectContainer;
    import away3d.containers.ObjectContainer3D;
    import away3d.cameras.Camera3D;
    import starling.display.DisplayObject;
    import starling.display.DisplayObjectContainer;
    import starling.display.Sprite;

    public class RoomSpriteCanvas implements IRoomRenderingCanvas {

        private static const ZERO_POINT:Point;
        private static const SKIP_FRAME_COUNT_FOR_UPDATE_INTERVAL:int;
        private static const FRAME_COUNT_FOR_UPDATE_INTERVAL:int;
        private static const SLOW_FRAME_UPDATE_INTERVAL:Number;
        private static const FAST_FRAME_UPDATE_INTERVAL:Number;
        private static const MAXIMUM_VALID_FRAME_UPDATE_INTERVAL:int;

        protected var _container:IRoomSpriteCanvasContainer;
        protected var _geometry:RoomGeometry;
        private var _bgColor:int;
        private var _master:Sprite;
        private var _spriteMask:Sprite;
        private var _display:Sprite;
        private var _mouseActiveObjects:Map;
        private var _mouseLocation:Point;
        private var _bitmapDataCache:BitmapDataCache;
        protected var _roomObjectCache:RoomObjectCache;
        private var _sortableSpriteList:Array;
        private var _spritePool:Array;
        private var _mouseListener:IRoomRenderingCanvasMouseListener;
        private var _id:String;
        private var _eventCache:Map;
        private var _eventId:int;
        private var _wd:int;
        private var _ht:int;
        private var _screenOffsetX:int;
        private var _screenOffsetY:int;
        private var _renderedWd:int;
        private var _renderedHt:int;
        private var _renderTimeStamp:int;
        private var _mouseOldX:Number;
        private var _mouseOldY:Number;
        private var _mouseCheckCount:int;
        private var _mouseSpriteWasHit:Boolean;
        private var _useMask:Boolean;
        private var _colorTransform:ColorTransform;
        private var _flipHorizontalMatrix:Matrix;
        private var _averageUpdateInterval:Number = 0;
        private var _updateCounter:int;
        private var _runningSlow:Boolean;
        private var _skipObjectUpdate:Boolean;
        private var _spriteCount:int;
        private var _usesExclusionRectangles:Boolean;
        private var _excludedRectangles:Array;
        private var _activeSpriteCount:int;
        private var _averageRenderMs:Number = 0;
        private var _previousRenderMs:int;
        private var _previousSlowFrameUpdateMs:int;

        public function RoomSpriteCanvas(k:IRoomSpriteCanvasContainer, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:int);

        protected function get container():IRoomSpriteCanvasContainer;

        protected function get activeSpriteCount():int;

        public function get width():int;

        public function get height():int;

        public function setScreenOffset(k:int, _arg_2:int):void;

        public function set screenOffsetX(k:int):void;

        public function set screenOffsetY(k:int):void;

        public function get screenOffsetX():int;

        public function get screenOffsetY():int;

        public function get scale():Number;

        public function setScale(k:Number, _arg_2:Point=null, _arg_3:Point=null):void;

        public function get displayObject():DisplayObject;

        public function get geometry():IRoomGeometry;

        public function set mouseListener(k:IRoomRenderingCanvasMouseListener):void;

        public function set useMask(k:Boolean):void;

        public function dispose():void;

        public function initialize(k:int, _arg_2:int):void;

        public function roomObjectRemoved(k:String):void;

        public function render(k:int):void;

        private function calculateUpdateInterval(k:int):void;

        protected function getRoomObjectCacheItem(k:String):RoomObjectCacheItem;

        private function renderObject(k:IRoomObject, _arg_2:String, _arg_3:int, _arg_4:Boolean, _arg_5:int):int;

        private function rectangleVisible(k:int, _arg_2:int, _arg_3:int, _arg_4:int):Boolean;

        private function rectangleVisibleWithExclusion(k:int, _arg_2:int, _arg_3:int, _arg_4:int):Boolean;

        protected function getSprite(k:int):ExtendedSprite;

        private function createSprite(k:SortableSprite, _arg_2:int=-1):void;

        protected function updateSprite(k:int, _arg_2:SortableSprite):Boolean;

        private function updateEnterRoomEffect(k:ExtendedSprite, _arg_2:IRoomObjectSprite):void;

        private function cleanSprites(k:int, _arg_2:Boolean=false):void;

        private function cleanSprite(k:ExtendedSprite, _arg_2:Boolean):void;

        private function getSortableSprite(k:int):SortableSprite;

        private function getBitmapData(k:BitmapData, _arg_2:String, _arg_3:Boolean, _arg_4:Boolean, _arg_5:int):BitmapData;

        private function getFlippedBitmapData(k:BitmapData, _arg_2:String, _arg_3:Boolean=false, _arg_4:Boolean=true, _arg_5:Boolean=false):ExtendedBitmapData;

        private function getColoredBitmapData(k:BitmapData, _arg_2:String, _arg_3:int, _arg_4:Boolean=false):ExtendedBitmapData;

        protected function getObjectId(k:ExtendedSprite):String;

        public function handleMouseEvent(k:int, _arg_2:int, _arg_3:String, _arg_4:Boolean, _arg_5:Boolean, _arg_6:Boolean, _arg_7:Boolean):Boolean;

        protected function createMouseEvent(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:String, _arg_6:String, _arg_7:Boolean, _arg_8:Boolean, _arg_9:Boolean, k0:Boolean):RoomSpriteMouseEvent;

        private function checkMouseClickHits(k:Number, _arg_2:Number, _arg_3:Boolean, _arg_4:Boolean=false, _arg_5:Boolean=false, _arg_6:Boolean=false, _arg_7:Boolean=false):Boolean;

        private function checkMouseHits(k:int, _arg_2:int, _arg_3:String, _arg_4:Boolean=false, _arg_5:Boolean=false, _arg_6:Boolean=false, _arg_7:Boolean=false):Boolean;

        protected function bufferMouseEvent(k:RoomSpriteMouseEvent, _arg_2:String):void;

        protected function processMouseEvents():void;

        public function update():void;

        private function clickHandler(k:MouseEvent):void;

        public function get displayObjectContainer():DisplayObjectContainer;

        public function get objectContainer3D():ObjectContainer3D;

        public function set camera3D(k:Camera3D):void;

        public function get starlingDisplayObject():DisplayObject;

        public function get starlingDisplayObjectContainer():DisplayObjectContainer;

        public function set visible(k:Boolean):void;

        public function showObjectModifier(k:IRoomObject, _arg_2:String=null):void;

        public function get wd2():int;

        public function get ht2():int;

        public function get roomContainerGPU():Sprite;

        public function setObjectActiveState(k:IRoomObject, _arg_2:Boolean):void;

        public function toggleDebugTools():void;

        public function pause():void;

        public function resume():void;

        public function setFollowTarget(k:IRoomObject):void;


    }
}//package com.sulake.room.renderer

