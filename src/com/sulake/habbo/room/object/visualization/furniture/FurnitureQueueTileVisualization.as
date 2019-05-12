package com.sulake.habbo.room.object.visualization.furniture
{
    public class FurnitureQueueTileVisualization extends FurnitureAnimatedVisualization 
    {
        private static const _Str_4186:int = 3;
        private static const _Str_18395:int = 2;
        private static const _Str_15915:int = 1;
        private static const _Str_16054:int = 15;

        private var _stateQueue:Array;
        private var _animationCounter:int;

        public function FurnitureQueueTileVisualization()
        {
            this._stateQueue = new Array();
            super();
        }

        override protected function setAnimation(k:int):void
        {
            if (k == _Str_18395)
            {
                this._stateQueue = new Array();
                this._stateQueue.push(_Str_15915);
                this._animationCounter = _Str_16054;
            }
            super.setAnimation(k);
        }

        override protected function updateAnimation(k:Number):int
        {
            if (this._animationCounter > 0)
            {
                this._animationCounter--;
            }
            if (this._animationCounter == 0)
            {
                if (this._stateQueue.length > 0)
                {
                    super.setAnimation(this._stateQueue.shift());
                }
            }
            return super.updateAnimation(k);
        }

        override protected function usesAnimationResetting():Boolean
        {
            return true;
        }
    }
}
