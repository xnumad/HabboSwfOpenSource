package com.sulake.habbo.communication.messages.incoming.room.engine
{
    public class _Str_3548 
    {
        public static const M:String = "M";
        public static const F:String = "F";

        private var _Str_2775:int = 0;
        private var _x:Number = 0;
        private var _y:Number = 0;
        private var _z:Number = 0;
        private var _dir:int = 0;
        private var _name:String = "";
        private var _Str_3021:int = 0;
        private var _Str_4037:String = "";
        private var _figure:String = "";
        private var _custom:String = "";
        private var _activityPoints:int;
        private var _Str_4900:int = 0;
        private var _Str_11874:String = "";
        private var _Str_11729:int = 0;
        private var _groupName:String = "";
        private var _Str_4653:String = "";
        private var _Str_2592:int = 0;
        private var _ownerName:String;
        private var _rarityLevel:int;
        private var _Str_6842:Boolean;
        private var _Str_3253:Boolean;
        private var _Str_3101:Boolean;
        private var _Str_3297:Boolean;
        private var _Str_3284:Boolean;
        private var _Str_3095:Boolean;
        private var _Str_12413:int = 0;
        private var _Str_20254:String = "";
        private var _Str_3986:Array;
        private var _Str_9831:Boolean;
        private var _Str_2479:Boolean = false;

        public function _Str_3548(k:int)
        {
            this._Str_2775 = k;
        }

        public function _Str_4710():void
        {
            this._Str_2479 = true;
        }

        public function get roomIndex():int
        {
            return this._Str_2775;
        }

        public function get x():Number
        {
            return this._x;
        }

        public function set x(k:Number):void
        {
            if (!this._Str_2479)
            {
                this._x = k;
            }
        }

        public function get y():Number
        {
            return this._y;
        }

        public function set y(k:Number):void
        {
            if (!this._Str_2479)
            {
                this._y = k;
            }
        }

        public function get z():Number
        {
            return this._z;
        }

        public function set z(k:Number):void
        {
            if (!this._Str_2479)
            {
                this._z = k;
            }
        }

        public function get dir():int
        {
            return this._dir;
        }

        public function set dir(k:int):void
        {
            if (!this._Str_2479)
            {
                this._dir = k;
            }
        }

        public function get name():String
        {
            return this._name;
        }

        public function set name(k:String):void
        {
            if (!this._Str_2479)
            {
                this._name = k;
            }
        }

        public function get _Str_2908():int
        {
            return this._Str_3021;
        }

        public function set _Str_2908(k:int):void
        {
            if (!this._Str_2479)
            {
                this._Str_3021 = k;
            }
        }

        public function get _Str_3344():String
        {
            return this._Str_4037;
        }

        public function set _Str_3344(k:String):void
        {
            if (!this._Str_2479)
            {
                this._Str_4037 = k;
            }
        }

        public function get figure():String
        {
            return this._figure;
        }

        public function set figure(k:String):void
        {
            if (!this._Str_2479)
            {
                this._figure = k;
            }
        }

        public function get custom():String
        {
            return this._custom;
        }

        public function set custom(k:String):void
        {
            if (!this._Str_2479)
            {
                this._custom = k;
            }
        }

        public function get activityPoints():int
        {
            return this._activityPoints;
        }

        public function set activityPoints(k:int):void
        {
            if (!this._Str_2479)
            {
                this._activityPoints = k;
            }
        }

        public function get _Str_2394():int
        {
            return this._Str_4900;
        }

        public function set _Str_2394(k:int):void
        {
            if (!this._Str_2479)
            {
                this._Str_4900 = k;
            }
        }

        public function get _Str_4592():String
        {
            return this._Str_11874;
        }

        public function set _Str_4592(k:String):void
        {
            if (!this._Str_2479)
            {
                this._Str_11874 = k;
            }
        }

        public function get groupName():String
        {
            return this._groupName;
        }

        public function set groupName(k:String):void
        {
            if (!this._Str_2479)
            {
                this._groupName = k;
            }
        }

        public function get _Str_7043():int
        {
            return this._Str_11729;
        }

        public function set _Str_7043(k:int):void
        {
            if (!this._Str_2479)
            {
                this._Str_11729 = k;
            }
        }

        public function get _Str_3882():String
        {
            return this._Str_4653;
        }

        public function set _Str_3882(k:String):void
        {
            if (!this._Str_2479)
            {
                this._Str_4653 = k;
            }
        }

        public function get ownerId():int
        {
            return this._Str_2592;
        }

        public function set ownerId(k:int):void
        {
            if (!this._Str_2479)
            {
                this._Str_2592 = k;
            }
        }

        public function get ownerName():String
        {
            return this._ownerName;
        }

        public function set ownerName(k:String):void
        {
            if (!this._Str_2479)
            {
                this._ownerName = k;
            }
        }

        public function get rarityLevel():int
        {
            return this._rarityLevel;
        }

        public function set rarityLevel(k:int):void
        {
            if (!this._Str_2479)
            {
                this._rarityLevel = k;
            }
        }

        public function get _Str_4799():Boolean
        {
            return this._Str_6842;
        }

        public function set _Str_4799(k:Boolean):void
        {
            if (!this._Str_2479)
            {
                this._Str_6842 = k;
            }
        }

        public function get isRiding():Boolean
        {
            return this._Str_3253;
        }

        public function set isRiding(k:Boolean):void
        {
            if (!this._Str_2479)
            {
                this._Str_3253 = k;
            }
        }

        public function get canBreed():Boolean
        {
            return this._Str_3101;
        }

        public function set canBreed(k:Boolean):void
        {
            if (!this._Str_2479)
            {
                this._Str_3101 = k;
            }
        }

        public function get canHarvest():Boolean
        {
            return this._Str_3297;
        }

        public function set canHarvest(k:Boolean):void
        {
            if (!this._Str_2479)
            {
                this._Str_3297 = k;
            }
        }

        public function get canRevive():Boolean
        {
            return this._Str_3284;
        }

        public function set canRevive(k:Boolean):void
        {
            if (!this._Str_2479)
            {
                this._Str_3284 = k;
            }
        }

        public function get hasBreedingPermission():Boolean
        {
            return this._Str_3095;
        }

        public function set hasBreedingPermission(k:Boolean):void
        {
            if (!this._Str_2479)
            {
                this._Str_3095 = k;
            }
        }

        public function get _Str_3897():int
        {
            return this._Str_12413;
        }

        public function set _Str_3897(k:int):void
        {
            if (!this._Str_2479)
            {
                this._Str_12413 = k;
            }
        }

        public function get _Str_16593():String
        {
            return this._Str_20254;
        }

        public function set _Str_16593(k:String):void
        {
            if (!this._Str_2479)
            {
                this._Str_20254 = k;
            }
        }

        public function get _Str_2899():Array
        {
            return this._Str_3986;
        }

        public function set _Str_2899(k:Array):void
        {
            this._Str_3986 = k;
        }

        public function get _Str_3853():Boolean
        {
            return this._Str_9831;
        }

        public function set _Str_3853(k:Boolean):void
        {
            if (!this._Str_2479)
            {
                this._Str_9831 = k;
            }
        }
    }
}
