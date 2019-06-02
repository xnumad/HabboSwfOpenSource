package com.sulake.habbo.room.utils
{
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.utils.IVector3d;

    public class RoomCamera 
    {
        private static const MOVE_SPEED_DENOMINATOR:Number = 12;

        private var _targetId:int = -1;
        private var _targetCategory:int = -2;
        private var _targetLoc:Vector3d = null;
        private var _moveDistance:Number = 0;
        private var _previousMoveSpeed:Number = 0;
        private var _maintainPreviousMoveSpeed:Boolean = false;
        private var _currentLoc:Vector3d = null;
        private var _targetObjectLoc:Vector3d;
        private var _limitedLocX:Boolean = false;
        private var _limitedLocY:Boolean = false;
        private var _centeredLocX:Boolean = false;
        private var _centeredLocY:Boolean = false;
        private var _screenWd:int = 0;
        private var _screenHt:int = 0;
        private var _scale:int = 0;
        private var _roomWd:int = 0;
        private var _roomHt:int = 0;
        private var _geometryUpdateId:int = -1;
        private var _scaleChanged:Boolean = false;
        private var _followDuration:int;

        public function RoomCamera()
        {
            this._targetObjectLoc = new Vector3d();
            super();
        }

        public function get location():IVector3d
        {
            return this._currentLoc;
        }

        public function get _Str_10760():int
        {
            return this._targetId;
        }

        public function get _Str_16562():int
        {
            return this._targetCategory;
        }

        public function get _Str_16185():IVector3d
        {
            return this._targetObjectLoc;
        }

        public function get _Str_10235():Boolean
        {
            return this._limitedLocX;
        }

        public function get _Str_10446():Boolean
        {
            return this._limitedLocY;
        }

        public function get _Str_8564():Boolean
        {
            return this._centeredLocX;
        }

        public function get _Str_8690():Boolean
        {
            return this._centeredLocY;
        }

        public function get _Str_7609():int
        {
            return this._screenWd;
        }

        public function get _Str_7902():int
        {
            return this._screenHt;
        }

        public function get scale():int
        {
            return this._scale;
        }

        public function get _Str_18975():int
        {
            return this._roomWd;
        }

        public function get _Str_15953():int
        {
            return this._roomHt;
        }

        public function get _Str_16377():int
        {
            return this._geometryUpdateId;
        }

        public function get isMoving():Boolean
        {
            if (((!(this._targetLoc == null)) && (!(this._currentLoc == null))))
            {
                return true;
            }
            return false;
        }

        public function set _Str_10760(k:int):void
        {
            this._targetId = k;
        }

        public function set _Str_16185(k:IVector3d):void
        {
            this._targetObjectLoc.assign(k);
        }

        public function set _Str_16562(k:int):void
        {
            this._targetCategory = k;
        }

        public function set _Str_10235(k:Boolean):void
        {
            this._limitedLocX = k;
        }

        public function set _Str_10446(k:Boolean):void
        {
            this._limitedLocY = k;
        }

        public function set _Str_8564(k:Boolean):void
        {
            this._centeredLocX = k;
        }

        public function set _Str_8690(k:Boolean):void
        {
            this._centeredLocY = k;
        }

        public function set _Str_7609(k:int):void
        {
            this._screenWd = k;
        }

        public function set _Str_7902(k:int):void
        {
            this._screenHt = k;
        }

        public function set scale(k:int):void
        {
            if (this._scale != k)
            {
                this._scale = k;
                this._scaleChanged = true;
            }
        }

        public function set _Str_18975(k:int):void
        {
            this._roomWd = k;
        }

        public function set _Str_15953(k:int):void
        {
            this._roomHt = k;
        }

        public function set _Str_16377(k:int):void
        {
            this._geometryUpdateId = k;
        }

        public function set target(k:IVector3d):void
        {
            var _local_2:Vector3d;
            if (this._targetLoc == null)
            {
                this._targetLoc = new Vector3d();
            }
            if ((((!(this._targetLoc.x == k.x)) || (!(this._targetLoc.y == k.y))) || (!(this._targetLoc.z == k.z))))
            {
                this._targetLoc.assign(k);
                _local_2 = Vector3d.dif(this._targetLoc, this._currentLoc);
                this._moveDistance = _local_2.length;
                this._maintainPreviousMoveSpeed = true;
            }
        }

        public function dispose():void
        {
            this._targetLoc = null;
            this._currentLoc = null;
        }

        public function initializeLocation(k:IVector3d):void
        {
            if (this._currentLoc != null)
            {
                return;
            }
            this._currentLoc = new Vector3d();
            this._currentLoc.assign(k);
        }

        public function resetLocation(k:IVector3d):void
        {
            if (this._currentLoc == null)
            {
                this._currentLoc = new Vector3d();
            }
            this._currentLoc.assign(k);
        }

        public function update(k:uint, _arg_2:Number):void
        {
            var _local_3:Vector3d;
            var _local_4:Number;
            var _local_5:Number;
            var _local_6:Number;
            var _local_7:Number;
            if ((((this._followDuration > 0) && (!(this._targetLoc == null))) && (!(this._currentLoc == null))))
            {
                if (this._scaleChanged)
                {
                    this._scaleChanged = false;
                    this._currentLoc = this._targetLoc;
                    this._targetLoc = null;
                    return;
                }
                _local_3 = Vector3d.dif(this._targetLoc, this._currentLoc);
                if (_local_3.length > this._moveDistance)
                {
                    this._moveDistance = _local_3.length;
                }
                if (_local_3.length <= _arg_2)
                {
                    this._currentLoc = this._targetLoc;
                    this._targetLoc = null;
                    this._previousMoveSpeed = 0;
                }
                else
                {
                    _local_4 = Math.sin(((Math.PI * _local_3.length) / this._moveDistance));
                    _local_5 = (_arg_2 * 0.5);
                    _local_6 = (this._moveDistance / MOVE_SPEED_DENOMINATOR);
                    _local_7 = (_local_5 + ((_local_6 - _local_5) * _local_4));
                    if (this._maintainPreviousMoveSpeed)
                    {
                        if (_local_7 < this._previousMoveSpeed)
                        {
                            _local_7 = this._previousMoveSpeed;
                            if (_local_7 > _local_3.length)
                            {
                                _local_7 = _local_3.length;
                            }
                        }
                        else
                        {
                            this._maintainPreviousMoveSpeed = false;
                        }
                    }
                    this._previousMoveSpeed = _local_7;
                    _local_3.div(_local_3.length);
                    _local_3.mul(_local_7);
                    this._currentLoc = Vector3d.sum(this._currentLoc, _local_3);
                }
            }
        }

        public function reset():void
        {
            this._geometryUpdateId = -1;
        }

        public function activateFollowing(k:int):void
        {
            this._followDuration = k;
        }
    }
}
