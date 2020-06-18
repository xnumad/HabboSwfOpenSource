package com.sulake.habbo.communication.messages.outgoing.room.engine
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;

    public class PlaceObjectMessageComposer implements IMessageComposer
    {
        private var _objectId:int;
        private var _objectCategory:int;
        private var _wallLocation:String;
        private var _x:int = 0;
        private var _y:int = 0;
        private var _dir:int = 0;

        public function PlaceObjectMessageComposer(k:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:int, _arg_6:int)
        {
            this._objectId = k;
            this._objectCategory = _arg_2;
            this._wallLocation = _arg_3;
            this._x = _arg_4;
            this._y = _arg_5;
            this._dir = _arg_6;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            switch (this._objectCategory)
            {
                case RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE:
                    return [((((((this._objectId + " ") + this._x) + " ") + this._y) + " ") + this._dir)];
                case RoomObjectCategoryEnum.OBJECT_CATEGORY_WALLITEM:
                    return [((this._objectId + " ") + this._wallLocation)];
                default:
                    return [];
            }
        }
    }
}
