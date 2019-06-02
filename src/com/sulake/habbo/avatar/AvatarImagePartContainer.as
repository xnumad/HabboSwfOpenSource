package com.sulake.habbo.avatar
{
    import com.sulake.habbo.avatar.structure.figure.IPartColor;
    import com.sulake.habbo.avatar.actions.IActionDefinition;
    import flash.geom.ColorTransform;
    import com.sulake.habbo.avatar.structure.animation.AnimationFrame;

    public class AvatarImagePartContainer 
    {
        private var _bodyPartId:String;
        private var _partType:String;
        private var _flippedPartType:String;
        private var _partId:String;
        private var _color:IPartColor;
        private var _frames:Array;
        private var _action:IActionDefinition;
        private var _isColorable:Boolean;
        private var _isBlendable:Boolean;
        private var _blendTransform:ColorTransform;
        private var _paletteMapId:int;

        public function AvatarImagePartContainer(k:String, _arg_2:String, _arg_3:String, _arg_4:IPartColor, _arg_5:Array, _arg_6:IActionDefinition, _arg_7:Boolean, _arg_8:int, _arg_9:String="", _arg_10:Boolean=false, _arg_11:Number=1)
        {
            this._bodyPartId = k;
            this._partType = _arg_2;
            this._partId = _arg_3;
            this._color = _arg_4;
            this._frames = _arg_5;
            this._action = _arg_6;
            this._isColorable = _arg_7;
            this._paletteMapId = _arg_8;
            this._flippedPartType = _arg_9;
            this._isBlendable = _arg_10;
            this._blendTransform = new ColorTransform(1, 1, 1, _arg_11);
            if (this._frames == null)
            {
                Logger.log("Null frame list");
            }
            if (this._partType == "ey")
            {
                this._isColorable = false;
            }
        }

        public function _Str_1674(k:int):int
        {
            var _local_3:AnimationFrame;
            if (((!(this._frames)) || (this._frames.length == 0)))
            {
                return 0;
            }
            var _local_2:int = (k % this._frames.length);
            if ((this._frames[_local_2] is AnimationFrame))
            {
                _local_3 = this._frames[_local_2];
                return _local_3.number;
            }
            return _local_2;
        }

        public function getAnimationFrame(k:int):AnimationFrame
        {
            var _local_2:int = (k % this._frames.length);
            if (((this._frames) && (this._frames.length > _local_2)))
            {
                if ((this._frames[_local_2] is AnimationFrame))
                {
                    return this._frames[_local_2] as AnimationFrame;
                }
            }
            return null;
        }

        public function getCacheableKey(k:int):String
        {
            var _local_3:AnimationFrame;
            var _local_2:int = (k % this._frames.length);
            if (((this._frames) && (this._frames.length > _local_2)))
            {
                if ((this._frames[_local_2] is AnimationFrame))
                {
                    _local_3 = (this._frames[_local_2] as AnimationFrame);
                    return (((this._Str_1502 + ":") + _local_3.assetPartDefinition) + ":") + _local_3.number;
                }
            }
            return (this._Str_1502 + ":") + _local_2;
        }

        public function get bodyPartId():String
        {
            return this._bodyPartId;
        }

        public function get partType():String
        {
            return this._partType;
        }

        public function get _Str_1502():String
        {
            return this._partId;
        }

        public function get color():IPartColor
        {
            return this._color;
        }

        public function get action():IActionDefinition
        {
            return this._action;
        }

        public function set isColorable(k:Boolean):void
        {
            this._isColorable = k;
        }

        public function get isColorable():Boolean
        {
            return this._isColorable;
        }

        public function get paletteMapId():int
        {
            return this._paletteMapId;
        }

        public function get flippedPartType():String
        {
            return this._flippedPartType;
        }

        public function get isBlendable():Boolean
        {
            return this._isBlendable;
        }

        public function get blendTransform():ColorTransform
        {
            return this._blendTransform;
        }

        public function toString():String
        {
            return [this._bodyPartId, this._partType, this._partId].join(":");
        }
    }
}
