//com.sulake.room.renderer.RoomSpriteCanvas3d

package com.sulake.room.renderer{
    import com.sulake.core.runtime.IUpdateReceiver;
    import starling.display.Sprite;
    import starling.display.Quad;
    import starling.display.QuadBatch;
    import flash.utils.Dictionary;
    import away3d.containers.ObjectContainer3D;
    import away3d.cameras.Camera3D;
    import com.sulake.room.renderer.utils.DebugTools;
    import com.sulake.room.utils.RoomGeometry;
    import com.sulake.room.renderer.cache.RoomObjectCache;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.ui.IRoomDesktopGPU;
    import com.sulake.room.utils.IVector3d;
    import starling.display.Image;
    import com.sulake.habbo.room.events.RoomEngineObjectEvent;
    import starling.events.Event;
    import com.sulake.room.object.image.ISortableImage;
    import com.sulake.room.object.visualization.IRoomObjectSprite;
    import flash.display.DisplayObject;
    import flash.display.DisplayObjectContainer;
    import starling.display.DisplayObject;
    import starling.display.DisplayObjectContainer;
    import com.sulake.room.utils.IRoomGeometry;
    import flash.geom.Point;

    public class RoomSpriteCanvas3d implements IRoomRenderingCanvas, IUpdateReceiver {

        public static const room_door_png:Class;
        public static const ROOM_TOP_LAYER_NAME:String;
        public static const ROOM_BOTTOM_LAYER_NAME:String;
        public static const ROOM_DOOR_LAYER_NAME:String;
        private static const THROTTLE_THRESHOLD_MS:int;

        private var _disposed:Boolean;
        private var _canvas:Sprite;
        private var _canvasTouchArea:Quad;
        private var _room:Sprite;
        private var _roomTop:Sprite;
        private var _roomBottom:QuadBatch;
        private var _roomTopImages:Dictionary;
        private var _roomBottomImages:Dictionary;
        private var _sortCounter:uint;
        private var _spriteFactory:RoomSpriteFactory;
        private var _pendingObjectRemovals:Boolean;
        private var _objectContainer3D:ObjectContainer3D;
        private var _originalMeshes:Dictionary;
        private var _mergedMeshes:Dictionary;
        private var _mergeBuffers:Dictionary;
        private var _camera3D:Camera3D;
        private var _container:IRoomSpriteCanvasContainer;
        private var _touchHandler:RoomTouchHandler;
        private var _debugTools:DebugTools;
        private var _canvasId:String;
        private var _wd:int;
        private var _ht:int;
        private var _wd2:int;
        private var _ht2:int;
        private var _geometry:RoomGeometry;
        private var _geometryUpdateId:uint;
        private var _roomObjectCache:RoomObjectCache;
        private var _forcedRenderRequested:Boolean;
        private var _isPaused:Boolean;
        private var _screenOffsetX:int;
        private var _screenOffsetY:int;
        private var _updateOffset:Boolean;
        private var _scale:Number;
        private var _updateScale:Boolean;
        private var _roomObject:IRoomObject;
        private var _roomEngine:IRoomEngine;
        private var _desktop:IRoomDesktopGPU;
        private var _minVisibleX:Number;
        private var _minVisibleY:Number;
        private var _maxVisibleX:Number;
        private var _maxVisibleY:Number;
        private var _doorLoc:IVector3d;
        private var _doorDir:Number;
        private var _showDoor:Boolean;
        private var _doorImage:Image;
        private var _doorContainer:Sprite;
        private var _idsPreventedFromQuadBatch:Array;
        private var _followTarget:IRoomObject;

        public function RoomSpriteCanvas3d(k:IRoomSpriteCanvasContainer, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:int);

        private static function onClickTweenComplete(k:Image):void;


        public function pause():void;

        public function resume():void;

        public function set roomEngine(k:IRoomEngine):void;

        public function set desktop(k:IRoomDesktopGPU):void;

        public function get roomEngine():IRoomEngine;

        public function get desktop():IRoomDesktopGPU;

        public function get roomObject():IRoomObject;

        public function get container():IRoomSpriteCanvasContainer;

        public function get canvas():Sprite;

        public function get roomBottom():QuadBatch;

        public function get roomTop():Sprite;

        public function get roomContainerGPU():Sprite;

        public function get roomBottomImages():Dictionary;

        public function get roomTopImages():Dictionary;

        public function get wd2():int;

        public function get ht2():int;

        public function get disposed():Boolean;

        public function dispose():void;

        public function set visible(k:Boolean):void;

        private function onObjectRemoved(k:RoomEngineObjectEvent):void;

        private function onTextureCompressed(k:Event):void;

        private function updateDirtyTextures():void;

        public function update(k:uint):void;

        public function render(k:int):void;

        private function updateCullingLimits():void;

        private function updateCulling(k:ISortableImage):void;

        private function resetMeshes():void;

        private function addMesh(k:IRoomObjectSprite):void;

        private function processMergeBuffer():void;

        private function updateCamera():void;

        private function resetDoor():void;

        public function get displayObject():DisplayObject;

        public function get displayObjectContainer():DisplayObjectContainer;

        public function get starlingDisplayObject():DisplayObject;

        public function get starlingDisplayObjectContainer():DisplayObjectContainer;

        public function get objectContainer3D():ObjectContainer3D;

        public function set useMask(k:Boolean):void;

        public function initialize(k:int, _arg_2:int):void;

        public function get width():int;

        public function get height():int;

        public function setScreenOffset(k:int, _arg_2:int):void;

        public function set screenOffsetX(k:int):void;

        public function set screenOffsetY(k:int):void;

        public function get screenOffsetX():int;

        public function get screenOffsetY():int;

        public function get geometry():IRoomGeometry;

        public function set mouseListener(k:IRoomRenderingCanvasMouseListener):void;

        public function handleMouseEvent(k:int, _arg_2:int, _arg_3:String, _arg_4:Boolean, _arg_5:Boolean, _arg_6:Boolean, _arg_7:Boolean):Boolean;

        public function set camera3D(k:Camera3D):void;

        public function get scale():Number;

        public function setScale(k:Number, _arg_2:Point=null, _arg_3:Point=null):void;

        public function center():void;

        private function follow():void;

        _namespace_2 function sortRoomBottom():void;

        public function setObjectActiveState(k:IRoomObject, _arg_2:Boolean):void;

        public function preventObjectFromQuadBatch(k:IRoomObject):void;

        public function allowObjectInQuadBatch(k:IRoomObject):void;

        public function toggleDebugTools():void;

        public function showClick(k:Point):void;

        public function setFollowTarget(k:IRoomObject):void;


    }
}//package com.sulake.room.renderer

// _namespace_2 = "shared_texture_gpu_debug"


