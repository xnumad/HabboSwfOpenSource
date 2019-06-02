//com.sulake.habbo.room.events.RoomEngineToWidgetEvent

package com.sulake.habbo.room.events{
    public class RoomEngineToWidgetEvent extends RoomEngineObjectEvent {

        public static const REQUEST_OPEN_WIDGET:String;
        public static const REQUEST_CLOSE_WIDGET:String;
        public static const REQUEST_OPEN_FURNI_CONTEXT_MENU:String;
        public static const REQUEST_CLOSE_FURNI_CONTEXT_MENU:String;
        public static const REQUEST_PLACEHOLDER:String;
        public static const REQUEST_CREDITFURNI:String;
        public static const REQUEST_STICKIE:String;
        public static const REQUEST_PRESENT:String;
        public static const REQUEST_TROPHY:String;
        public static const REQUEST_TEASER:String;
        public static const REQUEST_ECOTRONBOX:String;
        public static const REQUEST_DIMMER:String;
        public static const REMOVE_DIMMER:String;
        public static const REQUEST_CLOTHING_CHANGE:String;
        public static const REQUEST_PLAYLIST_EDITOR:String;
        public static const REQUEST_MANNEQUIN:String;
        public static const REQUEST_MONSTERPLANT_SEED_PLANT_CONFIRMATION_DIALOG:String;
        public static const REQUEST_BACKGROUND_COLOR:String;
        public static const REQUEST_MYSTERYBOX_OPEN_DIALOG:String;
        public static const REQUEST_EFFECTBOX_OPEN_DIALOG:String;
        public static const REQUEST_ACHIEVEMENT_RESOLUTION_ENGRAVING:String;
        public static const REQUEST_ACHIEVEMENT_RESOLUTION_FAILED:String;
        public static const REQUEST_FRIEND_FURNITURE_CONFIRM:String;
        public static const REQUEST_FRIEND_FURNITURE_ENGRAVING:String;
        public static const REQUEST_BADGE_DISPLAY_ENGRAVING:String;
        public static const REQUEST_HIGH_SCORE_DISPLAY:String;
        public static const REQUEST_HIDE_HIGH_SCORE_DISPLAY:String;
        public static const REQUEST_INTERNAL_LINK:String;

        private var _param:String;

        public function RoomEngineToWidgetEvent(k:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:String=null, _arg_6:Boolean=false, _arg_7:Boolean=false);

        public function get widget():String;

        public function get contextMenu():String;


    }
}//package com.sulake.habbo.room.events

