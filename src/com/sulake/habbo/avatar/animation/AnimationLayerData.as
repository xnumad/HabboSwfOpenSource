package com.sulake.habbo.avatar.animation
{
    import com.sulake.habbo.avatar.actions.IActiveActionData;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.avatar.actions.ActiveActionData;
    import com.sulake.habbo.avatar.actions.IActionDefinition;

    public class AnimationLayerData implements IAnimationLayerData 
    {
        public static const BODYPART:String = "bodypart";
        public static const FX:String = "fx";

        private var _id:String;
        private var _action:IActiveActionData;
        private var _animationFrame:int;
        private var _dx:int;
        private var _dy:int;
        private var _dz:int;
        private var _directionOffset:int;
        private var _type:String;
        private var _base:String;
        private var _items:Map;

        public function AnimationLayerData(k:XML, _arg_2:String, _arg_3:IActionDefinition)
        {
            var _local_4:XML;
            var _local_5:String;
            this._items = new Map();
            super();
            this._id = String(k.@id);
            this._animationFrame = parseInt(k.@frame);
            this._dx = parseInt(k.@dx);
            this._dy = parseInt(k.@dy);
            this._dz = parseInt(k.@dz);
            this._directionOffset = parseInt(k.@dd);
            this._type = _arg_2;
            this._base = String(k.@base);
            for each (_local_4 in k.item)
            {
                this._items[String(_local_4.@id)] = String(_local_4.@base);
            }
            _local_5 = "";
            if (this._base != "")
            {
                _local_5 = String(this._Str_2108());
            }
            if (_arg_3 != null)
            {
                this._action = new ActiveActionData(_arg_3.state, this.base);
                this._action.definition = _arg_3;
            }
        }

        public function get items():Map
        {
            return this._items;
        }

        private function _Str_2108():int
        {
            var k:int;
            var _local_2:int;
            while (_local_2 < this._base.length)
            {
                k = (k + this._base.charCodeAt(_local_2));
                _local_2++;
            }
            return k;
        }

        public function get id():String
        {
            return this._id;
        }

        public function get animationFrame():int
        {
            return this._animationFrame;
        }

        public function get dx():int
        {
            return this._dx;
        }

        public function get dy():int
        {
            return this._dy;
        }

        public function get dz():int
        {
            return this._dz;
        }

        public function get dd():int
        {
            return this._directionOffset;
        }

        public function get type():String
        {
            return this._type;
        }

        public function get base():String
        {
            return this._base;
        }

        public function get action():IActiveActionData
        {
            return this._action;
        }
    }
}
