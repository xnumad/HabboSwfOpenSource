package com.sulake.habbo.communication.messages.parser.talent
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_2821 
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
        private var _Str_8741:int;
        private var _Str_2722:String;
        private var _state:int;
        private var _Str_11456:int;
        private var _Str_20094:int;

        public function _Str_2821(k:IMessageDataWrapper)
        {
            this._achievementId = k.readInteger();
            this._Str_8741 = k.readInteger();
            this._Str_2722 = k.readString();
            this._state = k.readInteger();
            this._Str_11456 = k.readInteger();
            this._Str_20094 = k.readInteger();
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
            return this._Str_8741;
        }

        public function get badgeCode():String
        {
            return this._Str_2722;
        }

        public function get _Str_7605():int
        {
            return this._Str_11456;
        }

        public function get _Str_15676():int
        {
            return this._Str_20094;
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
