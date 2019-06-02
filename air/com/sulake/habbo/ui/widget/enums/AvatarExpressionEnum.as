//com.sulake.habbo.ui.widget.enums.AvatarExpressionEnum

package com.sulake.habbo.ui.widget.enums{
    public class AvatarExpressionEnum {

        public static const NONE:AvatarExpressionEnum;
        public static const WAVE:AvatarExpressionEnum;
        public static const BLOW:AvatarExpressionEnum;
        public static const LAUGH:AvatarExpressionEnum;
        public static const CRY:AvatarExpressionEnum;
        public static const IDLE:AvatarExpressionEnum;
        public static const JUMP:AvatarExpressionEnum;
        public static const RESPECT:AvatarExpressionEnum;

        private var _ordinal:int;

        public function AvatarExpressionEnum(k:int):void;

        public function get ordinal():int;

        public function equals(k:AvatarExpressionEnum):Boolean;


    }
}//package com.sulake.habbo.ui.widget.enums

