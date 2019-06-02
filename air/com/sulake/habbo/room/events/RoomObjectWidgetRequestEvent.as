//com.sulake.habbo.room.events.RoomObjectWidgetRequestEvent

package com.sulake.habbo.room.events{
    import com.sulake.room.events.RoomObjectEvent;
    import com.sulake.room.object.IRoomObject;

    public class RoomObjectWidgetRequestEvent extends RoomObjectEvent {

        public static const OPEN_WIDGET:String;
        public static const CLOSE_WIDGET:String;
        public static const OPEN_FURNI_CONTEXT_MENU:String;
        public static const CLOSE_FURNI_CONTEXT_MENU:String;
        public static const PLACEHOLDER:String;
        public static const CREDITFURNI:String;
        public static const STICKIE:String;
        public static const PRESENT:String;
        public static const TROPHY:String;
        public static const TEASER:String;
        public static const ECOTRONBOX:String;
        public static const DIMMER:String;
        public static const REMOVE_DIMMER:String;
        public static const CLOTHING_CHANGE:String;
        public static const PLAYLIST_EDITOR:String;
        public static const MANNEQUIN:String;
        public static const PET_PRODUCT_MENU:String;
        public static const GUILD_FURNI_CONTEXT_MENU:String;
        public static const MONSTERPLANT_SEED_PLANT_CONFIRMATION_DIALOG:String;
        public static const BACKGROUND_COLOR:String;
        public static const MYSTERYBOX_OPEN_DIALOG:String;
        public static const EFFECTBOX_OPEN_DIALOG:String;
        public static const ACHIEVEMENT_RESOLUTION_OPEN:String;
        public static const ACHIEVEMENT_RESOLUTION_ENGRAVING:String;
        public static const ACHIEVEMENT_RESOLUTION_FAILED:String;
        public static const FRIEND_FURNITURE_CONFIRM:String;
        public static const FRIEND_FURNITURE_ENGRAVING:String;
        public static const BADGE_DISPLAY_ENGRAVING:String;
        public static const HIGH_SCORE_DISPLAY:String;
        public static const HIDE_HIGH_SCORE_DISPLAY:String;
        public static const INTERNAL_LINK:String;

        public function RoomObjectWidgetRequestEvent(k:String, _arg_2:IRoomObject, _arg_3:Boolean=false, _arg_4:Boolean=false);

    }
}//package com.sulake.habbo.room.events

