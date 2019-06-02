package com.sulake.habbo.room.events
{
    import com.sulake.room.events.RoomObjectMouseEvent;
    import com.sulake.room.object.IRoomObject;

    public class RoomObjectTileMouseEvent extends RoomObjectMouseEvent 
    {
        private var _tileX:Number;
        private var _tileY:Number;
        private var _tileZ:Number;

        public function RoomObjectTileMouseEvent(k:String, _arg_2:IRoomObject, _arg_3:String, _arg_4:Number, _arg_5:Number, _arg_6:Number, _arg_7:Boolean=false, _arg_8:Boolean=false, _arg_9:Boolean=false, _arg_10:Boolean=false, _arg_11:Boolean=false, _arg_12:Boolean=false)
        {
            super(k, _arg_2, _arg_3, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11, _arg_12);
            this._tileX = _arg_4;
            this._tileY = _arg_5;
            this._tileZ = _arg_6;
        }

        public function get tileX():Number
        {
            return this._tileX;
        }

        public function get tileY():Number
        {
            return this._tileY;
        }

        public function get tileZ():Number
        {
            return this._tileZ;
        }

        public function get tileXAsInt():int
        {
            return this._tileX + 0.499;
        }

        public function get tileYAsInt():int
        {
            return this._tileY + 0.499;
        }

        public function get tileZAsInt():int
        {
            return this._tileZ + 0.499;
        }
    }
}
