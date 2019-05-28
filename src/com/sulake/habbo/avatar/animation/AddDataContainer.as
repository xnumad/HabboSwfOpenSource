package com.sulake.habbo.avatar.animation
{
    public class AddDataContainer 
    {
        private var _id:String;
        private var _align:String;
        private var _base:String;
        private var _ink:String;
        private var _blend:Number = 1;

        public function AddDataContainer(k:XML)
        {
            this._id = String(k.@id);
            this._align = String(k.@align);
            this._base = String(k.@base);
            this._ink = String(k.@ink);
            var _local_2:String = String(k.@blend);
            if (_local_2.length > 0)
            {
                this._blend = Number(_local_2);
                if (this._blend > 1)
                {
                    this._blend = (this._blend / 100);
                }
            }
        }

        public function get id():String
        {
            return this._id;
        }

        public function get align():String
        {
            return this._align;
        }

        public function get base():String
        {
            return this._base;
        }

        public function get ink():String
        {
            return this._ink;
        }

        public function get blend():Number
        {
            return this._blend;
        }

        public function get isBlended():Boolean
        {
            return !(this._blend == 1);
        }
    }
}
