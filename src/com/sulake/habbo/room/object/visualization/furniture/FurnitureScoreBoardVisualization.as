package com.sulake.habbo.room.object.visualization.furniture
{
    public class FurnitureScoreBoardVisualization extends FurnitureAnimatedVisualization 
    {
        private static const ONES_SPRITE:String = "ones_sprite";
        private static const TENS_SPRITE:String = "tens_sprite";
        private static const HUNDREDS_SPRITE:String = "hundreds_sprite";
        private static const THOUSANDS_SPRITE:String = "thousands_sprite";


        override public function get animationId():int
        {
            return 0;
        }

        override protected function getFrameNumber(k:int, _arg_2:int):int
        {
            var _local_3:String = getSpriteTag(k, direction, _arg_2);
            var _local_4:int = super.animationId;
            switch (_local_3)
            {
                case ONES_SPRITE:
                    return _local_4 % 10;
                case TENS_SPRITE:
                    return (_local_4 / 10) % 10;
                case HUNDREDS_SPRITE:
                    return (_local_4 / 100) % 10;
                case THOUSANDS_SPRITE:
                    return (_local_4 / 1000) % 10;
                default:
                    return super.getFrameNumber(k, _arg_2);
            }
        }
    }
}
