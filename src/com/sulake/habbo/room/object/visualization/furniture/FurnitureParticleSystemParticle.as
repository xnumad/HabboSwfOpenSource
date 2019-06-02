package com.sulake.habbo.room.object.visualization.furniture
{
    import flash.geom.Vector3D;
    import com.sulake.room.object.visualization.utils.IGraphicAsset;

    public class FurnitureParticleSystemParticle 
    {
        private var _x:Number;
        private var _y:Number;
        private var _z:Number;
        private var _lastX:Number;
        private var _lastY:Number;
        private var _lastZ:Number;
        private var _hasMoved:Boolean = false;
        private var _direction:Vector3D;
        private var _age:int = 0;
        private var _lifeTime:int;
        private var _isEmitter:Boolean = false;
        private var _fade:Boolean = false;
        private var _fadeTime:Number;
        private var _alphaMultiplier:Number = 1;
        private var _frames:Array;


        public function get fade():Boolean
        {
            return this._fade;
        }

        public function get alphaMultiplier():Number
        {
            return this._alphaMultiplier;
        }

        public function get direction():Vector3D
        {
            return this._direction;
        }

        public function get age():int
        {
            return this._age;
        }

        public function init(k:Number, _arg_2:Number, _arg_3:Number, _arg_4:Vector3D, _arg_5:Number, _arg_6:Number, _arg_7:int, _arg_8:Boolean=false, _arg_9:Array=null, _arg_10:Boolean=false):void
        {
            this._x = k;
            this._y = _arg_2;
            this._z = _arg_3;
            this._direction = new Vector3D(_arg_4.x, _arg_4.y, _arg_4.z);
            this._direction.scaleBy(_arg_5);
            this._lastX = (this._x - (this._direction.x * _arg_6));
            this._lastY = (this._y - (this._direction.y * _arg_6));
            this._lastZ = (this._z - (this._direction.z * _arg_6));
            this._age = 0;
            this._hasMoved = false;
            this._lifeTime = _arg_7;
            this._isEmitter = _arg_8;
            this._frames = _arg_9;
            this._fade = _arg_10;
            this._alphaMultiplier = 1;
            this._fadeTime = (0.5 + (Math.random() * 0.5));
        }

        public function update():void
        {
            this._age++;
            if (this._age == this._lifeTime)
            {
                this.ignite();
            }
            if (this._fade)
            {
                if ((this._age / this._lifeTime) > this._fadeTime)
                {
                    this._alphaMultiplier = ((this._lifeTime - this._age) / (this._lifeTime * (1 - this._fadeTime)));
                }
            }
        }

        public function getAsset():IGraphicAsset
        {
            if (((this._frames) && (this._frames.length > 0)))
            {
                return this._frames[(this._age % this._frames.length)];
            }
            return null;
        }

        protected function ignite():void
        {
        }

        public function get isEmitter():Boolean
        {
            return this._isEmitter;
        }

        public function get isAlive():Boolean
        {
            return this._age <= this._lifeTime;
        }

        public function dispose():void
        {
            this._direction = null;
        }

        public function get x():Number
        {
            return this._x;
        }

        public function get y():Number
        {
            return this._y;
        }

        public function get z():Number
        {
            return this._z;
        }

        public function set x(k:Number):void
        {
            this._x = k;
        }

        public function set y(k:Number):void
        {
            this._y = k;
        }

        public function set z(k:Number):void
        {
            this._z = k;
        }

        public function get _Str_10744():Number
        {
            return this._lastX;
        }

        public function set _Str_10744(k:Number):void
        {
            this._hasMoved = true;
            this._lastX = k;
        }

        public function get _Str_12459():Number
        {
            return this._lastY;
        }

        public function set _Str_12459(k:Number):void
        {
            this._hasMoved = true;
            this._lastY = k;
        }

        public function get _Str_11680():Number
        {
            return this._lastZ;
        }

        public function set _Str_11680(k:Number):void
        {
            this._hasMoved = true;
            this._lastZ = k;
        }

        public function get hasMoved():Boolean
        {
            return this._hasMoved;
        }

        public function toString():String
        {
            return [this._x, this._y, this._z].toString();
        }

        public function copy(k:FurnitureParticleSystemParticle, _arg_2:Number):void
        {
            this._x = (k._x * _arg_2);
            this._y = (k._y * _arg_2);
            this._z = (k._z * _arg_2);
            this._lastX = (k._lastX * _arg_2);
            this._lastY = (k._lastY * _arg_2);
            this._lastZ = (k._lastZ * _arg_2);
            this._hasMoved = k.hasMoved;
            this._direction = k._direction;
            this._age = k._age;
            this._lifeTime = k._lifeTime;
            this._isEmitter = k._isEmitter;
            this._fade = k._fade;
            this._fadeTime = k._fadeTime;
            this._alphaMultiplier = k._alphaMultiplier;
        }
    }
}
