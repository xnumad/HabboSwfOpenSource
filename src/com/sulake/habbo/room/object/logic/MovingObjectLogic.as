package com.sulake.habbo.room.object.logic
{
    import com.sulake.room.object.logic.ObjectLogicBase;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.object.IRoomObjectController;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.habbo.room.messages.RoomObjectMoveUpdateMessage;
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.room.object.IRoomObjectModelController;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;

    public class MovingObjectLogic extends ObjectLogicBase 
    {
        public static const DEFAULT_UPDATE_INTERVAL:int = 500;
        private static var helper_vector:Vector3d = new Vector3d();

        private var _locDelta:Vector3d;
        private var _loc:Vector3d;
        private var _liftAmount:Number = 0;
        private var _lastUpdateTime:int = 0;
        private var _changeTime:int;
        private var _updateInterval:int = 500;

        public function MovingObjectLogic()
        {
            this._locDelta = new Vector3d();
            this._loc = new Vector3d();
            super();
        }

        protected function get lastUpdateTime():int
        {
            return this._lastUpdateTime;
        }

        override public function dispose():void
        {
            super.dispose();
            this._loc = null;
            this._locDelta = null;
        }

        override public function set object(k:IRoomObjectController):void
        {
            super.object = k;
            if (k != null)
            {
                this._loc.assign(k.getLocation());
            }
        }

        protected function set moveUpdateInterval(k:int):void
        {
            if (k <= 0)
            {
                k = 1;
            }
            this._updateInterval = k;
        }

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void
        {
            var _local_3:IVector3d;
            if (k == null)
            {
                return;
            }
            super.processUpdateMessage(k);
            if (k.loc != null)
            {
                this._loc.assign(k.loc);
            }
            var _local_2:RoomObjectMoveUpdateMessage = (k as RoomObjectMoveUpdateMessage);
            if (_local_2 == null)
            {
                return;
            }
            if (object != null)
            {
                if (k.loc != null)
                {
                    _local_3 = _local_2._Str_7569;
                    this._changeTime = this._lastUpdateTime;
                    this._locDelta.assign(_local_3);
                    this._locDelta.sub(this._loc);
                }
            }
        }

        protected function getLocationOffset():IVector3d
        {
            return null;
        }

        override public function update(k:int):void
        {
            var _local_4:int;
            var _local_2:IVector3d = this.getLocationOffset();
            var _local_3:IRoomObjectModelController = object.getModelController();
            if (_local_3 != null)
            {
                if (_local_2 != null)
                {
                    if (this._liftAmount != _local_2.z)
                    {
                        this._liftAmount = _local_2.z;
                        _local_3.setNumber(RoomObjectVariableEnum.FURNITURE_LIFT_AMOUNT, this._liftAmount);
                    }
                }
                else
                {
                    if (this._liftAmount != 0)
                    {
                        this._liftAmount = 0;
                        _local_3.setNumber(RoomObjectVariableEnum.FURNITURE_LIFT_AMOUNT, this._liftAmount);
                    }
                }
            }
            if (((this._locDelta.length > 0) || (!(_local_2 == null))))
            {
                _local_4 = (k - this._changeTime);
                if (_local_4 == (this._updateInterval >> 1))
                {
                    _local_4++;
                }
                if (_local_4 > this._updateInterval)
                {
                    _local_4 = this._updateInterval;
                }
                if (this._locDelta.length > 0)
                {
                    helper_vector.assign(this._locDelta);
                    helper_vector.mul((_local_4 / Number(this._updateInterval)));
                    helper_vector.add(this._loc);
                }
                else
                {
                    helper_vector.assign(this._loc);
                }
                if (_local_2 != null)
                {
                    helper_vector.add(_local_2);
                }
                if (object != null)
                {
                    object.setLocation(helper_vector);
                }
                if (_local_4 == this._updateInterval)
                {
                    this._locDelta.x = 0;
                    this._locDelta.y = 0;
                    this._locDelta.z = 0;
                }
            }
            this._lastUpdateTime = k;
        }
    }
}
