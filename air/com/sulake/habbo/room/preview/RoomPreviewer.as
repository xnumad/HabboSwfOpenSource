//com.sulake.habbo.room.preview.RoomPreviewer

package com.sulake.habbo.room.preview{
    import com.sulake.habbo.room.IRoomEngine;
    import flash.geom.Rectangle;
    import flash.geom.Point;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.habbo.room.IStuffData;
    import flash.display.DisplayObject;
    import com.sulake.habbo.room.events.RoomEngineEvent;
    import com.sulake.habbo.room.events.RoomEngineObjectEvent;
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.room.ImageResult;
    import flash.display.BitmapData;

    public class RoomPreviewer {

        private static const PREVIEW_CANVAS_ID:int;
        private static const PREVIEW_OBJECT_ID:int;
        private static const PREVIEW_OBJECT_LOCATION_X:int;
        private static const PREVIEW_OBJECT_LOCATION_Y:int;
        private static const ALLOWED_IMAGE_CUT:Number;
        public static const SCALE_NORMAL:int;
        public static const SCALE_SMALL:int;
        private static const AUTOMATIC_STATE_CHANGE_INTERVAL:int;

        private var _roomEngine:IRoomEngine;
        private var _previewRoomId:int;
        private var _currentPreviewObjectType:int;
        private var _currentPreviewObjectCategory:int;
        private var _currentPreviewObjectData:String;
        private var _currentPreviewRectangle:Rectangle;
        private var _currentPreviewCanvasWidth:int;
        private var _currentPreviewCanvasHeight:int;
        private var _currentPreviewScale:int;
        private var _currentPreviewNeedsZoomOut:Boolean;
        private var _automaticStateChange:Boolean;
        private var _previousAutomaticStateChangeTime:int;
        private var _addViewOffset:Point;
        private var _disableUpdate:Boolean;

        public function RoomPreviewer(k:IRoomEngine, _arg_2:int=1);

        public function dispose():void;

        private function createRoomForPreviews():void;

        public function reset(k:Boolean):void;

        public function addFurnitureIntoRoom(k:int, _arg_2:IVector3d, _arg_3:IStuffData=null, _arg_4:String=null):int;

        public function addWallItemIntoRoom(k:int, _arg_2:IVector3d, _arg_3:String):int;

        public function addAvatarIntoRoom(k:String, _arg_2:int):int;

        public function updateUserPosture(k:String, _arg_2:String=""):void;

        public function updateUserGesture(k:int):void;

        public function updateUserEffect(k:int):void;

        public function updateObjectUserFigure(k:String, _arg_2:String=null, _arg_3:String=null, _arg_4:Boolean=false):Boolean;

        public function updateObjectUserAction(k:String, _arg_2:int, _arg_3:String=null):void;

        public function changeRoomObjectState():void;

        private function checkAutomaticRoomObjectStateChange():void;

        public function getRoomCanvas(k:int, _arg_2:int):DisplayObject;

        public function modifyRoomCanvas(k:int, _arg_2:int):void;

        public function set addViewOffset(k:Point):void;

        public function get addViewOffset():Point;

        private function updatePreviewObjectBoundingRectangle(k:Point):void;

        private function validatePreviewSize(k:Point):Point;

        public function zoomIn():void;

        public function zoomOut():void;

        public function updateAvatarDirection(k:int, _arg_2:int):void;

        public function updateObjectRoom(k:String=null, _arg_2:String=null, _arg_3:String=null, _arg_4:Boolean=false):Boolean;

        public function updateRoomWallsAndFloorVisibility(k:Boolean, _arg_2:Boolean=true):void;

        private function getCanvasOffset(k:Point):Point;

        public function updatePreviewRoomView(k:Boolean=false):void;

        public function set disableUpdate(k:Boolean):void;

        public function set disableRoomEngineUpdate(k:Boolean):void;

        private function onRoomInitialized(k:RoomEngineEvent):void;

        private function onRoomObjectAdded(k:RoomEngineObjectEvent):void;

        public function updateRoomEngine():void;

        public function getGenericRoomObjectImage(k:String, _arg_2:String, _arg_3:IVector3d, _arg_4:int, _arg_5:IGetImageListener, _arg_6:uint=0, _arg_7:String=null, _arg_8:IStuffData=null, _arg_9:int=-1, k0:int=-1, k1:String=null):ImageResult;

        public function getRoomObjectImage(k:int, _arg_2:IVector3d, _arg_3:int, _arg_4:IGetImageListener, _arg_5:uint=0):ImageResult;

        public function getRoomObjectCurrentImage():BitmapData;

        public function get isRoomEngineReady():Boolean;


    }
}//package com.sulake.habbo.room.preview

