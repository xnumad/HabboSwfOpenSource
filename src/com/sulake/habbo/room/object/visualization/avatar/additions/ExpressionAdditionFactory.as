package com.sulake.habbo.room.object.visualization.avatar.additions
{
    import com.sulake.habbo.room.object.visualization.avatar.AvatarVisualization;

    public class ExpressionAdditionFactory 
    {
        public static const WAVE:int = 1;
        public static const BLOW:int = 2;
        public static const LAUGH:int = 3;
        public static const CRY:int = 4;
        public static const IDLE:int = 5;


        public static function make(k:int, _arg_2:int, _arg_3:AvatarVisualization):IExpressionAddition
        {
            switch (_arg_2)
            {
                case BLOW:
                    return new FloatingHeart(k, BLOW, _arg_3);
                default:
                    return new ExpressionAddition(k, _arg_2, _arg_3);
            }
        }
    }
}
