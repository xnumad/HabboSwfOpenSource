package com.sulake.habbo.room.messages
{
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.room.utils.Vector3d;

    public class RoomObjectTileCursorUpdateMessage extends RoomObjectUpdateMessage 
    {
        private var _height:Number;
        private var _sourceEventId:String;
        private var _visible:Boolean;
        private var _toggleVisibility:Boolean;

        public function RoomObjectTileCursorUpdateMessage(k:Vector3d, _arg_2:Number, _arg_3:Boolean, _arg_4:String, _arg_5:Boolean=false)
        {
            super(k, null);
            this._height = _arg_2;
            this._visible = _arg_3;
            this._sourceEventId = _arg_4;
            this._toggleVisibility = _arg_5;
        }

        public function get height():Number
        {
            return this._height;
        }

        public function get visible():Boolean
        {
            return this._visible;
        }

        public function get sourceEventId():String
        {
            return this._sourceEventId;
        }

        public function get toggleVisibility():Boolean
        {
            return this._toggleVisibility;
        }
    }
}
