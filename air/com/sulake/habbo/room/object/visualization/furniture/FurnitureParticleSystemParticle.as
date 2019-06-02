//com.sulake.habbo.room.object.visualization.furniture.FurnitureParticleSystemParticle

package com.sulake.habbo.room.object.visualization.furniture{
    import flash.geom.Vector3D;
    import com.sulake.room.object.visualization.utils.IGraphicAsset;

    public class FurnitureParticleSystemParticle {

        private var _x:Number;
        private var _y:Number;
        private var _z:Number;
        private var _lastX:Number;
        private var _lastY:Number;
        private var _lastZ:Number;
        private var _hasMoved:Boolean;
        private var _direction:Vector3D;
        private var _age:int;
        private var _lifeTime:int;
        private var _isEmitter:Boolean;
        private var _fade:Boolean;
        private var _fadeTime:Number;
        private var _alphaMultiplier:Number;
        private var _frames:Array;

        public function FurnitureParticleSystemParticle();

        public function get fade():Boolean;

        public function get alphaMultiplier():Number;

        public function get direction():Vector3D;

        public function get age():int;

        public function init(k:Number, _arg_2:Number, _arg_3:Number, _arg_4:Vector3D, _arg_5:Number, _arg_6:Number, _arg_7:int, _arg_8:Boolean=false, _arg_9:Array=null, k0:Boolean=false):void;

        public function update():void;

        public function getAsset():IGraphicAsset;

        protected function ignite():void;

        public function get isEmitter():Boolean;

        public function get isAlive():Boolean;

        public function dispose():void;

        public function get x():Number;

        public function get y():Number;

        public function get z():Number;

        public function set x(k:Number):void;

        public function set y(k:Number):void;

        public function set z(k:Number):void;

        public function get lastX():Number;

        public function set lastX(k:Number):void;

        public function get lastY():Number;

        public function set lastY(k:Number):void;

        public function get lastZ():Number;

        public function set lastZ(k:Number):void;

        public function get hasMoved():Boolean;

        public function toString():String;

        public function copy(k:FurnitureParticleSystemParticle, _arg_2:Number):void;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

