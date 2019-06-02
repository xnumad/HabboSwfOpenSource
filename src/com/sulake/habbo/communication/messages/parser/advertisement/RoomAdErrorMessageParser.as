package com.sulake.habbo.communication.messages.parser.advertisement
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RoomAdErrorMessageParser implements IMessageParser 
    {
        private var _errorCode:int = 0;
        private var _filteredText:String;


        public function get errorCode():int
        {
            return this._errorCode;
        }

        public function get filteredText():String
        {
            return this._filteredText;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._errorCode = k.readInteger();
            this._filteredText = k.readString();
            return true;
        }
    }
}
