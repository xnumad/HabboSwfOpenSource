package com.sulake.habbo.communication.messages.parser.inventory.bots
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_3013 
    {
        private var _id:int;
        private var _name:String;
        private var _motto:String;
        private var _gender:String;
        private var _figure:String;

        public function _Str_3013(k:IMessageDataWrapper)
        {
            this._id = k.readInteger();
            this._name = k.readString();
            this._motto = k.readString();
            this._gender = k.readString();
            this._figure = k.readString();
        }

        public function get id():int
        {
            return this._id;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get motto():String
        {
            return this._motto;
        }

        public function get figure():String
        {
            return this._figure;
        }

        public function get gender():String
        {
            return this._gender;
        }
    }
}
