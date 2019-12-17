package com.sulake.habbo.avatar.structure.animation
{
    import flash.geom.Point;
    import flash.utils.Dictionary;
    import com.sulake.core.utils.Map;

    public class AnimationAction 
    {
        public static const DEFAULT_OFFSET:Point = new Point(0, 0);

        private var _id:String;
        private var _actionParts:Dictionary;
        private var _bodyPartOffsets:Map;
        private var _frameCount:int;
        private var _frameIndexes:Array;

        public function AnimationAction(k:XML)
        {
            var _local_2:XML;
            var _local_3:XML;
            var _local_4:AnimationActionPart;
            var _local_5:int;
            var _local_6:Map;
            var _local_7:XML;
            var _local_8:int;
            var _local_9:int;
            var _local_10:Map;
            var _local_11:XML;
            var _local_12:String;
            var _local_13:int;
            var _local_14:int;
            this._bodyPartOffsets = new Map();
            super();
            this._id = String(k.@id);
            this._actionParts = new Dictionary();
            for each (_local_2 in k.part)
            {
                _local_4 = new AnimationActionPart(_local_2);
                this._actionParts[String(_local_2.@["set-type"])] = _local_4;
                this._frameCount = Math.max(this._frameCount, _local_4.frames.length);
            }
            this._frameIndexes = [];
            for each (_local_3 in k.offsets.frame)
            {
                _local_5 = parseInt(_local_3.@id);
                this._frameCount = Math.max(this._frameCount, _local_5);
                _local_6 = new Map();
                this._bodyPartOffsets[_local_5] = _local_6;
                for each (_local_7 in _local_3.directions.direction)
                {
                    _local_9 = parseInt(_local_7.@id);
                    _local_10 = new Map();
                    _local_6[_local_9] = _local_10;
                    for each (_local_11 in _local_7.bodypart)
                    {
                        _local_12 = String(_local_11.@id);
                        _local_13 = ((_local_11.hasOwnProperty("@dx")) ? parseInt(_local_11.@dx) : 0);
                        _local_14 = ((_local_11.hasOwnProperty("@dy")) ? parseInt(_local_11.@dy) : 0);
                        _local_10[_local_12] = new Point(_local_13, _local_14);
                    }
                }
                this._frameIndexes.push(_local_5);
                _local_8 = parseInt(_local_3.@repeats);
                if (_local_8 > 1)
                {
                    while (--_local_8 > 0)
                    {
                        this._frameIndexes.push(_local_5);
                    }
                }
            }
        }

        public function getPart(k:String):AnimationActionPart
        {
            return this._actionParts[k] as AnimationActionPart;
        }

        public function get id():String
        {
            return this._id;
        }

        public function get parts():Dictionary
        {
            return this._actionParts;
        }

        public function get _Str_2185():int
        {
            return this._frameCount;
        }

        public function _Str_1888(k:int, _arg_2:int, _arg_3:String):Point
        {
            var _local_7:Point;
            var _local_8:Map;
            var _local_4:int = (_arg_2 % this._frameIndexes.length);
            var _local_5:int = this._frameIndexes[_local_4];
            var _local_6:Map = this._bodyPartOffsets[_local_5];
            if (_local_6)
            {
                _local_8 = _local_6[k];
                if (_local_8)
                {
                    _local_7 = _local_8[_arg_3];
                }
            }
            return (_local_7 != null) ? _local_7 : DEFAULT_OFFSET;
        }
    }
}
