//com.sulake.habbo.avatar.enum.AvatarAction

package com.sulake.habbo.avatar.enum{
    public class AvatarAction {

        public static const SIGN:String;
        public static const SLEEP:String;
        public static const CARRY_OBJECT:String;
        public static const USE_OBJECT:String;
        public static const EFFECT:String;
        public static const TALK:String;
        public static const GESTURE:String;
        public static const EXPRESSION:String;
        public static const VOTE:String;
        public static const DANCE:String;
        public static const TYPING:String;
        public static const MUTED:String;
        public static const PLAYING_GAME:String;
        public static const GUIDE_STATUS:String;
        public static const EXPRESSION_RESPECT:String;
        public static const EXPRESSION_JUMP:String;
        public static const EXPRESSION_WAVE:String;
        public static const EXPRESSION_BLOW_A_KISS:String;
        public static const EXPRESSION_LAUGH:String;
        public static const EXPRESSION_CRY:String;
        public static const EXPRESSION_IDLE:String;
        public static const EXPRESSION_SNOWBOARD_OLLIE:String;
        public static const EXPRESSION_SNOWBORD_360:String;
        public static const EXPRESSION_RIDE_JUMP:String;
        public static const GESTURE_SMILE:String;
        public static const GESTURE_AGGRAVATED:String;
        public static const GESTURE_SURPRISED:String;
        public static const GESTURE_SAD:String;
        public static const PET_GESTURE_JOY:String;
        public static const PET_GESTURE_CRAZY:String;
        public static const PET_GESTURE_TONGUE:String;
        public static const PET_GESTURE_BLINK:String;
        public static const PET_GESTURE_MISERABLE:String;
        public static const PET_GESTURE_PUZZLED:String;
        public static const POSTURE:String;
        public static const POSTURE_STAND:String;
        public static const POSTURE_SIT:String;
        public static const POSTURE_WALK:String;
        public static const POSTURE_LAY:String;
        public static const POSTURE_SNOWWAR_RUN:String;
        public static const POSTURE_SNOWWAR_DIE_FRONT:String;
        public static const POSTURE_SNOWWAR_DIE_BACK:String;
        public static const POSTURE_SNOWWAR_PICK:String;
        public static const POSTURE_SNOWWAR_THROW:String;
        private static const GESTURE_MAP:Array;
        private static const EXPRESSION_MAP:Array;

        public function AvatarAction();

        public static function getExpressionTime(k:int):int;

        public static function getExpressionId(k:String):int;

        public static function getExpression(k:int):String;

        public static function getGestureId(k:String):int;

        public static function getGesture(k:int):String;


    }
}//package com.sulake.habbo.avatar.enum

