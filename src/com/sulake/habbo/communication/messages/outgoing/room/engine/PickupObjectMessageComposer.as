package com.sulake.habbo.communication.messages.outgoing.room.engine
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;

    public class PickupObjectMessageComposer implements IMessageComposer
    {
        private var _objectId:int;
        private var _objectCategory:int;

        public function PickupObjectMessageComposer(k:int, _arg_2:int)
        {
            this._objectId = k;
            this._objectCategory = _arg_2;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            var k:int;
            switch (this._objectCategory)
            {
                case RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE:
                    k = 2;
                    break;
                case RoomObjectCategoryEnum.OBJECT_CATEGORY_WALLITEM:
                    k = 1;
                    break;
                default:
                    return [];
            }
            return [k, this._objectId];
        }
    }
}
