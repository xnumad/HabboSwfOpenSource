package com.sulake.habbo.room.object.visualization.furniture
{
    public class FurnitureQueueTileVisualization extends FurnitureAnimatedVisualization 
    {
        private static const ANIMATION_ID_ROLL:int = 3;
        private static const ANIMATION_ID_ROLL_ONCE:int = 2;
        private static const ANIMATION_ID_NORMAL:int = 1;
        private static const ANIMATION_DURATION:int = 15;

        private var _stateQueue:Array;
        private var _animationCounter:int;

        public function FurnitureQueueTileVisualization()
        {
            this._stateQueue = new Array();
            super();
        }

        override protected function setAnimation(k:int):void
        {
            if (k == ANIMATION_ID_ROLL_ONCE)
            {
                this._stateQueue = new Array();
                this._stateQueue.push(ANIMATION_ID_NORMAL);
                this._animationCounter = ANIMATION_DURATION;
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
