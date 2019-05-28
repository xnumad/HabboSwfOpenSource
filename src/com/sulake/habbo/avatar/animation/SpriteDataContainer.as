package com.sulake.habbo.avatar.animation
{
    public class SpriteDataContainer implements ISpriteDataContainer 
    {
        private var _animation:IAnimation;
        private var _id:String;
        private var _ink:int;
        private var _member:String;
        private var _hasDirections:Boolean;
        private var _hasStaticY:Boolean;
        private var _dx:Array;
        private var _dy:Array;
        private var _dz:Array;

        public function SpriteDataContainer(k:IAnimation, _arg_2:XML)
        {
            var _local_3:XML;
            var _local_4:int;
            super();
            this._animation = k;
            this._id = String(_arg_2.@id);
            this._ink = parseInt(_arg_2.@ink);
            this._member = String(_arg_2.@member);
            this._hasStaticY = Boolean(parseInt(_arg_2.@staticY));
            this._hasDirections = Boolean(parseInt(_arg_2.@directions));
            this._dx = [];
            this._dy = [];
            this._dz = [];
            for each (_local_3 in _arg_2.direction)
            {
                _local_4 = parseInt(_local_3.@id);
                this._dx[_local_4] = parseInt(_local_3.@dx);
                this._dy[_local_4] = parseInt(_local_3.@dy);
                this._dz[_local_4] = parseInt(_local_3.@dz);
            }
        }

        public function getDirectionOffsetX(k:int):int
        {
            if (k < this._dx.length)
            {
                return this._dx[k];
            }
            return 0;
        }

        public function getDirectionOffsetY(k:int):int
        {
            if (k < this._dy.length)
            {
                return this._dy[k];
            }
            return 0;
        }

        public function getDirectionOffsetZ(k:int):int
        {
            if (k < this._dz.length)
            {
                return this._dz[k];
            }
            return 0;
        }

        public function get animation():IAnimation
        {
            return this._animation;
        }

        public function get id():String
        {
            return this._id;
        }

        public function get ink():int
        {
            return this._ink;
        }

        public function get member():String
        {
            return this._member;
        }

        public function get hasDirections():Boolean
        {
            return this._hasDirections;
        }

        public function get hasStaticY():Boolean
        {
            return this._hasStaticY;
        }
    }
}
