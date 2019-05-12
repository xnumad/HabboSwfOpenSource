package com.sulake.habbo.communication.messages.parser.handshake
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_11396 implements IMessageParser 
    {
        private var _reason:int;

        public function _Str_11396()
        {
            this._reason = -1;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k.bytesAvailable)
            {
                this._reason = k.readInteger();
            }
            return true;
        }

        public function get reason():int
        {
            return this._reason;
        }
    }
}
