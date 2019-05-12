package com.sulake.habbo.room.messages
{
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.utils.IVector3D;

    public class RoomObjectRoomMaskUpdateMessage extends RoomObjectUpdateMessage 
    {
        public static const RORMUM_ADD_MASK:String = "RORMUM_ADD_MASK";
        public static const _Str_10260:String = "RORMUM_ADD_MASK";
        public static const DOOR:String = "door";
        public static const WINDOW:String = "window";
        public static const HOLE:String = "hole";

        private var _type:String = "";
        private var _maskId:String = "";
        private var _maskType:String = "";
        private var _maskLoc:Vector3d = null;
        private var _maskCategory:String = "window";

        public function RoomObjectRoomMaskUpdateMessage(k:String, _arg_2:String, _arg_3:String=null, _arg_4:IVector3D=null, _arg_5:String="window")
        {
            super(null, null);
            this._type = k;
            this._maskId = _arg_2;
            this._maskType = _arg_3;
            if (_arg_4 != null)
            {
                this._maskLoc = new Vector3d(_arg_4.x, _arg_4.y, _arg_4.z);
            }
            this._maskCategory = _arg_5;
        }

        public function get type():String
        {
            return this._type;
        }

        public function get _Str_20498():String
        {
            return this._maskId;
        }

        public function get _Str_25853():String
        {
            return this._maskType;
        }

        public function get _Str_22823():IVector3D
        {
            return this._maskLoc;
        }

        public function get _Str_24290():String
        {
            return this._maskCategory;
        }
    }
}
