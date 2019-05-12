package com.sulake.habbo.room.object.visualization.data
{
    public class AnimationStateData 
    {
        private var _animationId:int = -1;
        private var _animationAfterTransitionId:int = 0;
        private var _animationOver:Boolean = false;
        private var _frameCounter:int = 0;
        private var _frames:Array;
        private var _lastFramePlayed:Array;
        private var _animationPlayed:Array;
        private var _layerCount:int = 0;

        public function AnimationStateData()
        {
            this._frames = [];
            this._lastFramePlayed = [];
            this._animationPlayed = [];
            super();
        }

        public function get _Str_5293():Boolean
        {
            return this._animationOver;
        }

        public function set _Str_5293(k:Boolean):void
        {
            this._animationOver = k;
        }

        public function get _Str_16814():int
        {
            return this._frameCounter;
        }

        public function set _Str_16814(k:int):void
        {
            this._frameCounter = k;
        }

        public function get animationId():int
        {
            return this._animationId;
        }

        public function set animationId(k:int):void
        {
            if (k != this._animationId)
            {
                this._animationId = k;
                this._Str_19535(false);
            }
        }

        public function get _Str_5355():int
        {
            return this._animationAfterTransitionId;
        }

        public function set _Str_5355(k:int):void
        {
            this._animationAfterTransitionId = k;
        }

        public function dispose():void
        {
            this._Str_20421();
            this._frames = null;
            this._lastFramePlayed = null;
            this._animationPlayed = null;
        }

        public function _Str_21182(k:int):void
        {
            this._layerCount = k;
            this._Str_19535();
        }

        public function _Str_19535(k:Boolean=true):void
        {
            var _local_3:AnimationFrame;
            if (((k) || (this._frames == null)))
            {
                this._Str_20421();
                this._frames = [];
            }
            this._lastFramePlayed = [];
            this._animationPlayed = [];
            this._animationOver = false;
            this._frameCounter = 0;
            var _local_2:int;
            while (_local_2 < this._layerCount)
            {
                if (((k) || (this._frames.length <= _local_2)))
                {
                    this._frames[_local_2] = null;
                }
                else
                {
                    _local_3 = this._frames[_local_2];
                    if (_local_3 != null)
                    {
                        _local_3.recycle();
                        this._frames[_local_2] = AnimationFrame._Str_2363(_local_3.id, _local_3.x, _local_3.y, _local_3.repeats, 0, _local_3._Str_20105);
                    }
                }
                this._lastFramePlayed[_local_2] = false;
                this._animationPlayed[_local_2] = false;
                _local_2++;
            }
        }

        private function _Str_20421():void
        {
            var k:AnimationFrame;
            if (this._frames != null)
            {
                for each (k in this._frames)
                {
                    if (k != null)
                    {
                        k.recycle();
                    }
                }
            }
        }

        public function _Str_2259(k:int):AnimationFrame
        {
            if (((k >= 0) && (k < this._layerCount)))
            {
                return this._frames[k];
            }
            return null;
        }

        public function _Str_25614(k:int, _arg_2:AnimationFrame):void
        {
            var _local_3:AnimationFrame;
            if (((k >= 0) && (k < this._layerCount)))
            {
                _local_3 = this._frames[k];
                if (_local_3 != null)
                {
                    _local_3.recycle();
                }
                this._frames[k] = _arg_2;
            }
        }

        public function _Str_22953(k:int):Boolean
        {
            if (((k >= 0) && (k < this._layerCount)))
            {
                return this._animationPlayed[k];
            }
            return true;
        }

        public function _Str_23248(k:int, _arg_2:Boolean):void
        {
            if (((k >= 0) && (k < this._layerCount)))
            {
                this._animationPlayed[k] = _arg_2;
            }
        }

        public function _Str_6660(k:int):Boolean
        {
            if (((k >= 0) && (k < this._layerCount)))
            {
                return this._lastFramePlayed[k];
            }
            return true;
        }

        public function _Str_23406(k:int, _arg_2:Boolean):void
        {
            if (((k >= 0) && (k < this._layerCount)))
            {
                this._lastFramePlayed[k] = _arg_2;
            }
        }
    }
}
