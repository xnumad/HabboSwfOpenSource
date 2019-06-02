package com.sulake.habbo.communication.messages.parser.game.lobby
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class AchievementResolutionProgressMessageParser implements IMessageParser 
    {
        private var _stuffId:int;
        private var _achievementId:int;
        private var _requiredLevelBadgeCode:String;
        private var _userProgress:int;
        private var _totalProgress:int;
        private var _endTime:int;


        public function flush():Boolean
        {
            this._stuffId = -1;
            this._achievementId = 0;
            this._requiredLevelBadgeCode = "";
            this._userProgress = 0;
            this._totalProgress = 0;
            this._endTime = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._stuffId = k.readInteger();
            this._achievementId = k.readInteger();
            this._requiredLevelBadgeCode = k.readString();
            this._userProgress = k.readInteger();
            this._totalProgress = k.readInteger();
            this._endTime = k.readInteger();
            return true;
        }

        public function get stuffId():int
        {
            return this._stuffId;
        }

        public function get achievementId():int
        {
            return this._achievementId;
        }

        public function get requiredLevelBadgeCode():String
        {
            return this._requiredLevelBadgeCode;
        }

        public function get userProgress():int
        {
            return this._userProgress;
        }

        public function get _Str_18600():int
        {
            return this._totalProgress;
        }

        public function get _Str_17028():int
        {
            return this._endTime;
        }
    }
}
