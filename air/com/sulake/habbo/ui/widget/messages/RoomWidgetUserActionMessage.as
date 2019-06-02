//com.sulake.habbo.ui.widget.messages.RoomWidgetUserActionMessage

package com.sulake.habbo.ui.widget.messages{
    public class RoomWidgetUserActionMessage extends RoomWidgetMessage {

        public static const WHISPER_USER:String;
        public static const IGNORE_USER:String;
        public static const IGNORE_USER_BUBBLE:String;
        public static const UNIGNORE_USER:String;
        public static const KICK_USER:String;
        public static const BAN_USER_HOUR:String;
        public static const BAN_USER_DAY:String;
        public static const BAN_USER_PERM:String;
        public static const MUTE_USER_2MIN:String;
        public static const MUTE_USER_5MIN:String;
        public static const MUTE_USER_10MIN:String;
        public static const SEND_FRIEND_REQUEST:String;
        public static const RESPECT_USER:String;
        public static const GIVE_RIGHTS:String;
        public static const TAKE_RIGHTS:String;
        public static const START_TRADING:String;
        public static const OPEN_HOME_PAGE:String;
        public static const REPORT:String;
        public static const PICK_UP_PET:String;
        public static const MOUNT_PET:String;
        public static const TOGGLE_PET_RIDING_PERMISSION:String;
        public static const TOGGLE_PET_BREEDING_PERMISSION:String;
        public static const DISMOUNT_PET:String;
        public static const SADDLE_OFF:String;
        public static const TRAIN_PET:String;
        public static const RESPECT_PET:String;
        public static const TREAT_PET:String;
        public static const REQUEST_PET_UPDATE:String;
        public static const START_NAME_CHANGE:String;
        public static const PASS_CARRY_ITEM:String;
        public static const DROP_CARRY_ITEM:String;
        public static const GIVE_CARRY_ITEM_TO_PET:String;
        public static const GIVE_WATER_TO_PET:String;
        public static const GIVE_LIGHT_TO_PET:String;
        public static const REQUEST_BREED_PET:String;
        public static const HARVEST_PET:String;
        public static const REVIVE_PET:String;
        public static const COMPOST_PLANT:String;
        public static const GET_BOT_INFO:String;
        public static const REPORT_BULLYING:String;
        public static const REPORT_CFH_SEXUAL:String;
        public static const REPORT_CFH_PII:String;
        public static const REPORT_CFH_OTHER:String;

        private var _userId:int;

        public function RoomWidgetUserActionMessage(k:String, _arg_2:int=0);

        public function get userId():int;


    }
}//package com.sulake.habbo.ui.widget.messages

