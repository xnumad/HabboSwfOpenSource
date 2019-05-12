package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class AchievementResolution 
    {
        public static const _Str_16945:int = 0;

        private var _achievementId:int;
        private var _level:int;
        private var _badgeId:String;
        private var _Str_8741:int;
        private var _state:int;

        public function AchievementResolution(k:IMessageDataWrapper)
        {
            this._achievementId = k.readInteger();
            this._level = k.readInteger();
            this._badgeId = k.readString();
            this._Str_8741 = k.readInteger();
            this._state = k.readInteger();
        }

        public function dispose():void
        {
            this._achievementId = 0;
            this._level = 0;
            this._badgeId = "";
            this._Str_8741 = 0;
        }

        public function get achievementId():int
        {
            return this._achievementId;
        }

        public function get level():int
        {
            return this._level;
        }

        public function get badgeId():String
        {
            return this._badgeId;
        }

        public function get _Str_20240():int
        {
            return this._Str_8741;
        }

        public function get enabled():Boolean
        {
            return this._state == _Str_16945;
        }

        public function get state():int
        {
            return this._state;
        }
    }
}
