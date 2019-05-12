package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_5856 implements IMessageParser 
    {
        private var _Str_7992:int;
        private var _id:int;
        private var _Str_6487:String;


        public function get _Str_5277():int
        {
            return this._Str_7992;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get _Str_16428():String
        {
            return this._Str_6487;
        }

        public function flush():Boolean
        {
            this._Str_7992 = -1;
            this._id = -1;
            this._Str_6487 = "";
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_7992 = k.readInteger();
            this._id = k.readInteger();
            this._Str_6487 = k.readString();
            return true;
        }
    }
}
