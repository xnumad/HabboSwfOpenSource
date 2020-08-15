package com.sulake.habbo.communication.messages.incoming.inventory.avatareffect
{
    public class AvatarEffect
    {
        private var _type:int;
        private var _subType:int;
        private var _duration:int;
        private var _Str_20427:int;
        private var _Str_22152:int;
        private var _Str_5145:Boolean;


        public function get type():int
        {
            return this._type;
        }

        public function set type(k:int):void
        {
            this._type = k;
        }

        public function get subType():int
        {
            return this._subType;
        }

        public function set subType(k:int):void
        {
            this._subType = k;
        }

        public function get duration():int
        {
            return this._duration;
        }

        public function set duration(k:int):void
        {
            this._duration = k;
        }

        public function get _Str_18572():int
        {
            return this._Str_20427;
        }

        public function set _Str_18572(k:int):void
        {
            this._Str_20427 = k;
        }

        public function get _Str_12185():int
        {
            return this._Str_22152;
        }

        public function set _Str_12185(k:int):void
        {
            this._Str_22152 = k;
        }

        public function get _Str_4010():Boolean
        {
            return this._Str_5145;
        }

        public function set _Str_4010(k:Boolean):void
        {
            this._Str_5145 = k;
        }
    }
}
