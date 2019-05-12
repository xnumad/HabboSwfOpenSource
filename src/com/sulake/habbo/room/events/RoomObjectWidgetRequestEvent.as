package com.sulake.habbo.room.events
{
    import com.sulake.room.events.RoomObjectEvent;
    import com.sulake.room.object.IRoomObject;

    public class RoomObjectWidgetRequestEvent extends RoomObjectEvent 
    {
        public static const OPEN_WIDGET:String = "ROWRE_OPEN_WIDGET";
        public static const CLOSE_WIDGET:String = "ROWRE_CLOSE_WIDGET";
        public static const OPEN_FURNI_CONTEXT_MENU:String = "ROWRE_OPEN_FURNI_CONTEXT_MENU";
        public static const CLOSE_FURNI_CONTEXT_MENU:String = "ROWRE_CLOSE_FURNI_CONTEXT_MENU";
        public static const PLACEHOLDER:String = "ROWRE_PLACEHOLDER";
        public static const CREDITFURNI:String = "ROWRE__CREDITFURNI";
        public static const STICKIE:String = "ROWRE__STICKIE";
        public static const PRESENT:String = "ROWRE_PRESENT";
        public static const TROPHY:String = "ROWRE_TROPHY";
        public static const TEASER:String = "ROWRE_TEASER";
        public static const ECOTRONBOX:String = "ROWRE_ECOTRONBOX";
        public static const DIMMER:String = "ROWRE_DIMMER";
        public static const WIDGET_REMOVE_DIMMER:String = "ROWRE_WIDGET_REMOVE_DIMMER";
        public static const CLOTHING_CHANGE:String = "ROWRE_CLOTHING_CHANGE";
        public static const JUKEBOX_PLAYLIST_EDITOR:String = "ROWRE_JUKEBOX_PLAYLIST_EDITOR";
        public static const MANNEQUIN:String = "ROWRE_MANNEQUIN";
        public static const PET_PRODUCT_MENU:String = "ROWRE_PET_PRODUCT_MENU";
        public static const GUILD_FURNI_CONTEXT_MENU:String = "ROWRE_GUILD_FURNI_CONTEXT_MENU";
        public static const MONSTERPLANT_SEED_PLANT_CONFIRMATION_DIALOG:String = "ROWRE_MONSTERPLANT_SEED_PLANT_CONFIRMATION_DIALOG";
        public static const PURCHASABLE_CLOTHING_CONFIRMATION_DIALOG:String = "ROWRE_PURCHASABLE_CLOTHING_CONFIRMATION_DIALOG";
        public static const BACKGROUND_COLOR:String = "ROWRE_BACKGROUND_COLOR";
        public static const MYSTERYBOX_OPEN_DIALOG:String = "ROWRE_MYSTERYBOX_OPEN_DIALOG";
        public static const EFFECTBOX_OPEN_DIALOG:String = "ROWRE_EFFECTBOX_OPEN_DIALOG";
        public static const MYSTERYTROPHY_OPEN_DIALOG:String = "ROWRE_MYSTERYTROPHY_OPEN_DIALOG";
        public static const ACHIEVEMENT_RESOLUTION_OPEN:String = "ROWRE_ACHIEVEMENT_RESOLUTION_OPEN";
        public static const ACHIEVEMENT_RESOLUTION_ENGRAVING:String = "ROWRE_ACHIEVEMENT_RESOLUTION_ENGRAVING";
        public static const ACHIEVEMENT_RESOLUTION_FAILED:String = "ROWRE_ACHIEVEMENT_RESOLUTION_FAILED";
        public static const FRIEND_FURNITURE_CONFIRM:String = "ROWRE_FRIEND_FURNITURE_CONFIRM";
        public static const FRIEND_FURNITURE_ENGRAVING:String = "ROWRE_FRIEND_FURNITURE_ENGRAVING";
        public static const BADGE_DISPLAY_ENGRAVING:String = "ROWRE_BADGE_DISPLAY_ENGRAVING";
        public static const HIGH_SCORE_DISPLAY:String = "ROWRE_HIGH_SCORE_DISPLAY";
        public static const HIDE_HIGH_SCORE_DISPLAY:String = "ROWRE_HIDE_HIGH_SCORE_DISPLAY";
        public static const INERNAL_LINK:String = "ROWRE_INTERNAL_LINK";
        public static const ROOM_LINK:String = "ROWRE_ROOM_LINK";

        public function RoomObjectWidgetRequestEvent(k:String, _arg_2:IRoomObject, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(k, _arg_2, _arg_3, _arg_4);
        }
    }
}
