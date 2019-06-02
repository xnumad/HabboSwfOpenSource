//com.sulake.habbo.session.events.RoomSessionPresentEvent

package com.sulake.habbo.session.events{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionPresentEvent extends RoomSessionEvent {

        public static const ROOM_SESSION_PRESENT_OPENED:String;

        private var _classId:int;
        private var _itemType:String;
        private var _productCode:String;
        private var _placedItemId:int;
        private var _placedItemType:String;
        private var _placedInRoom:Boolean;
        private var _petFigureString:String;

        public function RoomSessionPresentEvent(k:String, _arg_2:IRoomSession, _arg_3:int, _arg_4:String, _arg_5:String, _arg_6:int, _arg_7:String, _arg_8:Boolean, _arg_9:String, k0:Boolean=false, k1:Boolean=false);

        public function get classId():int;

        public function get itemType():String;

        public function get productCode():String;

        public function get placedItemId():int;

        public function get placedInRoom():Boolean;

        public function get placedItemType():String;

        public function get petFigureString():String;


    }
}//package com.sulake.habbo.session.events

