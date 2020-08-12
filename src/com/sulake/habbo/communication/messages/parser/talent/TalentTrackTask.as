package com.sulake.habbo.communication.messages.parser.talent
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class TalentTrackTask
    {
        public static const _Str_13382:String = "ACH_HabboWayGraduate1";
        public static const _Str_17723:String = "ACH_GuideGroupMember1";
        public static const _Str_7735:String = "ACH_SafetyQuizGraduate1";
        public static const _Str_13850:String = "ACH_EmailVerification1";
        public static const ROOM_ENTRY_1:String = "ACH_RoomEntry1";
        public static const ROOM_ENTRY_2:String = "ACH_RoomEntry2";
        public static const _Str_14749:String = "ACH_AvatarLooks1";
        public static const _Str_16378:String = "ACH_GuideAdvertisementReader1";

        private var _achievementId:int;
        private var _requiredLevel:int;
        private var _badgeCode:String;
        private var _state:int;
        private var _currentScore:int;
        private var _totalScore:int;

        public function TalentTrackTask(k:IMessageDataWrapper)
        {
            this._achievementId = k.readInteger();
            this._requiredLevel = k.readInteger();
            this._badgeCode = k.readString();
            this._state = k.readInteger();
            this._currentScore = k.readInteger();
            this._totalScore = k.readInteger();
        }

        public function get state():int
        {
            return this._state;
        }

        public function get achievementId():int
        {
            return this._achievementId;
        }

        public function get _Str_20240():int
        {
            return this._requiredLevel;
        }

        public function get badgeCode():String
        {
            return this._badgeCode;
        }

        public function get _Str_7605():int
        {
            return this._currentScore;
        }

        public function get _Str_15676():int
        {
            return this._totalScore;
        }

        public function _Str_24120():Boolean
        {
            switch (this.badgeCode)
            {
                case _Str_13382:
                case _Str_7735:
                case _Str_13850:
                case _Str_14749:
                    return false;
                default:
                    return true;
            }
        }
    }
}
