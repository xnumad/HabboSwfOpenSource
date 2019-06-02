//com.sulake.habbo.session.events.RoomSessionPetPackageEvent

package com.sulake.habbo.session.events{
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetFigureData;
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionPetPackageEvent extends RoomSessionEvent {

        public static const ROOM_SESSION_OPEN_PET_PACKAGE_REQUESTED:String;
        public static const ROOM_SESSION_OPEN_PET_PACKAGE_RESULT:String;

        private var _objectId:int;
        private var _figureData:PetFigureData;
        private var _nameValidationStatus:int;
        private var _nameValidationInfo:String;

        public function RoomSessionPetPackageEvent(k:String, _arg_2:IRoomSession, _arg_3:int, _arg_4:PetFigureData, _arg_5:int, _arg_6:String, _arg_7:Boolean=false, _arg_8:Boolean=false);

        public function get objectId():int;

        public function get figureData():PetFigureData;

        public function get nameValidationStatus():int;

        public function get nameValidationInfo():String;


    }
}//package com.sulake.habbo.session.events

