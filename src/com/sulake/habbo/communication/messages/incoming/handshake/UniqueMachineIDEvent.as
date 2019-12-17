package com.sulake.habbo.communication.messages.incoming.handshake
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.handshake._Str_8786;

    public class UniqueMachineIDEvent extends MessageEvent implements IMessageEvent 
    {
        public function UniqueMachineIDEvent(k:Function)
        {
            super(k, _Str_8786);
        }

        private function getParser():_Str_8786
        {
            return this._parser as _Str_8786;
        }

        public function get machineID():String
        {
            return this.getParser().machineID;
        }
    }
}
