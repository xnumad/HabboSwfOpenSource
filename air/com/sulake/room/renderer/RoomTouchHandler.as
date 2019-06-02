//com.sulake.room.renderer.RoomTouchHandler

package com.sulake.room.renderer{
    import starling.display.Sprite;
    import starling.display.QuadBatch;
    import starling.display.Quad;
    import flash.utils.Dictionary;
    import flash.geom.Point;
    import com.sulake.habbo.room.IRoomEngine;
    import org.gestouch.gestures.TapGesture;
    import org.gestouch.gestures.ZoomGesture;
    import org.gestouch.gestures.PanGesture;
    import org.gestouch.gestures.LongPressGesture;
    import com.sulake.room.object.image.ISortableImage;
    import flash.events.Event;
    import org.gestouch.events.GestureEvent;
    import starling.events.TouchEvent;
    import __AS3__.vec.Vector;
    import com.sulake.room.object.IRoomObject;

    public class RoomTouchHandler {

        private static const LONG_PRESS_TIME_MS:int;
        private static const DOUBLE_TAP_DELAY:int;
        private static const SINGLE_TAP_SAME_LOC_THRESHOLD:int;

        private var _canvas:RoomSpriteCanvas3d;
        private var _room:Sprite;
        private var _roomBottom:QuadBatch;
        private var _roomTop:Sprite;
        private var _doorContainer:Sprite;
        private var _touchArea:Quad;
        private var _batchedImages:Dictionary;
        private var _panBeginLoc:Point;
        private var _touchBeginCanvasOffset:Point;
        private var _lastTapLoc:Point;
        private var _isZooming:Boolean;
        private var _zoomPivot:Point;
        private var _zoomGestureLoc:Point;
        private var _zoomDir:Number;
        private var _lastRoomLocClick:Point;
        private var _scaleTween:ScaleTween;
        private var _roomEngine:IRoomEngine;
        private var _singleTapGesture:TapGesture;
        private var _doubleTapGesture:TapGesture;
        private var _zoomGesture:ZoomGesture;
        private var _panGesture:PanGesture;
        private var _longPressGesture:LongPressGesture;

        public function RoomTouchHandler(k:RoomSpriteCanvas3d, _arg_2:Sprite, _arg_3:Quad, _arg_4:Dictionary);

        private static function pixelHitTest(k:Point, _arg_2:ISortableImage):Boolean;


        public function dispose():void;

        private function registerSingleTap(k:Boolean):void;

        public function set roomEngine(k:IRoomEngine):void;

        private function onWalkingPrioritized(k:Event):void;

        private function onPickingPrioritized(k:Event):void;

        private function onZoomGestureBegan(k:GestureEvent):void;

        private function onZoomGestureEnded(k:GestureEvent):void;

        private function onZoomGestureChanged(k:GestureEvent):void;

        private function onPanBegan(k:GestureEvent):void;

        private function onPanChanged(k:GestureEvent):void;

        private function onPanEnded(k:GestureEvent):void;

        private function onSingleTapRecognized(k:GestureEvent):void;

        private function onDoubleTapRecognized(k:GestureEvent):void;

        private function tryPickObjects(k:Point):void;

        private function tryWalkTo(k:Point):void;

        private function onWalkingTo(k:Event):void;

        private function onLongPressBegan(k:GestureEvent):void;

        private function onRoomTouch(k:TouchEvent):void;

        private function pickObjectsUnderLoc(k:Point):Vector.<IRoomObject>;

        private function handleObjectUnderLoc(k:Point):Boolean;

        private function handleSortableImage(k:ISortableImage, _arg_2:Point, _arg_3:Array):Boolean;

        public function isPanning():Boolean;

        public function isZooming():Boolean;


    }
}//package com.sulake.room.renderer

