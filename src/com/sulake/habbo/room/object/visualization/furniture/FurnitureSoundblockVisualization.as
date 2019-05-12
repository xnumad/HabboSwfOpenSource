package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;

    public class FurnitureSoundblockVisualization extends FurnitureAnimatedVisualization 
    {
        private var _Str_12376:int = 1;
        private var _Str_12177:Number = 0;


        override protected function get frameIncrease():int
        {
            return this._Str_12376;
        }

        override protected function updateAnimations(k:Number):int
        {
            this._Str_12177 = (this._Str_12177 + object.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_SOUNDBLOCK_RELATIVE_ANIMATION_SPEED));
            this._Str_12376 = this._Str_12177;
            this._Str_12177 = (this._Str_12177 - this._Str_12376);
            return super.updateAnimations(k);
        }
    }
}
