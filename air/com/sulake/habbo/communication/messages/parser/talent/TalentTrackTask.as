//com.sulake.habbo.communication.messages.parser.talent.TalentTrackTask

package com.sulake.habbo.communication.messages.parser.talent{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class TalentTrackTask {

        public static const HABBO_WAY_GRADUATE_1:String;
        public static const GUIDE_GROUP_MEMBER_1:String;
        public static const SAFETY_QUIZ_GRADUATE_1:String;
        public static const EMAIL_VERIFICATION_1:String;
        public static const ROOM_ENTRY_1:String;
        public static const ROOM_ENTRY_2:String;
        public static const AVATAR_LOOKS_1:String;
        public static const GUIDE_ADVERTISEMENT_READER:String;

        private var _achievementId:int;
        private var _requiredLevel:int;
        private var _badgeCode:String;
        private var _state:int;
        private var _currentScore:int;
        private var _totalScore:int;

        public function TalentTrackTask(k:IMessageDataWrapper);

        public function get state():int;

        public function get achievementId():int;

        public function get requiredLevel():int;

        public function get badgeCode():String;

        public function get currentScore():int;

        public function get totalScore():int;

        public function hasProgressDisplay():Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.talent

