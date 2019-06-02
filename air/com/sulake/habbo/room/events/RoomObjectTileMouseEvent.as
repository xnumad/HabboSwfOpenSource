//com.sulake.habbo.room.events.RoomObjectTileMouseEvent

package com.sulake.habbo.room.events{
    import com.sulake.room.events.RoomObjectMouseEvent;
    import com.sulake.room.object.IRoomObject;

    public class RoomObjectTileMouseEvent extends RoomObjectMouseEvent {

        private var _tileX:Number;
        private var _tileY:Number;
        private var _tileZ:Number;

        public function RoomObjectTileMouseEvent(k:String, _arg_2:IRoomObject, _arg_3:String, _arg_4:Number, _arg_5:Number, _arg_6:Number, _arg_7:Boolean=false, _arg_8:Boolean=false, _arg_9:Boolean=false, k0:Boolean=false, k1:Boolean=false, k2:Boolean=false);

        public function get tileX():Number;

        public function get tileY():Number;

        public function get tileZ():Number;

        public function get tileXAsInt():int;

        public function get tileYAsInt():int;

        public function get tileZAsInt():int;


    }
}//package com.sulake.habbo.room.events

