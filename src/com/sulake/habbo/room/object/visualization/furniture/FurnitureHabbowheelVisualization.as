package com.sulake.habbo.room.object.visualization.furniture
{
    public class FurnitureHabbowheelVisualization extends FurnitureAnimatedVisualization 
    {
        private static const ANIMATION_ID_OFFSET_SLOW1:int = 10;
        private static const ANIMATION_ID_OFFSET_SLOW2:int = 20;
        private static const _Str_7627:int = 31;
        private static const _Str_4186:int = 32;

        private var _Str_2749:Array;
        private var _Str_635:Boolean = false;

        public function FurnitureHabbowheelVisualization()
        {
            this._Str_2749 = new Array();
            super();
        }

        override protected function setAnimation(k:int):void
        {
            if (k == -1)
            {
                if (!this._Str_635)
                {
                    this._Str_635 = true;
                    this._Str_2749 = new Array();
                    this._Str_2749.push(_Str_7627);
                    this._Str_2749.push(_Str_4186);
                    return;
                }
            }
            if (((k > 0) && (k <= ANIMATION_ID_OFFSET_SLOW1)))
            {
                if (this._Str_635)
                {
                    this._Str_635 = false;
                    this._Str_2749 = new Array();
                    this._Str_2749.push((ANIMATION_ID_OFFSET_SLOW1 + k));
                    this._Str_2749.push((ANIMATION_ID_OFFSET_SLOW2 + k));
                    this._Str_2749.push(k);
                    return;
                }
                super.setAnimation(k);
            }
        }

        override protected function updateAnimation(k:Number):int
        {
            if ((((super._Str_6660(1)) && (super._Str_6660(2))) && (super._Str_6660(3))))
            {
                if (this._Str_2749.length > 0)
                {
                    super.setAnimation(this._Str_2749.shift());
                }
            }
            return super.updateAnimation(k);
        }
    }
}
