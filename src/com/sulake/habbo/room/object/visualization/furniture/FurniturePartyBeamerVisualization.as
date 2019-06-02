package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.room.object.visualization.IRoomObjectSprite;
    import flash.geom.Point;

    public class FurniturePartyBeamerVisualization extends FurnitureAnimatedVisualization 
    {
        private static const UPDATE_INTERVAL:int = 2;
        private static const AREA_DIAMETER_SMALL:int = 15;
        private static const AREA_DIAMETER_LARGE:int = 31;
        private static const ANIM_SPEED_FAST:int = 2;
        private static const ANIM_SPEED_SLOW:int = 1;

        private var _animPhaseIndex:Array;
        private var _animDirectionIndex:Array;
        private var _animSpeedIndex:Array;
        private var _animFactorIndex:Array;
        private var _animOffsetIndex:Array;

        public function FurniturePartyBeamerVisualization()
        {
            this._animOffsetIndex = new Array();
            super();
        }

        override protected function updateAnimation(k:Number):int
        {
            var _local_2:IRoomObjectSprite;
            var _local_3:Point;
            if (this._animSpeedIndex == null)
            {
                this.initItems(k);
            }
            _local_2 = getSprite(2);
            if (_local_2 != null)
            {
                this._animOffsetIndex[0] = this.getNewPoint(k, 0);
            }
            _local_2 = getSprite(3);
            if (_local_2 != null)
            {
                this._animOffsetIndex[1] = this.getNewPoint(k, 1);
            }
            return super.updateAnimation(k);
        }

        override protected function getSpriteXOffset(k:int, _arg_2:int, _arg_3:int):int
        {
            if (((_arg_3 == 2) || (_arg_3 == 3)))
            {
                if (this._animOffsetIndex.length == 2)
                {
                    return this._animOffsetIndex[(_arg_3 - 2)].x;
                }
            }
            return super.getSpriteXOffset(k, _arg_2, _arg_3);
        }

        override protected function getSpriteYOffset(k:int, _arg_2:int, _arg_3:int):int
        {
            if (((_arg_3 == 2) || (_arg_3 == 3)))
            {
                if (this._animOffsetIndex.length == 2)
                {
                    return this._animOffsetIndex[(_arg_3 - 2)].y;
                }
            }
            return super.getSpriteYOffset(k, _arg_2, _arg_3);
        }

        private function getNewPoint(k:Number, _arg_2:int):Point
        {
            var _local_8:int;
            var _local_3:Number = this._animPhaseIndex[_arg_2];
            var _local_4:int = this._animDirectionIndex[_arg_2];
            var _local_5:int = this._animSpeedIndex[_arg_2];
            var _local_6:Number = this._animFactorIndex[_arg_2];
            var _local_7:Number = 1;
            if (k == 32)
            {
                _local_8 = AREA_DIAMETER_SMALL;
                _local_7 = 0.5;
            }
            else
            {
                _local_8 = AREA_DIAMETER_LARGE;
            }
            var _local_9:Number = (_local_3 + (_local_4 * _local_5));
            if (Math.abs(_local_9) >= _local_8)
            {
                if (_local_4 > 0)
                {
                    _local_3 = (_local_3 - (_local_9 - _local_8));
                }
                else
                {
                    _local_3 = (_local_3 + (-(_local_8) - _local_9));
                }
                _local_4 = -(_local_4);
                this._animDirectionIndex[_arg_2] = _local_4;
            }
            var _local_10:Number = ((_local_8 - Math.abs(_local_3)) * _local_6);
            var _local_11:Number = ((_local_4 * Math.sin(Math.abs((_local_3 / 4)))) * _local_10);
            if (_local_4 > 0)
            {
                _local_11 = (_local_11 - _local_10);
            }
            else
            {
                _local_11 = (_local_11 + _local_10);
            }
            _local_3 = (_local_3 + ((_local_4 * _local_5) * _local_7));
            this._animPhaseIndex[_arg_2] = _local_3;
            if (int(_local_11) == 0)
            {
                this._animFactorIndex[_arg_2] = this.getRandomAmplitudeFactor();
            }
            return new Point(_local_3, _local_11);
        }

        private function initItems(k:Number):void
        {
            var _local_2:int;
            if (k == 32)
            {
                _local_2 = AREA_DIAMETER_SMALL;
            }
            else
            {
                _local_2 = AREA_DIAMETER_LARGE;
            }
            this._animPhaseIndex = new Array();
            this._animPhaseIndex.push(((Math.random() * _local_2) * 1.5));
            this._animPhaseIndex.push(((Math.random() * _local_2) * 1.5));
            this._animDirectionIndex = new Array();
            this._animDirectionIndex.push(1);
            this._animDirectionIndex.push(-1);
            this._animSpeedIndex = new Array();
            this._animSpeedIndex.push(ANIM_SPEED_FAST);
            this._animSpeedIndex.push(ANIM_SPEED_SLOW);
            this._animFactorIndex = new Array();
            this._animFactorIndex.push(this.getRandomAmplitudeFactor());
            this._animFactorIndex.push(this.getRandomAmplitudeFactor());
        }

        private function getRandomAmplitudeFactor():Number
        {
            return ((Math.random() * 30) / 100) + 0.15;
        }
    }
}
