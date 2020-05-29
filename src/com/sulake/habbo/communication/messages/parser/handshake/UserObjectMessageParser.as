package com.sulake.habbo.communication.messages.parser.handshake
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class UserObjectMessageParser implements IMessageParser
    {
        private var _id:int;
        private var _name:String;
        private var _figure:String;
        private var _sex:String;
        private var _customData:String;
        private var _realName:String;
        private var _directMail:Boolean;
        private var _respectTotal:int;
        private var _respectLeft:int;
        private var _petRespectLeft:int;
        private var _streamPublishingAllowed:Boolean;
        private var _lastAccessDate:String;
        private var _nameChangeAllowed:Boolean;
        private var _accountSafetyLocked:Boolean = false;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._id = k.readInteger();
            this._name = k.readString();
            this._figure = k.readString();
            this._sex = k.readString();
            this._customData = k.readString();
            this._realName = k.readString();
            this._directMail = k.readBoolean();
            this._respectTotal = k.readInteger();
            this._respectLeft = k.readInteger();
            this._petRespectLeft = k.readInteger();
            this._streamPublishingAllowed = k.readBoolean();
            this._lastAccessDate = k.readString();
            this._nameChangeAllowed = k.readBoolean();
            this._accountSafetyLocked = k.readBoolean();
            return true;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get figure():String
        {
            return this._figure;
        }

        public function get sex():String
        {
            return this._sex;
        }

        public function get _Str_3073():String
        {
            return this._customData;
        }

        public function get realName():String
        {
            return this._realName;
        }

        public function get directMail():Boolean
        {
            return this._directMail;
        }

        public function get respectTotal():int
        {
            return this._respectTotal;
        }

        public function get respectLeft():int
        {
            return this._respectLeft;
        }

        public function get petRespectLeft():int
        {
            return this._petRespectLeft;
        }

        public function get streamPublishingAllowed():Boolean
        {
            return this._streamPublishingAllowed;
        }

        public function get lastAccessDate():String
        {
            return this._lastAccessDate;
        }

        public function get nameChangeAllowed():Boolean
        {
            return this._nameChangeAllowed;
        }

        public function get accountSafetyLocked():Boolean
        {
            return this._accountSafetyLocked;
        }
    }
}
