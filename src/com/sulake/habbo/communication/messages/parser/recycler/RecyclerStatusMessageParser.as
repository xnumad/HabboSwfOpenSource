package com.sulake.habbo.communication.messages.parser.recycler
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RecyclerStatusMessageParser implements IMessageParser 
    {
        private var _recyclerStatus:int = -1;
        private var _recyclerTimeoutSeconds:int = 0;


        public function get recyclerStatus():int
        {
            return this._recyclerStatus;
        }

        public function get recyclerTimeoutSeconds():int
        {
            return this._recyclerTimeoutSeconds;
        }

        public function flush():Boolean
        {
            this._recyclerStatus = -1;
            this._recyclerTimeoutSeconds = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._recyclerStatus = k.readInteger();
            this._recyclerTimeoutSeconds = k.readInteger();
            return true;
        }
    }
}
