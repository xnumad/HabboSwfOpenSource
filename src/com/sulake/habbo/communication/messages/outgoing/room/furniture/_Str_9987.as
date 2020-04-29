package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_9987 implements IMessageComposer 
    {
        private var messageArray:Array;

        public function _Str_9987(k:int, _arg_2:String)
        {
            this.messageArray = [k, _arg_2];
        }

        public function getMessageArray():Array
        {
            return this.messageArray;
        }

        public function dispose():void
        {
            this.messageArray = null;
        }
    }
}
