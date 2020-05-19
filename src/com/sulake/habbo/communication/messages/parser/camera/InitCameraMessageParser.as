package com.sulake.habbo.communication.messages.parser.camera
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class InitCameraMessageParser implements IMessageParser 
    {
        private var _creditPrice:int = 0;
        private var _ducketPrice:int = 0;
        private var _publishDucketPrice:int = 0;


        public function getCreditPrice():int
        {
            return this._creditPrice;
        }

        public function getDucketPrice():int
        {
            return this._ducketPrice;
        }

        public function getPublishDucketPrice():int
        {
            return this._publishDucketPrice;
        }

        public function flush():Boolean
        {
            this._creditPrice = 0;
            this._ducketPrice = 0;
            this._publishDucketPrice = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._creditPrice = k.readInteger();
            this._ducketPrice = k.readInteger();
            if (k.bytesAvailable > 0)
            {
                this._publishDucketPrice = k.readInteger();
            }
            return true;
        }
    }
}
