//com.sulake.habbo.session.events.RoomSessionErrorMessageEvent

package com.sulake.habbo.session.events{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionErrorMessageEvent extends RoomSessionEvent {

        public static const KICKED_BY_OWNER:String;
        public static const PETS_FORBIDDEN_IN_HOTEL:String;
        public static const PETS_FORBIDDEN_IN_FLAT:String;
        public static const MAX_NUMBER_OF_PETS:String;
        public static const MAX_NUMBER_OF_OWN_PETS:String;
        public static const NO_FREE_TILES_FOR_PET:String;
        public static const SELECTED_TILE_NOT_FREE_FOR_PET:String;
        public static const BOTS_FORBIDDEN_IN_HOTEL:String;
        public static const BOTS_FORBIDDEN_IN_FLAT:String;
        public static const BOT_LIMIT_REACHED:String;
        public static const SELECTED_TILE_NOT_FREE_FOR_BOT:String;
        public static const BOT_NAME_NOT_ACCEPTED:String;

        private var _message:String;

        public function RoomSessionErrorMessageEvent(k:String, _arg_2:IRoomSession, _arg_3:String=null, _arg_4:Boolean=false, _arg_5:Boolean=false);

        public function get message():String;


    }
}//package com.sulake.habbo.session.events

