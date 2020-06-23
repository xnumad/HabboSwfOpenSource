package com.sulake.habbo.communication.messages.outgoing.handshake
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import flash.utils.getTimer;

    public class SSOTicketMessageComposer implements IMessageComposer
    {
        private var _message:Array;

        public function SSOTicketMessageComposer(k:String)
        {
            this._message = new Array();
            this._message.push(k);
            this._message.push(getTimer());
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return this._message;
        }
    }
}
