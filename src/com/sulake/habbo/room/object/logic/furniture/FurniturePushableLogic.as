package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.habbo.room.messages.RoomObjectMoveUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.habbo.room.object.data.LegacyStuffData;

    public class FurniturePushableLogic extends FurnitureMultistateLogic 
    {
        private static const ANIMATION_NOT_MOVING:int = 0;
        private static const ANIMATION_MOVING:int = 1;
        private static const MAX_ANIMATION_COUNT:int = 10;

        private var _oldLocation:Vector3d = null;

        public function FurniturePushableLogic()
        {
            moveUpdateInterval = DEFAULT_UPDATE_INTERVAL;
            this._oldLocation = new Vector3d();
        }

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void
        {
            var _local_4:IVector3d;
            var _local_5:IVector3d;
            var _local_6:IVector3d;
            if (k == null)
            {
                return;
            }
            var _local_2:RoomObjectMoveUpdateMessage = (k as RoomObjectMoveUpdateMessage);
            if (((!(object == null)) && (_local_2 == null)))
            {
                if (k.loc != null)
                {
                    _local_4 = object.getLocation();
                    _local_5 = Vector3d.dif(k.loc, _local_4);
                    if (_local_5 != null)
                    {
                        if (((Math.abs(_local_5.x) < 2) && (Math.abs(_local_5.y) < 2)))
                        {
                            _local_6 = _local_4;
                            if (((Math.abs(_local_5.x) > 1) || (Math.abs(_local_5.y) > 1)))
                            {
                                _local_6 = Vector3d.sum(_local_4, Vector3d.product(_local_5, 0.5));
                            }
                            _local_2 = new RoomObjectMoveUpdateMessage(_local_6, k.loc, k.dir);
                            super.processUpdateMessage(_local_2);
                            return;
                        }
                    }
                }
            }
            if (((!(k.loc == null)) && (_local_2 == null)))
            {
                _local_2 = new RoomObjectMoveUpdateMessage(k.loc, k.loc, k.dir);
                super.processUpdateMessage(_local_2);
            }
            var _local_3:RoomObjectDataUpdateMessage = (k as RoomObjectDataUpdateMessage);
            if (_local_3 != null)
            {
                if (_local_3.state > 0)
                {
                    moveUpdateInterval = (DEFAULT_UPDATE_INTERVAL / this.getUpdateIntervalValue(_local_3.state));
                }
                else
                {
                    moveUpdateInterval = 1;
                }
                this._Str_9796(_local_3);
                return;
            }
            if (((_local_2) && (_local_2.isSlideUpdate)))
            {
                moveUpdateInterval = DEFAULT_UPDATE_INTERVAL;
            }
            super.processUpdateMessage(k);
        }

        protected function getUpdateIntervalValue(k:int):int
        {
            return k / MAX_ANIMATION_COUNT;
        }

        protected function getAnimationValue(k:int):int
        {
            return k % MAX_ANIMATION_COUNT;
        }

        private function _Str_9796(k:RoomObjectDataUpdateMessage):void
        {
            var _local_3:LegacyStuffData;
            var _local_2:int = this.getAnimationValue(k.state);
            if (_local_2 != k.state)
            {
                _local_3 = new LegacyStuffData();
                _local_3.setString(String(_local_2));
                k = new RoomObjectDataUpdateMessage(_local_2, _local_3, k._Str_2794);
            }
            super.processUpdateMessage(k);
        }

        override public function update(k:int):void
        {
            if (object != null)
            {
                this._oldLocation.assign(object.getLocation());
                super.update(k);
                if (Vector3d.dif(object.getLocation(), this._oldLocation).length == 0)
                {
                    if (object.getState(0) != ANIMATION_NOT_MOVING)
                    {
                        object.setState(ANIMATION_NOT_MOVING, 0);
                    }
                }
            }
        }
    }
}
