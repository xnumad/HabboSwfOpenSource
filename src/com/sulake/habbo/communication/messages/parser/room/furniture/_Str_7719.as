package com.sulake.habbo.communication.messages.parser.room.furniture
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7719 implements IMessageParser 
    {
        private var _email:String;
        private var _isVerified:Boolean;
        private var _allowChange:Boolean;
        private var _furniId:int;
        private var _Str_10840:Boolean;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._email = k.readString();
            this._isVerified = k.readBoolean();
            this._allowChange = k.readBoolean();
            this._furniId = k.readInteger();
            this._Str_10840 = k.readBoolean();
            return true;
        }

        public function get _Str_10512():Boolean
        {
            return this._Str_10840;
        }

        public function get email():String
        {
            return this._email;
        }

        public function get isVerified():Boolean
        {
            return this._isVerified;
        }

        public function get allowChange():Boolean
        {
            return this._allowChange;
        }

        public function get furniId():int
        {
            return this._furniId;
        }
    }
}
