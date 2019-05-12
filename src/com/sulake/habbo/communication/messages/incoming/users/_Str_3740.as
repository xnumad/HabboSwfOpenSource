package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_3740 
    {
        private var _id:int;
        private var _fileName:String;
        private var _Str_5291:String;

        public function _Str_3740(k:IMessageDataWrapper=null)
        {
            this._id = k.readInteger();
            this._fileName = k.readString();
            this._Str_5291 = k.readString();
        }

        public function get id():int
        {
            return this._id;
        }

        public function get fileName():String
        {
            return this._fileName;
        }

        public function get _Str_22901():String
        {
            return this._Str_5291;
        }
    }
}
