package com.sulake.habbo.communication.messages.parser.room.furniture
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class OpenPetPackageResultMessageParser implements IMessageParser
    {
        private var _objectId:int = 0;
        private var _nameValidationStatus:int = 0;
        private var _nameValidationInfo:String = null;


        public function get objectId():int
        {
            return this._objectId;
        }

        public function get nameValidationStatus():int
        {
            return this._nameValidationStatus;
        }

        public function get nameValidationInfo():String
        {
            return this._nameValidationInfo;
        }

        public function flush():Boolean
        {
            this._objectId = 0;
            this._nameValidationStatus = 0;
            this._nameValidationInfo = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k == null)
            {
                return false;
            }
            this._objectId = k.readInteger();
            this._nameValidationStatus = k.readInteger();
            this._nameValidationInfo = k.readString();
            return true;
        }
    }
}
