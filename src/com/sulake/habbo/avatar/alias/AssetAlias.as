package com.sulake.habbo.avatar.alias
{
    public class AssetAlias 
    {
        private var _name:String;
        private var _link:String;
        private var _flipH:Boolean;
        private var _flipV:Boolean;

        public function AssetAlias(k:XML)
        {
            this._name = String(k.@name);
            this._link = String(k.@link);
            this._flipH = Boolean(parseInt(k.@fliph));
            this._flipV = Boolean(parseInt(k.@flipv));
        }

        public function get name():String
        {
            return this._name;
        }

        public function get link():String
        {
            return this._link;
        }

        public function get flipH():Boolean
        {
            return this._flipH;
        }

        public function get flipV():Boolean
        {
            return this._flipV;
        }
    }
}
