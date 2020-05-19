package com.sulake.habbo.communication.messages.parser.camera
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CompetitionStatusMessageParser implements IMessageParser 
    {
        private var _ok:Boolean = false;
        private var _errorReason:String = null;


        public function isOk():Boolean
        {
            return this._ok;
        }

        public function getErrorReason():String
        {
            return this._errorReason;
        }

        public function flush():Boolean
        {
            this._ok = false;
            this._errorReason = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._ok = k.readBoolean();
            this._errorReason = k.readString();
            return true;
        }
    }
}
