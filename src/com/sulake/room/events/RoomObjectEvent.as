package com.sulake.room.events
{
    import flash.events.Event;
    import com.sulake.room.object.IRoomObject;

    public class RoomObjectEvent extends Event 
    {
        private var _object:IRoomObject;

        public function RoomObjectEvent(k:String, _arg_2:IRoomObject, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(k, _arg_3, _arg_4);
            this._object = _arg_2;
        }

        public function get object():IRoomObject
        {
            return this._object;
        }

        public function get _Str_1577():int
        {
            if (this._object != null)
            {
                return this._object.getId();
            }
            return -1;
        }

        public function get objectType():String
        {
            if (this._object != null)
            {
                return this._object.getType();
            }
            return null;
        }
    }
}
