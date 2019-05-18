package com.sulake.habbo.navigator.domain
{
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_8348;

    public class RoomSessionTags 
    {
        private var _tag1:String;
        private var _tag2:String;

        public function RoomSessionTags(k:String, _arg_2:String)
        {
            this._tag1 = k;
            this._tag2 = _arg_2;
        }

        public function _Str_23991():_Str_8348
        {
            return new _Str_8348(this._tag1, this._tag2);
        }
    }
}
