package com.sulake.habbo.communication.messages.parser.camera
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CameraPublishStatusMessageParser implements IMessageParser 
    {
        private var _ok:Boolean = false;
        private var _secondsToWait:int = 0;
        private var _extraDataId:String;


        public function isOk():Boolean
        {
            return this._ok;
        }

        public function getSecondsToWait():int
        {
            return this._secondsToWait;
        }

        public function getExtraDataId():String
        {
            return this._extraDataId;
        }

        public function flush():Boolean
        {
            this._ok = false;
            this._secondsToWait = 0;
            this._extraDataId = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._ok = k.readBoolean();
            this._secondsToWait = k.readInteger();
            if (((this._ok) && (k.bytesAvailable)))
            {
                this._extraDataId = k.readString();
            }
            return true;
        }
    }
}
