package com.sulake.habbo.communication.messages.parser.camera
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8676 implements IMessageParser 
    {
        private var _ok:Boolean = false;
        private var _secondsToWait:int = 0;
        private var _Str_9712:String;


        public function isOk():Boolean
        {
            return this._ok;
        }

        public function _Str_25098():int
        {
            return this._secondsToWait;
        }

        public function _Str_24023():String
        {
            return this._Str_9712;
        }

        public function flush():Boolean
        {
            this._ok = false;
            this._secondsToWait = 0;
            this._Str_9712 = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._ok = k.readBoolean();
            this._secondsToWait = k.readInteger();
            if (((this._ok) && (k.bytesAvailable)))
            {
                this._Str_9712 = k.readString();
            }
            return true;
        }
    }
}
