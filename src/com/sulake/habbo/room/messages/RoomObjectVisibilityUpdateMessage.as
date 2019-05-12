package com.sulake.habbo.room.messages
{
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class RoomObjectVisibilityUpdateMessage extends RoomObjectUpdateMessage 
    {
        public static const ROVUM_ENABLED:String = "ROVUM_ENABLED";
        public static const ROVUM_DISABLED:String = "ROVUM_DISABLED";

        private var _type:String;

        public function RoomObjectVisibilityUpdateMessage(k:String)
        {
            super(null, null);
            this._type = k;
        }

        public function get type():String
        {
            return this._type;
        }
    }
}
