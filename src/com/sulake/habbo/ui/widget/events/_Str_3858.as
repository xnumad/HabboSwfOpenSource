package com.sulake.habbo.ui.widget.events
{
    public class _Str_3858 
    {
        private var _id:int;
        private var _category:int;
        private var _name:String;
        private var _Str_3748:int;
        private var _Str_4105:int;
        private var _Str_21788:int;
        private var _replace:Boolean;

        public function _Str_3858(k:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:int, _arg_6:int=-1, _arg_7:Boolean=false)
        {
            this._id = k;
            this._category = _arg_2;
            this._name = _arg_3;
            this._Str_3748 = _arg_4;
            this._Str_4105 = _arg_5;
            this._Str_21788 = _arg_6;
            this._replace = _arg_7;
        }

        public function dispose():void
        {
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

        public function get _Str_3710():int
        {
            return this._Str_3748;
        }

        public function get _Str_5563():int
        {
            return this._Str_4105;
        }

        public function get _Str_24139():int
        {
            return this._Str_21788;
        }

        public function get replace():Boolean
        {
            return this._replace;
        }
    }
}
