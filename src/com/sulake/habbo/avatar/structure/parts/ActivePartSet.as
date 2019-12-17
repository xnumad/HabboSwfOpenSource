package com.sulake.habbo.avatar.structure.parts
{
    public class ActivePartSet 
    {
        private var _id:String;
        private var _parts:Array;

        public function ActivePartSet(k:XML)
        {
            var _local_2:XML;
            super();
            this._id = String(k.@id);
            this._parts = new Array();
            for each (_local_2 in k.activePart)
            {
                this._parts.push(String(_local_2.@["set-type"]));
            }
        }

        public function get parts():Array
        {
            return this._parts;
        }
    }
}
