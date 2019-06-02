package com.sulake.habbo.room.object.visualization.furniture
{
    import flash.geom.Vector3D;
    import flash.utils.Dictionary;

    public class FurnitureParticleSystemEmitter extends FurnitureParticleSystemParticle 
    {
        public static const CONE:String = "cone";
        public static const PLANE:String = "plane";
        public static const SPHERE:String = "sphere";

        private var _name:String;
        private var _roomObjectSpriteId:int = -1;
        private var _force:Number;
        private var _direction:Vector3D;
        private var _timeStep:Number = 0.1;
        private var _gravity:Number;
        private var _airFriction:Number;
        private var _explosionShape:String;
        private var _particleConfigurations:Array;
        private var _particles:Array;
        private var _maxNumberOfParticles:int;
        private var _particlesPerFrame:int;
        private var _emittedParticles:int;
        private var _fuseTime:int = 10;
        private var _energy:Number = 1;
        private var _hasIgnited:Boolean = false;
        private var _burstPulse:int = 1;

        public function FurnitureParticleSystemEmitter(k:String="", _arg_2:int=-1)
        {
            this._particles = [];
            super();
            this._name = k;
            this._roomObjectSpriteId = _arg_2;
            this._particleConfigurations = [];
        }

        override public function dispose():void
        {
            var k:FurnitureParticleSystemParticle;
            for each (k in this._particles)
            {
                k.dispose();
            }
            this._particles = null;
            this._direction = null;
            this._particleConfigurations = null;
            super.dispose();
        }

        public function setup(k:int, _arg_2:int, _arg_3:Number, _arg_4:Vector3D, _arg_5:Number, _arg_6:Number, _arg_7:String, _arg_8:Number, _arg_9:int, _arg_10:int):void
        {
            this._maxNumberOfParticles = k;
            this._particlesPerFrame = _arg_2;
            this._force = _arg_3;
            this._direction = _arg_4;
            this._direction.normalize();
            this._gravity = _arg_5;
            this._airFriction = _arg_6;
            this._explosionShape = _arg_7;
            this._fuseTime = _arg_9;
            this._energy = _arg_8;
            this._burstPulse = _arg_10;
            this.reset();
        }

        public function reset():void
        {
            var k:FurnitureParticleSystemParticle;
            for each (k in this._particles)
            {
                k.dispose();
            }
            this._particles = [];
            this._emittedParticles = 0;
            this._hasIgnited = false;
            this.init(0, 0, 0, this._direction, this._force, this._timeStep, this._fuseTime, true);
        }

        public function _Str_17988(k:FurnitureParticleSystemEmitter, _arg_2:Number):void
        {
            super.copy(k, _arg_2);
            this._force = k._force;
            this._direction = k._direction;
            this._gravity = k._gravity;
            this._airFriction = k._airFriction;
            this._explosionShape = k._explosionShape;
            this._fuseTime = k._fuseTime;
            this._energy = k._energy;
            this._burstPulse = k._burstPulse;
            this._timeStep = k._timeStep;
            this._hasIgnited = k._hasIgnited;
        }

        public function configureParticle(k:int, _arg_2:Boolean, _arg_3:Array, _arg_4:Boolean):void
        {
            var _local_5:Dictionary = new Dictionary();
            _local_5["lifeTime"] = k;
            _local_5["isEmitter"] = _arg_2;
            _local_5["frames"] = _arg_3;
            _local_5["fade"] = _arg_4;
            this._particleConfigurations.push(_local_5);
        }

        override protected function ignite():void
        {
            this._hasIgnited = true;
            if ((this._emittedParticles < this._maxNumberOfParticles))
            {
                if (this.age > 1)
                {
                    this.releaseParticles(this, this.direction);
                }
            }
        }

        private function releaseParticles(k:FurnitureParticleSystemParticle, _arg_2:Vector3D=null):void
        {
            var _local_4:FurnitureParticleSystemParticle;
            var _local_5:Dictionary;
            var _local_6:int;
            var _local_9:Array;
            if (!_arg_2)
            {
                _arg_2 = new Vector3D();
            }
            var _local_3:Vector3D = new Vector3D();
            var _local_7:Boolean;
            var _local_8:Boolean;
            _local_5 = this.getRandomParticleConfiguration();
            var _local_10:int;
            while (_local_10 < this._particlesPerFrame)
            {
                switch (this._explosionShape)
                {
                    case CONE:
                        _local_3.x = ((this.randomBoolean(0.5)) ? Math.random() : -(Math.random()));
                        _local_3.y = -(Math.random() + 1);
                        _local_3.z = ((this.randomBoolean(0.5)) ? Math.random() : -(Math.random()));
                        break;
                    case PLANE:
                        _local_3.x = ((this.randomBoolean(0.5)) ? Math.random() : -(Math.random()));
                        _local_3.y = 0;
                        _local_3.z = ((this.randomBoolean(0.5)) ? Math.random() : -(Math.random()));
                        break;
                    case SPHERE:
                        _local_3.x = ((this.randomBoolean(0.5)) ? Math.random() : -(Math.random()));
                        _local_3.y = ((this.randomBoolean(0.5)) ? Math.random() : -(Math.random()));
                        _local_3.z = ((this.randomBoolean(0.5)) ? Math.random() : -(Math.random()));
                        break;
                }
                _local_3.normalize();
                _local_4 = new FurnitureParticleSystemParticle();
                if (_local_5)
                {
                    _local_6 = Math.floor(((Math.random() * _local_5["lifeTime"]) + 10));
                    _local_7 = _local_5["isEmitter"];
                    _local_9 = _local_5["frames"];
                    _local_8 = _local_5["fade"];
                }
                else
                {
                    _local_6 = int(Math.floor(((Math.random() * 20) + 10)));
                    _local_7 = false;
                    _local_9 = [];
                }
                _local_4.init(k.x, k.y, k.z, _local_3, this._energy, this._timeStep, _local_6, _local_7, _local_9, _local_8);
                this._particles.push(_local_4);
                this._emittedParticles++;
                _local_10++;
            }
        }

        private function getRandomParticleConfiguration():Dictionary
        {
            var k:int = int(Math.floor((Math.random() * this._particleConfigurations.length)));
            return this._particleConfigurations[k];
        }

        override public function update():void
        {
            super.update();
            this.accumulateForces();
            this.verlet();
            this.satisfyConstraints();
            if (((!(isAlive)) && (this._emittedParticles < this._maxNumberOfParticles)))
            {
                if ((this.age % this._burstPulse) == 0)
                {
                    this.releaseParticles(this, this.direction);
                }
            }
        }

        public function verlet():void
        {
            var _local_2:FurnitureParticleSystemParticle;
            var _local_3:Number;
            var _local_4:Number;
            var _local_5:Number;
            if (((isAlive) || (this._emittedParticles < this._maxNumberOfParticles)))
            {
                _local_3 = this.x;
                _local_4 = this.y;
                _local_5 = this.z;
                this.x = (((2 - this._airFriction) * this.x) - ((1 - this._airFriction) * this._Str_10744));
                this.y = ((((2 - this._airFriction) * this.y) - ((1 - this._airFriction) * this._Str_12459)) + ((this._gravity * this._timeStep) * this._timeStep));
                this.z = (((2 - this._airFriction) * this.z) - ((1 - this._airFriction) * this._Str_11680));
                this._Str_10744 = _local_3;
                this._Str_12459 = _local_4;
                this._Str_11680 = _local_5;
            }
            var k:Array = [];
            for each (_local_2 in this._particles)
            {
                _local_2.update();
                _local_3 = _local_2.x;
                _local_4 = _local_2.y;
                _local_5 = _local_2.z;
                _local_2.x = (((2 - this._airFriction) * _local_2.x) - ((1 - this._airFriction) * _local_2._Str_10744));
                _local_2.y = ((((2 - this._airFriction) * _local_2.y) - ((1 - this._airFriction) * _local_2._Str_12459)) + ((this._gravity * this._timeStep) * this._timeStep));
                _local_2.z = (((2 - this._airFriction) * _local_2.z) - ((1 - this._airFriction) * _local_2._Str_11680));
                _local_2._Str_10744 = _local_3;
                _local_2._Str_12459 = _local_4;
                _local_2._Str_11680 = _local_5;
                if (((_local_2.y > 10) || (!(_local_2.isAlive))))
                {
                    k.push(_local_2);
                }
            }
            for each (_local_2 in k)
            {
                if (_local_2.isEmitter)
                {
                }
                this._particles.splice(this._particles.indexOf(_local_2), 1);
                _local_2.dispose();
            }
        }

        private function satisfyConstraints():void
        {
        }

        private function accumulateForces():void
        {
            var k:FurnitureParticleSystemParticle;
            for each (k in this._particles)
            {
            }
        }

        public function get particles():Array
        {
            return this._particles;
        }

        public function get hasIgnited():Boolean
        {
            return this._hasIgnited;
        }

        private function randomBoolean(k:Number):Boolean
        {
            return Math.random() < k;
        }

        public function get roomObjectSpriteId():int
        {
            return this._roomObjectSpriteId;
        }
    }
}
