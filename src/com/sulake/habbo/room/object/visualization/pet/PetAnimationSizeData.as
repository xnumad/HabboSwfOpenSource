package com.sulake.habbo.room.object.visualization.pet
{
    import com.sulake.habbo.room.object.visualization.data.AnimationSizeData;
    import com.sulake.core.utils.Map;
    import com.sulake.room.utils.XMLValidator;
    import com.sulake.habbo.room.object.visualization.data.*;

    public class PetAnimationSizeData extends AnimationSizeData 
    {
        public static const ANIMATION_NOT_DEFINED_ID:int = -1;

        private var _posturesToAnimations:Map;
        private var _gesturesToAnimations:Map;
        private var _defaultPosture:String;

        public function PetAnimationSizeData(k:int, _arg_2:int)
        {
            this._posturesToAnimations = new Map();
            this._gesturesToAnimations = new Map();
            super(k, _arg_2);
        }

        public function definePostures(k:XML):Boolean
        {
            var _local_5:XML;
            var _local_6:String;
            var _local_7:int;
            if (k == null)
            {
                return false;
            }
            if (XMLValidator.checkRequiredAttributes(k, ["defaultPosture"]))
            {
                this._defaultPosture = k.@defaultPosture;
            }
            else
            {
                this._defaultPosture = null;
            }
            var _local_2:Array = ["id", "animationId"];
            var _local_3:XMLList = k.posture;
            var _local_4:int;
            while (_local_4 < _local_3.length())
            {
                _local_5 = _local_3[_local_4];
                if (!XMLValidator.checkRequiredAttributes(_local_5, _local_2))
                {
                    return false;
                }
                _local_6 = String(_local_5.@id);
                _local_7 = int(_local_5.@animationId);
                this._posturesToAnimations.add(_local_6, _local_7);
                if (this._defaultPosture == null)
                {
                    this._defaultPosture = _local_6;
                }
                _local_4++;
            }
            if (this._posturesToAnimations.getValue(this._defaultPosture) == null)
            {
                return false;
            }
            return true;
        }

        public function defineGestures(k:XML):Boolean
        {
            var _local_5:XML;
            var _local_6:String;
            var _local_7:int;
            if (k == null)
            {
                return true;
            }
            var _local_2:Array = ["id", "animationId"];
            var _local_3:XMLList = k.gesture;
            var _local_4:int;
            while (_local_4 < _local_3.length())
            {
                _local_5 = _local_3[_local_4];
                if (!XMLValidator.checkRequiredAttributes(_local_5, _local_2))
                {
                    return false;
                }
                _local_6 = String(_local_5.@id);
                _local_7 = int(_local_5.@animationId);
                this._gesturesToAnimations.add(_local_6, _local_7);
                _local_4++;
            }
            return true;
        }

        public function _Str_17648(k:String):int
        {
            if (this._posturesToAnimations.getValue(k) == null)
            {
                k = this._defaultPosture;
            }
            var _local_2:int = this._posturesToAnimations.getValue(k);
            return _local_2;
        }

        public function _Str_18284(k:String):Boolean
        {
            if (k == "ded")
            {
                return true;
            }
            return false;
        }

        public function _Str_18268(k:String):int
        {
            if (this._gesturesToAnimations.getValue(k) == null)
            {
                return ANIMATION_NOT_DEFINED_ID;
            }
            var _local_2:int = this._gesturesToAnimations.getValue(k);
            return _local_2;
        }

        public function _Str_14207(k:int, _arg_2:Boolean):String
        {
            if (((k >= 0) && (k < this._posturesToAnimations.length)))
            {
                return this._posturesToAnimations.getKey(k);
            }
            return (_arg_2) ? this._defaultPosture : null;
        }

        public function _Str_17844(k:int):String
        {
            if (((k >= 0) && (k < this._gesturesToAnimations.length)))
            {
                return this._gesturesToAnimations.getKey(k);
            }
            return null;
        }

        public function _Str_17976(k:int):String
        {
            var _local_2:String;
            for each (_local_2 in this._gesturesToAnimations.getKeys())
            {
                if (this._gesturesToAnimations.getValue(_local_2) == k)
                {
                    return _local_2;
                }
            }
            return null;
        }

        public function _Str_17398():int
        {
            return this._posturesToAnimations.length;
        }

        public function _Str_16869():int
        {
            return this._gesturesToAnimations.length;
        }
    }
}
