package com.sulake.habbo.ui.widget.events
{
    public class _Str_3405 
    {
        private var _id:int;
        private var _category:int;
        private var _name:String;

        public function _Str_3405(k:int, _arg_2:int, _arg_3:String)
        {
            this._id = k;
            this._category = _arg_2;
            this._name = _arg_3;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get category():int
        {
            return this._category;
        }

        public function get name():String
        {
            return this._name;
        }
    }
}
