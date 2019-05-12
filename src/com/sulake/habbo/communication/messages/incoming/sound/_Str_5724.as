package com.sulake.habbo.communication.messages.incoming.sound
{
    public class _Str_5724 extends SongEntry 
    {
        private var _data:String = "";

        public function _Str_5724(k:int, _arg_2:int, _arg_3:String, _arg_4:String, _arg_5:String)
        {
            super(k, _arg_2, _arg_3, _arg_4);
            this._data = _arg_5;
        }

        public function get data():String
        {
            return this._data;
        }
    }
}
