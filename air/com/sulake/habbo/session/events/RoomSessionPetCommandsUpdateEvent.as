//com.sulake.habbo.session.events.RoomSessionPetCommandsUpdateEvent

package com.sulake.habbo.session.events{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionPetCommandsUpdateEvent extends RoomSessionEvent {

        public static const PET_COMMANDS:String;

        private var _petId:int;
        private var _allCommandIds:Array;
        private var _enabledCommandIds:Array;

        public function RoomSessionPetCommandsUpdateEvent(k:IRoomSession, _arg_2:int, _arg_3:Array, _arg_4:Array, _arg_5:Boolean=false, _arg_6:Boolean=false);

        public function get petId():int;

        public function get allCommands():Array;

        public function get enabledCommands():Array;


    }
}//package com.sulake.habbo.session.events

