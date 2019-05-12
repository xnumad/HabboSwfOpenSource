package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetUserActionMessage extends RoomWidgetMessage 
    {
        public static const RWUAM_WHISPER_USER:String = "RWUAM_WHISPER_USER";
        public static const RWUAM_IGNORE_USER:String = "RWUAM_IGNORE_USER";
        public static const RWUAM_IGNORE_USER_BUBBLE:String = "RWUAM_IGNORE_USER_BUBBLE";
        public static const RWUAM_UNIGNORE_USER:String = "RWUAM_UNIGNORE_USER";
        public static const RWUAM_KICK_USER:String = "RWUAM_KICK_USER";
        public static const RWUAM_BAN_USER_HOUR:String = "RWUAM_BAN_USER_HOUR";
        public static const RWUAM_BAN_USER_DAY:String = "RWUAM_BAN_USER_DAY";
        public static const RWUAM_BAN_USER_PERM:String = "RWUAM_BAN_USER_PERM";
        public static const MUTE_USER_2MIN:String = "RWUAM_MUTE_USER_2MIN";
        public static const MUTE_USER_5MIN:String = "RWUAM_MUTE_USER_5MIN";
        public static const MUTE_USER_10MIN:String = "RWUAM_MUTE_USER_10MIN";
        public static const RWUAM_SEND_FRIEND_REQUEST:String = "RWUAM_SEND_FRIEND_REQUEST";
        public static const RWUAM_RESPECT_USER:String = "RWUAM_RESPECT_USER";
        public static const RWUAM_GIVE_RIGHTS:String = "RWUAM_GIVE_RIGHTS";
        public static const RWUAM_TAKE_RIGHTS:String = "RWUAM_TAKE_RIGHTS";
        public static const RWUAM_START_TRADING:String = "RWUAM_START_TRADING";
        public static const RWUAM_OPEN_HOME_PAGE:String = "RWUAM_OPEN_HOME_PAGE";
        public static const RWUAM_REPORT:String = "RWUAM_REPORT";
        public static const RWUAM_PICKUP_PET:String = "RWUAM_PICKUP_PET";
        public static const RWUAM_MOUNT_PET:String = "RWUAM_MOUNT_PET";
        public static const RWUAM_TOGGLE_PET_RIDING_PERMISSION:String = "RWUAM_TOGGLE_PET_RIDING_PERMISSION";
        public static const RWUAM_TOGGLE_PET_BREEDING_PERMISSION:String = "RWUAM_TOGGLE_PET_BREEDING_PERMISSION";
        public static const RWUAM_DISMOUNT_PET:String = "RWUAM_DISMOUNT_PET";
        public static const RWUAM_SADDLE_OFF:String = "RWUAM_SADDLE_OFF";
        public static const RWUAM_TRAIN_PET:String = "RWUAM_TRAIN_PET";
        public static const _Str_6480:String = " RWUAM_RESPECT_PET";
        public static const RWUAM_TREAT_PET:String = "RWUAM_TREAT_PET";
        public static const RWUAM_REQUEST_PET_UPDATE:String = "RWUAM_REQUEST_PET_UPDATE";
        public static const RWUAM_START_NAME_CHANGE:String = "RWUAM_START_NAME_CHANGE";
        public static const RWUAM_PASS_CARRY_ITEM:String = "RWUAM_PASS_CARRY_ITEM";
        public static const RWUAM_DROP_CARRY_ITEM:String = "RWUAM_DROP_CARRY_ITEM";
        public static const RWUAM_GIVE_CARRY_ITEM_TO_PET:String = "RWUAM_GIVE_CARRY_ITEM_TO_PET";
        public static const RWUAM_GIVE_WATER_TO_PET:String = "RWUAM_GIVE_WATER_TO_PET";
        public static const RWUAM_GIVE_LIGHT_TO_PET:String = "RWUAM_GIVE_LIGHT_TO_PET";
        public static const RWUAM_REQUEST_BREED_PET:String = "RWUAM_REQUEST_BREED_PET";
        public static const RWUAM_HARVEST_PET:String = "RWUAM_HARVEST_PET";
        public static const RWUAM_REVIVE_PET:String = "RWUAM_REVIVE_PET";
        public static const RWUAM_COMPOST_PLANT:String = "RWUAM_COMPOST_PLANT";
        public static const RWUAM_GET_BOT_INFO:String = "RWUAM_GET_BOT_INFO";
        public static const RWUAM_REPORT_CFH_OTHER:String = "RWUAM_REPORT_CFH_OTHER";
        public static const RWUAM_AMBASSADOR_ALERT_USER:String = "RWUAM_AMBASSADOR_ALERT_USER";
        public static const RWUAM_AMBASSADOR_KICK_USER:String = "RWUAM_AMBASSADOR_KICK_USER";
        public static const AMBASSADOR_MUTE_USER_2MIN:String = "RWUAM_AMBASSADOR_MUTE_2MIN";
        public static const AMBASSADOR_MUTE_USER_10MIN:String = "RWUAM_AMBASSADOR_MUTE_10MIN";
        public static const AMBASSADOR_MUTE_USER_60MIN:String = "RWUAM_AMBASSADOR_MUTE_60MIN";
        public static const AMBASSADOR_MUTE_USER_18HOUR:String = "RWUAM_AMBASSADOR_MUTE_18HOUR";

        private var _userId:int = 0;

        public function RoomWidgetUserActionMessage(k:String, _arg_2:int=0)
        {
            super(k);
            this._userId = _arg_2;
        }

        public function get userId():int
        {
            return this._userId;
        }
    }
}
