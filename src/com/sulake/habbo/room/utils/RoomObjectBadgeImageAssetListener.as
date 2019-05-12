package com.sulake.habbo.room.utils
{
    import com.sulake.room.object.IRoomObjectController;

    public class RoomObjectBadgeImageAssetListener 
    {
        private var _object:IRoomObjectController;
        private var _groupBadge:Boolean;

        public function RoomObjectBadgeImageAssetListener(object:IRoomObjectController, groupBadge:Boolean)
        {
            this._object = object;
            this._groupBadge = groupBadge;
        }

        public function get object():IRoomObjectController
        {
            return this._object;
        }

        public function get _Str_14095():Boolean
        {
            return this._groupBadge;
        }
    }
}
