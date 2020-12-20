package com.sulake.habbo.friendbar.data
{
    public class FriendNotification implements IFriendNotification 
    {
        public static const TYPE_MESSENGER:int = -1;
        public static const TYPE_ROOM_EVENT:int = 0;
        public static const TYPE_ACHIEVEMENT:int = 1;
        public static const TYPE_QUEST:int = 2;
        public static const TYPE_PLAYING_GAME:int = 3;
        public static const TYPE_FINISHED_GAME:int = 4;
        public static const TYPE_GAME_INVITE:int = 5;

        private var _typeCode:int = -1;
        private var _message:String;
        private var _viewOnce:Boolean;

        public function FriendNotification(k:int, _arg_2:String, _arg_3:Boolean)
        {
            this._typeCode = k;
            this._message = _arg_2;
            this._viewOnce = _arg_3;
        }

        public static function typeCodeToString(k:int):String
        {
            switch (k)
            {
                case TYPE_MESSENGER:
                    return "instant_message";
                case TYPE_ROOM_EVENT:
                    return "room_event";
                case TYPE_ACHIEVEMENT:
                    return "achievement";
                case TYPE_QUEST:
                    return "quest";
                case TYPE_PLAYING_GAME:
                    return "playing_game";
                case TYPE_FINISHED_GAME:
                    return "finished_game";
                case TYPE_GAME_INVITE:
                    return "game_invite";
            }
            return "unknown";
        }


        public function get typeCode():int
        {
            return this._typeCode;
        }

        public function set typeCode(k:int):void
        {
            this._typeCode = k;
        }

        public function get message():String
        {
            return this._message;
        }

        public function set message(k:String):void
        {
            this._message = k;
        }

        public function get viewOnce():Boolean
        {
            return this._viewOnce;
        }

        public function set viewOnce(k:Boolean):void
        {
            this._viewOnce = k;
        }
    }
}
