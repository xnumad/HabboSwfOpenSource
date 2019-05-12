package com.sulake.habbo.communication.messages.outgoing.tracking
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class LatencyPingRequestMessageComposer implements IMessageComposer 
    {
        private var _id:int = 0;

        public function LatencyPingRequestMessageComposer(k:int)
        {
            this._id = k;
        }

        public function getMessageArray():Array
        {
            return [this._id];
        }

        public function dispose():void
        {
        }
    }
}
