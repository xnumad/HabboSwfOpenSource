package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CallForHelpPendingCallsMessageParser implements IMessageParser 
    {
        private var _callArray:Array;

        public function CallForHelpPendingCallsMessageParser()
        {
            this._callArray = new Array();
            super();
        }

        public function get pendingCalls():Array
        {
            return this._callArray;
        }

        public function get count():int
        {
            return this._callArray.length;
        }

        public function flush():Boolean
        {
            this._callArray = new Array();
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_4:Object;
            this._callArray = new Array();
            var _local_2:int = k.readInteger();
            while (_local_3 < _local_2)
            {
                _local_4 = new Object();
                _local_4.callId = k.readString();
                _local_4.timeStamp = k.readString();
                _local_4.message = k.readString();
                this._callArray.push(_local_4);
                _local_3++;
            }
            return true;
        }
    }
}
