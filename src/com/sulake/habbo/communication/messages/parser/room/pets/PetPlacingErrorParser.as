package com.sulake.habbo.communication.messages.parser.room.pets
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PetPlacingErrorParser implements IMessageParser 
    {
        private var _errorCode:int;


        public function get errorCode():int
        {
            return this._errorCode;
        }

        public function flush():Boolean
        {
            this._errorCode = -1;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k == null)
            {
                return false;
            }
            this._errorCode = k.readInteger();
            return true;
        }
    }
}
