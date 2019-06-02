package com.sulake.habbo.room.object.visualization.furniture
{
    public class FurnitureValRandomizerVisualization extends FurnitureAnimatedVisualization 
    {
        private static const ANIMATION_ID_OFFSET_SLOW1:int = 20;
        private static const ANIMATION_ID_OFFSET_SLOW2:int = 10;
        private static const ANIMATION_ID_START_ROLL:int = 31;
        private static const ANIMATION_ID_ROLL:int = 32;
        private static const ANIMATION_ID_OFF:int = 30;

        private var _stateQueue:Array;
        private var _running:Boolean = false;

        public function FurnitureValRandomizerVisualization()
        {
            this._stateQueue = new Array();
            super();
            super.setAnimation(ANIMATION_ID_OFF);
        }

        override protected function setAnimation(k:int):void
        {
            if (k == 0)
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
            if (((k > 0) && (k <= ANIMATION_ID_OFFSET_SLOW2)))
            {
                if (this._running)
                {
                    this._running = false;
                    this._stateQueue = new Array();
                    if (direction == 2)
                    {
                        this._stateQueue.push(((ANIMATION_ID_OFFSET_SLOW1 + 5) - k));
                        this._stateQueue.push(((ANIMATION_ID_OFFSET_SLOW2 + 5) - k));
                    }
                    else
                    {
                        this._stateQueue.push((ANIMATION_ID_OFFSET_SLOW1 + k));
                        this._stateQueue.push((ANIMATION_ID_OFFSET_SLOW2 + k));
                    }
                    this._stateQueue.push(ANIMATION_ID_OFF);
                    return;
                }
                super.setAnimation(ANIMATION_ID_OFF);
            }
        }

        override protected function updateAnimation(k:Number):int
        {
            if (super.getLastFramePlayed(11))
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
