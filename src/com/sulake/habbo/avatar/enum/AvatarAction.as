package com.sulake.habbo.avatar.enum
{
    public class AvatarAction 
    {
        public static const SIGN:String = "sign";
        public static const SLEEP:String = "Sleep";
        public static const CARRY_OBJECT:String = "cri";
        public static const USE_OBJECT:String = "usei";
        public static const EFFECT:String = "fx";
        public static const TALK:String = "talk";
        public static const GESTURE:String = "gest";
        public static const EXPRESSION:String = "expression";
        public static const VOTE:String = "vote";
        public static const DANCE:String = "dance";
        public static const TYPING:String = "typing";
        public static const MUTED:String = "muted";
        public static const PLAYING_GAME:String = "playing_game";
        public static const GUIDE_STATUS:String = "guide";
        public static const EXPRESSION_RESPECT:String = "respect";
        public static const EXPRESSION_WAVE:String = "wave";
        public static const EXPRESSION_BLOW_A_KISS:String = "blow";
        public static const EXPRESSION_LAUGH:String = "laugh";
        public static const EXPRESSION_CRY:String = "cry";
        public static const EXPRESSION_IDLE:String = "idle";
        public static const EXPRESSION_SNOWBOARD_OLLIE:String = "sbollie";
        public static const EXPRESSION_SNOWBORD_360:String = "sb360";
        public static const EXPRESSION_RIDE_JUMP:String = "ridejump";
        public static const GESTURE_SMILE:String = "sml";
        public static const GESTURE_AGGRAVATED:String = "agr";
        public static const GESTURE_SURPRISED:String = "srp";
        public static const GESTURE_SAD:String = "sad";
        public static const PET_GESTURE_JOY:String = "joy";
        public static const PET_GESTURE_CRAZY:String = "crz";
        public static const PET_GESTURE_TONGUE:String = "tng";
        public static const PET_GESTURE_BLINK:String = "eyb";
        public static const PET_GESTURE_MISERABLE:String = "mis";
        public static const PET_GESTURE_PUZZLED:String = "puz";
        public static const POSTURE:String = "posture";
        public static const POSTURE_STAND:String = "std";
        public static const POSTURE_SIT:String = "sit";
        public static const POSTURE_WALK:String = "mv";
        public static const POSTURE_LAY:String = "lay";
        public static const POSTURE_SWIM:String = "swim";
        public static const POSTURE_FLOAT:String = "float";
		
        public static const SNOWWAR_RUN:String = "swrun";
        public static const SNOWWAR_DIE_FRONT:String = "swdiefront";
        public static const SNOWWAR_DIE_BACK:String = "swdieback";
        public static const SNOWWAR_PICK:String = "swpick";
        public static const SNOWWAR_THROW:String = "swthrow";
		
        private static const GESTURE_MAP:Array = ["", GESTURE_SMILE, GESTURE_AGGRAVATED, GESTURE_SURPRISED, GESTURE_SAD, PET_GESTURE_JOY, PET_GESTURE_CRAZY, PET_GESTURE_TONGUE, PET_GESTURE_BLINK, PET_GESTURE_MISERABLE, PET_GESTURE_PUZZLED];
        private static const EXPRESSION_MAP:Array = ["", EXPRESSION_WAVE, EXPRESSION_BLOW_A_KISS, EXPRESSION_LAUGH, EXPRESSION_CRY, EXPRESSION_IDLE, DANCE, EXPRESSION_RESPECT, EXPRESSION_SNOWBOARD_OLLIE, EXPRESSION_SNOWBORD_360, EXPRESSION_RIDE_JUMP];


        public static function getExpressionTime(id:int):int
        {
            switch (id)
            {
                case 1:
                    return 5000;
                case 2:
                    return 1400;
                case 3:
                    return 2000;
                case 4:
                    return 2000;
                case 5:
                    return 0;
                case 6:
                    return 700;
                case 7:
                    return 2000;
                case 8:
                    return 1500;
                case 9:
                    return 1500;
                case 10:
                    return 1500;
                default:
                    return 0;
            }
        }

        public static function getExpressionId(expression:String):int
        {
            return EXPRESSION_MAP.indexOf(expression);
        }

        public static function getExpression(expressionId:int):String
        {
            if (expressionId < EXPRESSION_MAP.length)
            {
                return EXPRESSION_MAP[expressionId];
            }
            return "";
        }

        public static function getGestureId(gesture:String):int
        {
            return GESTURE_MAP.indexOf(gesture);
        }

        public static function getGesture(gestureId:int):String
        {
            if (gestureId < GESTURE_MAP.length)
            {
                return GESTURE_MAP[gestureId];
            }
            return "";
        }
    }
}
