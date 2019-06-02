//com.sulake.room.renderer.ScaleTween

package com.sulake.room.renderer{
    import flash.geom.Point;
    import starling.animation.Tween;

    public class ScaleTween {

        private var _canvas:RoomSpriteCanvas3d;
        private var _pivot:Point;
        private var _loc:Point;
        private var _tween:Tween;

        public function ScaleTween(k:RoomSpriteCanvas3d, _arg_2:Point, _arg_3:Point, _arg_4:Number);

        public function get scale():Number;

        public function set scale(k:Number):void;

        public function dispose():void;


    }
}//package com.sulake.room.renderer

