//com.sulake.habbo.room.object.visualization.furniture.FurnitureParticleSystemEmitter

package com.sulake.habbo.room.object.visualization.furniture{
    import flash.geom.Vector3D;
    import flash.utils.Dictionary;

    public class FurnitureParticleSystemEmitter extends FurnitureParticleSystemParticle {

        public static const SHAPE_CONE:String;
        public static const SHAPE_PLANE:String;
        public static const SHAPE_SPHERE:String;

        private var _name:String;
        private var _roomObjectSpriteId:int;
        private var _force:Number;
        private var _direction:Vector3D;
        private var _timeStep:Number;
        private var _gravity:Number;
        private var _airFriction:Number;
        private var _explosionShape:String;
        private var _particleConfigurations:Array;
        private var _particles:Array;
        private var _maxNumberOfParticles:int;
        private var _particlesPerFrame:int;
        private var _emittedParticles:int;
        private var _fuseTime:int;
        private var _energy:Number;
        private var _hasIgnited:Boolean;
        private var _burstPulse:int;

        public function FurnitureParticleSystemEmitter(k:String="", _arg_2:int=-1);

        override public function dispose():void;

        public function setup(k:int, _arg_2:int, _arg_3:Number, _arg_4:Vector3D, _arg_5:Number, _arg_6:Number, _arg_7:String, _arg_8:Number, _arg_9:int, k0:int):void;

        public function reset():void;

        public function copyStateFrom(k:FurnitureParticleSystemEmitter, _arg_2:Number):void;

        public function configureParticle(k:int, _arg_2:Boolean, _arg_3:Array, _arg_4:Boolean):void;

        override protected function ignite():void;

        private function releaseParticles(k:FurnitureParticleSystemParticle, _arg_2:Vector3D=null):void;

        private function getRandomParticleConfiguration():Dictionary;

        override public function update():void;

        public function verlet():void;

        private function satisfyConstraints():void;

        private function accumulateForces():void;

        public function get particles():Array;

        public function get hasIgnited():Boolean;

        private function randomBoolean(k:Number):Boolean;

        public function get roomObjectSpriteId():int;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

