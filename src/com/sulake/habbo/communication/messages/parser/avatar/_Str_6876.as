package com.sulake.habbo.communication.messages.parser.avatar
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6876 implements IMessageParser 
    {
        private var _figure:String;
        private var _gender:String;


        public function get figure():String
        {
            return this._figure;
        }

        public function get gender():String
        {
            return this._gender;
        }

        public function flush():Boolean
        {
            this._figure = "";
            this._gender = "";
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._figure = k.readString();
            this._gender = k.readString();
            if (this._gender)
            {
                this._gender = this._gender.toUpperCase();
            }
            return true;
        }
    }
}
