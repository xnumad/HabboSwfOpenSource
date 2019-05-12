package com.sulake.habbo.session.events
{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionErrorMessageEvent extends RoomSessionEvent 
    {
        public static const RSEME_KICKED:String = "RSEME_KICKED";
        public static const RSEME_PETS_FORBIDDEN_IN_HOTEL:String = "RSEME_PETS_FORBIDDEN_IN_HOTEL";
        public static const RSEME_PETS_FORBIDDEN_IN_FLAT:String = "RSEME_PETS_FORBIDDEN_IN_FLAT";
        public static const RSEME_MAX_PETS:String = "RSEME_MAX_PETS";
        public static const RSEME_MAX_NUMBER_OF_OWN_PETS:String = "RSEME_MAX_NUMBER_OF_OWN_PETS";
        public static const RSEME_NO_FREE_TILES_FOR_PET:String = "RSEME_NO_FREE_TILES_FOR_PET";
        public static const RSEME_SELECTED_TILE_NOT_FREE_FOR_PET:String = "RSEME_SELECTED_TILE_NOT_FREE_FOR_PET";
        public static const RSEME_BOTS_FORBIDDEN_IN_HOTEL:String = "RSEME_BOTS_FORBIDDEN_IN_HOTEL";
        public static const RSEME_BOTS_FORBIDDEN_IN_FLAT:String = "RSEME_BOTS_FORBIDDEN_IN_FLAT";
        public static const RSEME_BOT_LIMIT_REACHED:String = "RSEME_BOT_LIMIT_REACHED";
        public static const RSEME_SELECTED_TILE_NOT_FREE_FOR_BOT:String = "RSEME_SELECTED_TILE_NOT_FREE_FOR_BOT";
        public static const RSEME_BOT_NAME_NOT_ACCEPTED:String = "RSEME_BOT_NAME_NOT_ACCEPTED";

        private var _message:String;

        public function RoomSessionErrorMessageEvent(k:String, _arg_2:IRoomSession, _arg_3:String=null, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super(k, _arg_2, _arg_4, _arg_5);
            this._message = _arg_3;
        }

        public function get message():String
        {
            return this._message;
        }
    }
}
