package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class EmailStatusParser implements IMessageParser
    {
        private var _email:String;
        private var _isVerified:Boolean;
        private var _allowChange:Boolean;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._email = k.readString();
            this._isVerified = k.readBoolean();
            this._allowChange = k.readBoolean();
            return true;
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
    }
}
