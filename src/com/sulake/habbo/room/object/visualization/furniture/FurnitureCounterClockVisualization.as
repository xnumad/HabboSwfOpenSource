package com.sulake.habbo.room.object.visualization.furniture
{
    public class FurnitureCounterClockVisualization extends FurnitureAnimatedVisualization 
    {
        private static const SECONDS_SPRITE:String = "seconds_sprite";
        private static const TEN_SECONDS_SPRITE:String = "ten_seconds_sprite";
        private static const MINUTES_SPRITE:String = "minutes_sprite";
        private static const TEN_MINUTES_SPRITE:String = "ten_minutes_sprite";


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
                case SECONDS_SPRITE:
                    return (_local_4 % 60) % 10;
                case TEN_SECONDS_SPRITE:
                    return (_local_4 % 60) / 10;
                case MINUTES_SPRITE:
                    return (_local_4 / 60) % 10;
                case TEN_MINUTES_SPRITE:
                    return ((_local_4 / 60) / 10) % 10;
                default:
                    return super.getFrameNumber(k, _arg_2);
            }
        }
    }
}
