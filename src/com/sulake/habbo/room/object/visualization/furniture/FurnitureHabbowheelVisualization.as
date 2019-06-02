package com.sulake.habbo.room.object.visualization.furniture
{
    public class FurnitureHabbowheelVisualization extends FurnitureAnimatedVisualization 
    {
        private static const ANIMATION_ID_OFFSET_SLOW1:int = 10;
        private static const ANIMATION_ID_OFFSET_SLOW2:int = 20;
        private static const ANIMATION_ID_START_ROLL:int = 31;
        private static const ANIMATION_ID_ROLL:int = 32;

        private var _stateQueue:Array;
        private var _running:Boolean = false;

        public function FurnitureHabbowheelVisualization()
        {
            this._stateQueue = new Array();
            super();
        }

        override protected function setAnimation(k:int):void
        {
            if (k == -1)
            {
                if (!this._running)
                {
                    this._running = true;
                    this._stateQueue = new Array();
                    this._stateQueue.push(ANIMATION_ID_START_ROLL);
                    this._stateQueue.push(ANIMATION_ID_ROLL);
                    return;
                }
            }
            if (((k > 0) && (k <= ANIMATION_ID_OFFSET_SLOW1)))
            {
                if (this._running)
                {
                    this._running = false;
                    this._stateQueue = new Array();
                    this._stateQueue.push((ANIMATION_ID_OFFSET_SLOW1 + k));
                    this._stateQueue.push((ANIMATION_ID_OFFSET_SLOW2 + k));
                    this._stateQueue.push(k);
                    return;
                }
                super.setAnimation(k);
            }
        }

        override protected function updateAnimation(k:Number):int
        {
            if ((((super.getLastFramePlayed(1)) && (super.getLastFramePlayed(2))) && (super.getLastFramePlayed(3))))
            {
                if (this._stateQueue.length > 0)
                {
                    super.setAnimation(this._stateQueue.shift());
                }
            }
            return super.updateAnimation(k);
        }
    }
}
