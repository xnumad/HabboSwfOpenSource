package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;

    public class FurnitureVoteCounterVisualization extends FurnitureAnimatedVisualization 
    {
        private static const ONES_SPRITE:String = "ones_sprite";
        private static const TENS_SPRITE:String = "tens_sprite";
        private static const HUNDREDS_SPRITE:String = "hundreds_sprite";
        private static const HIDE_COUNTER_SCORE:int = -1;


        override protected function updateObject(k:Number, _arg_2:Number):Boolean
        {
            super.updateObject(k, _arg_2);
            return true;
        }

        override protected function getFrameNumber(k:int, _arg_2:int):int
        {
            var _local_3:IRoomObjectModel = object.getModel();
            var _local_4:int = _local_3.getNumber(RoomObjectVariableEnum.FURNITURE_VOTE_COUNTER_COUNT);
            var _local_5:String = getSpriteTag(k, direction, _arg_2);
            switch (_local_5)
            {
                case ONES_SPRITE:
                    return _local_4 % 10;
                case TENS_SPRITE:
                    return (_local_4 / 10) % 10;
                case HUNDREDS_SPRITE:
                    return (_local_4 / 100) % 10;
                default:
                    return super.getFrameNumber(k, _arg_2);
            }
        }

        override protected function getSpriteAlpha(k:int, _arg_2:int, _arg_3:int):int
        {
            var _local_6:String;
            var _local_4:IRoomObjectModel = object.getModel();
            var _local_5:int = _local_4.getNumber(RoomObjectVariableEnum.FURNITURE_VOTE_COUNTER_COUNT);
            if (_local_5 == HIDE_COUNTER_SCORE)
            {
                _local_6 = getSpriteTag(k, _arg_2, _arg_3);
                switch (_local_6)
                {
                    case ONES_SPRITE:
                    case TENS_SPRITE:
                    case HUNDREDS_SPRITE:
                        return 0;
                }
            }
            return super.getSpriteAlpha(k, _arg_2, _arg_3);
        }
    }
}
