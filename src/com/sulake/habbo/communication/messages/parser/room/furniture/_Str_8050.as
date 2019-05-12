package com.sulake.habbo.communication.messages.parser.room.furniture
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8050 implements IMessageParser 
    {
        private var _Str_2319:int = 0;
        private var _nameValidationStatus:int = 0;
        private var _nameValidationInfo:String = null;


        public function get _Str_1577():int
        {
            return this._Str_2319;
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
            this._Str_2319 = 0;
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
            this._Str_2319 = k.readInteger();
            this._nameValidationStatus = k.readInteger();
            this._nameValidationInfo = k.readString();
            return true;
        }
    }
}
