package com.sulake.habbo.room.object.visualization.data
{
    import com.sulake.core.utils.Map;
    import com.sulake.room.utils.XMLValidator;

    public class AnimationData 
    {
        public static const DEFAULT_FRAME_NUMBER:int = 0;
        private static const TRANSITION_TO_ANIMATION_OFFSET:int = 1000000;
        private static const TRANSITION_FROM_ANIMATION_OFFSET:int = 2000000;

        private var _layers:Map = null;
        private var _frameCount:int = -1;
        private var _randomStart:Boolean = false;
        private var _immediateChanges:Array = null;

        public function AnimationData()
        {
            this._layers = new Map();
        }

        public static function getTransitionToAnimationId(k:int):int
        {
            return TRANSITION_TO_ANIMATION_OFFSET + k;
        }

        public static function getTransitionFromAnimationId(k:int):int
        {
            return TRANSITION_FROM_ANIMATION_OFFSET + k;
        }

        public static function isTransitionToAnimation(k:int):Boolean
        {
            return (k >= TRANSITION_TO_ANIMATION_OFFSET) && (k < TRANSITION_FROM_ANIMATION_OFFSET);
        }

        public static function isTransitionFromAnimation(k:int):Boolean
        {
            return k >= TRANSITION_FROM_ANIMATION_OFFSET;
        }


        public function dispose():void
        {
            var k:int;
            var _local_2:AnimationLayerData;
            if (this._layers != null)
            {
                k = 0;
                while (k < this._layers.length)
                {
                    _local_2 = (this._layers.getWithIndex(k) as AnimationLayerData);
                    if (_local_2 != null)
                    {
                        _local_2.dispose();
                    }
                    k++;
                }
                this._layers.dispose();
                this._layers = null;
            }
            this._immediateChanges = null;
        }

        public function setImmediateChanges(k:Array):void
        {
            this._immediateChanges = k;
        }

        public function _Str_12484(k:int):Boolean
        {
            if (((!(this._immediateChanges == null)) && (this._immediateChanges.indexOf(k) >= 0)))
            {
                return true;
            }
            return false;
        }

        public function _Str_9722(k:int):int
        {
            if (!this._randomStart)
            {
                return 0;
            }
            return Math.random() * this._frameCount;
        }

        public function initialize(k:XML):Boolean
        {
            var _local_5:XML;
            var _local_6:int;
            var _local_7:int;
            var _local_8:int;
            var _local_9:Boolean;
            var _local_10:String;
            var _local_11:String;
            this._randomStart = false;
            if (int(k.@randomStart) != 0)
            {
                this._randomStart = true;
            }
            var _local_2:Array = ["id"];
            var _local_3:XMLList = k.animationLayer;
            var _local_4:int;
            while (_local_4 < _local_3.length())
            {
                _local_5 = _local_3[_local_4];
                if (!XMLValidator.checkRequiredAttributes(_local_5, _local_2))
                {
                    return false;
                }
                _local_6 = int(_local_5.@id);
                _local_7 = 1;
                _local_8 = 1;
                _local_9 = false;
                _local_10 = _local_5.@loopCount;
                if (_local_10.length > 0)
                {
                    _local_7 = int(_local_10);
                }
                _local_11 = _local_5.@frameRepeat;
                if (_local_11.length > 0)
                {
                    _local_8 = int(_local_11);
                }
                _local_9 = (!(int(_local_5.@random) == 0));
                if (!this.addLayer(_local_6, _local_7, _local_8, _local_9, _local_5))
                {
                    return false;
                }
                _local_4++;
            }
            return true;
        }

        private function addLayer(k:int, _arg_2:int, _arg_3:int, _arg_4:Boolean, _arg_5:XML):Boolean
        {
            var _local_11:XML;
            var _local_12:int;
            var _local_13:Boolean;
            var _local_14:String;
            var _local_15:AnimationFrameSequenceData;
            var _local_16:XMLList;
            var _local_17:int;
            var _local_18:XML;
            var _local_19:int;
            var _local_20:int;
            var _local_21:int;
            var _local_22:int;
            var _local_23:int;
            var _local_24:DirectionalOffsetData;
            var _local_6:AnimationLayerData = new AnimationLayerData(_arg_2, _arg_3, _arg_4);
            var _local_7:Array = ["id"];
            var _local_8:XMLList = _arg_5.frameSequence;
            var _local_9:int;
            while (_local_9 < _local_8.length())
            {
                _local_11 = _local_8[_local_9];
                _local_12 = 1;
                _local_13 = false;
                _local_14 = _local_11.@loopCount;
                if (_local_14.length > 0)
                {
                    _local_12 = int(_local_14);
                }
                if (int(_local_11.@random) != 0)
                {
                    _local_13 = true;
                }
                _local_15 = _local_6.addFrameSequence(_local_12, _local_13);
                _local_16 = _local_11.frame;
                _local_17 = 0;
                while (_local_17 < _local_16.length())
                {
                    _local_18 = _local_16[_local_17];
                    if (!XMLValidator.checkRequiredAttributes(_local_18, _local_7))
                    {
                        _local_6.dispose();
                        return false;
                    }
                    _local_19 = int(_local_18.@id);
                    _local_20 = int(_local_18.@x);
                    _local_21 = int(_local_18.@y);
                    _local_22 = int(_local_18.@randomX);
                    _local_23 = int(_local_18.@randomY);
                    _local_24 = this.readDirectionalOffsets(_local_18);
                    _local_15.addFrame(_local_19, _local_20, _local_21, _local_22, _local_23, _local_24);
                    _local_17++;
                }
                _local_15.initialize();
                _local_9++;
            }
            _local_6.calculateLength();
            this._layers.add(k, _local_6);
            var _local_10:int = _local_6._Str_2185;
            if (_local_10 > this._frameCount)
            {
                this._frameCount = _local_10;
            }
            return true;
        }

        private function readDirectionalOffsets(k:XML):DirectionalOffsetData
        {
            var _local_4:Array;
            var _local_5:XML;
            var _local_6:XMLList;
            var _local_7:int;
            var _local_8:XML;
            var _local_9:int;
            var _local_10:int;
            var _local_11:int;
            var _local_2:DirectionalOffsetData;
            var _local_3:XMLList = k.offsets;
            if (_local_3.length() > 0)
            {
                _local_4 = ["direction"];
                _local_5 = _local_3[0];
                _local_6 = _local_5.offset;
                _local_7 = 0;
                while (_local_7 < _local_6.length())
                {
                    _local_8 = _local_6[_local_7];
                    if (XMLValidator.checkRequiredAttributes(_local_8, _local_4))
                    {
                        _local_9 = int(_local_8.@direction);
                        _local_10 = int(_local_8.@x);
                        _local_11 = int(_local_8.@y);
                        if (_local_2 == null)
                        {
                            _local_2 = new DirectionalOffsetData();
                        }
                        _local_2.setOffset(_local_9, _local_10, _local_11);
                    }
                    _local_7++;
                }
            }
            return _local_2;
        }

        public function _Str_2259(k:int, _arg_2:int, _arg_3:int):AnimationFrame
        {
            var _local_4:AnimationLayerData = (this._layers.getValue(_arg_2) as AnimationLayerData);
            if (_local_4 != null)
            {
                return _local_4._Str_2259(k, _arg_3);
            }
            return null;
        }

        public function _Str_7945(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int):AnimationFrame
        {
            var _local_6:AnimationLayerData = (this._layers.getValue(_arg_2) as AnimationLayerData);
            if (_local_6 != null)
            {
                return _local_6._Str_7945(k, _arg_3, _arg_4, _arg_5);
            }
            return null;
        }
    }
}
