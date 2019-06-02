package com.sulake.habbo.room.object.visualization.furniture
{
    public class FurnitureBottleVisualization extends FurnitureAnimatedVisualization 
    {
        private static const ANIMATION_ID_OFFSET_SLOW1:int = 20;
        private static const ANIMATION_ID_OFFSET_SLOW2:int = 9;
        private static const ANIMATION_ID_ROLL:int = -1;

        private var _stateQueue:Array;
        private var _running:Boolean = false;

        public function FurnitureBottleVisualization()
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
                    this._stateQueue.push(ANIMATION_ID_ROLL);
                    return;
                }
            }
            if (((k >= 0) && (k <= 7)))
            {
                if (this._running)
                {
                    this._running = false;
                    this._stateQueue = new Array();
                    this._stateQueue.push(ANIMATION_ID_OFFSET_SLOW1);
                    this._stateQueue.push((ANIMATION_ID_OFFSET_SLOW2 + k));
                    this._stateQueue.push(k);
                    return;
                }
                super.setAnimation(k);
            }
        }

        override protected function updateAnimation(k:Number):int
        {
            if (super.getLastFramePlayed(0))
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
