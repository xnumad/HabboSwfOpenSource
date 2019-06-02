package com.sulake.habbo.ui.widget.enums
{
    public class AvatarExpressionEnum 
    {
        public static const NONE:AvatarExpressionEnum = new AvatarExpressionEnum(0);
        public static const WAVE:AvatarExpressionEnum = new AvatarExpressionEnum(1);
        public static const BLOW:AvatarExpressionEnum = new AvatarExpressionEnum(2);
        public static const LAUGH:AvatarExpressionEnum = new AvatarExpressionEnum(3);
        public static const CRY:AvatarExpressionEnum = new AvatarExpressionEnum(4);
        public static const IDLE:AvatarExpressionEnum = new AvatarExpressionEnum(5);
        public static const JUMP:AvatarExpressionEnum = new AvatarExpressionEnum(6);
        public static const RESPECT:AvatarExpressionEnum = new AvatarExpressionEnum(7);

        private var _ordinal:int = 0;

        public function AvatarExpressionEnum(k:int):void
        {
            this._ordinal = k;
        }

        public function get ordinal():int
        {
            return this._ordinal;
        }

        public function equals(k:AvatarExpressionEnum):Boolean
        {
            return (k) && (k._ordinal == this._ordinal);
        }
    }
}
