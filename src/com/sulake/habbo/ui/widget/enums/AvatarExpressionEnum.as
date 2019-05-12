package com.sulake.habbo.ui.widget.enums
{
    public class AvatarExpressionEnum 
    {
        public static const NONE:AvatarExpressionEnum = new AvatarExpressionEnum(0);
        public static const _Str_6268:AvatarExpressionEnum = new AvatarExpressionEnum(1);
        public static const _Str_5579:AvatarExpressionEnum = new AvatarExpressionEnum(2);
        public static const _Str_7336:AvatarExpressionEnum = new AvatarExpressionEnum(3);
        public static const _Str_10353:AvatarExpressionEnum = new AvatarExpressionEnum(4);
        public static const _Str_6989:AvatarExpressionEnum = new AvatarExpressionEnum(5);
        public static const _Str_16682:AvatarExpressionEnum = new AvatarExpressionEnum(6);
        public static const _Str_6325:AvatarExpressionEnum = new AvatarExpressionEnum(7);

        private var _ordinal:int = 0;

        public function AvatarExpressionEnum(k:int):void
        {
            this._ordinal = k;
        }

        public function get _Str_6677():int
        {
            return this._ordinal;
        }

        public function _Str_1451(k:AvatarExpressionEnum):Boolean
        {
            return (k) && (k._ordinal == this._ordinal);
        }
    }
}
