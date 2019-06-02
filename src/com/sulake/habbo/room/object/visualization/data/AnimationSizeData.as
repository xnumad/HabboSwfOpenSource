package com.sulake.habbo.room.object.visualization.data
{
    import com.sulake.core.utils.Map;
    import com.sulake.room.utils.XMLValidator;

    public class AnimationSizeData extends SizeData 
    {
        private var _animations:Map = null;
        private var _animationIds:Array;

        public function AnimationSizeData(k:int, _arg_2:int)
        {
            this._animationIds = [];
            super(k, _arg_2);
            this._animations = new Map();
        }

        override public function dispose():void
        {
            var k:int;
            var _local_2:AnimationData;
            super.dispose();
            if (this._animations != null)
            {
                k = 0;
                while (k < this._animations.length)
                {
                    _local_2 = (this._animations.getWithIndex(k) as AnimationData);
                    if (_local_2 != null)
                    {
                        _local_2.dispose();
                    }
                    k++;
                }
                this._animations.dispose();
                this._animations = null;
            }
        }

        public function defineAnimations(k:XML):Boolean
        {
            var _local_5:XML;
            var _local_6:int;
            var _local_7:Boolean;
            var _local_8:String;
            var _local_9:AnimationData;
            var _local_10:int;
            var _local_11:int;
            var _local_12:Array;
            var _local_13:Array;
            var _local_14:String;
            var _local_15:int;
            if (k == null)
            {
                return true;
            }
            var _local_2:Array = ["id"];
            var _local_3:XMLList = k.animation;
            var _local_4:int;
            while (_local_4 < _local_3.length())
            {
                _local_5 = _local_3[_local_4];
                if (!XMLValidator.checkRequiredAttributes(_local_5, _local_2))
                {
                    return false;
                }
                _local_6 = int(_local_5.@id);
                _local_7 = false;
                _local_8 = _local_5.@transitionTo;
                if (_local_8.length > 0)
                {
                    _local_10 = int(_local_8);
                    _local_6 = AnimationData.getTransitionToAnimationId(_local_10);
                    _local_7 = true;
                }
                _local_8 = _local_5.@transitionFrom;
                if (_local_8.length > 0)
                {
                    _local_11 = int(_local_8);
                    _local_6 = AnimationData.getTransitionFromAnimationId(_local_11);
                    _local_7 = true;
                }
                _local_9 = this.createAnimationData();
                if (!_local_9.initialize(_local_5))
                {
                    _local_9.dispose();
                    return false;
                }
                _local_8 = _local_5.@immediateChangeFrom;
                if (_local_8.length > 0)
                {
                    _local_12 = _local_8.split(",");
                    _local_13 = [];
                    for each (_local_14 in _local_12)
                    {
                        _local_15 = int(_local_14);
                        if (_local_13.indexOf(_local_15) < 0)
                        {
                            _local_13.push(_local_15);
                        }
                    }
                    _local_9.setImmediateChanges(_local_13);
                }
                this._animations.add(_local_6, _local_9);
                if (!_local_7)
                {
                    this._animationIds.push(_local_6);
                }
                _local_4++;
            }
            return true;
        }

        protected function createAnimationData():AnimationData
        {
            return new AnimationData();
        }

        public function _Str_6839(k:int):Boolean
        {
            if (this._animations.getValue(k) != null)
            {
                return true;
            }
            return false;
        }

        public function _Str_17743():int
        {
            return this._animationIds.length;
        }

        public function getAnimationId(k:int):int
        {
            var _local_2:int = this._Str_17743();
            if (((k >= 0) && (_local_2 > 0)))
            {
                return this._animationIds[(k % _local_2)];
            }
            return 0;
        }

        public function _Str_12484(k:int, _arg_2:int):Boolean
        {
            var _local_3:AnimationData = (this._animations.getValue(k) as AnimationData);
            if (_local_3 != null)
            {
                return _local_3._Str_12484(_arg_2);
            }
            return false;
        }

        public function _Str_9722(k:int, _arg_2:int):int
        {
            var _local_3:AnimationData = (this._animations.getValue(k) as AnimationData);
            if (_local_3 != null)
            {
                return _local_3._Str_9722(_arg_2);
            }
            return 0;
        }

        public function _Str_2259(k:int, _arg_2:int, _arg_3:int, _arg_4:int):AnimationFrame
        {
            var _local_6:AnimationFrame;
            var _local_5:AnimationData = (this._animations.getValue(k) as AnimationData);
            if (_local_5 != null)
            {
                _local_6 = _local_5._Str_2259(_arg_2, _arg_3, _arg_4);
                return _local_6;
            }
            return null;
        }

        public function _Str_7945(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:int):AnimationFrame
        {
            var _local_8:AnimationFrame;
            var _local_7:AnimationData = (this._animations.getValue(k) as AnimationData);
            if (_local_7 != null)
            {
                _local_8 = _local_7._Str_7945(_arg_2, _arg_3, _arg_4, _arg_5, _arg_6);
                return _local_8;
            }
            return null;
        }
    }
}
