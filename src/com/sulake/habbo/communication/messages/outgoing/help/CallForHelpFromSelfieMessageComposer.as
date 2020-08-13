package com.sulake.habbo.communication.messages.outgoing.help
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class CallForHelpFromSelfieMessageComposer implements IMessageComposer, IDisposable
    {
        private var messageArray:Array;

        public function CallForHelpFromSelfieMessageComposer(k:String, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:int)
        {
            this.messageArray = new Array();
            super();
            this.messageArray = [k, _arg_2, _arg_3, _arg_4, _arg_5];
        }

        public function getMessageArray():Array
        {
            return this.messageArray;
        }

        public function dispose():void
        {
            this.messageArray = null;
        }

        public function get disposed():Boolean
        {
            return false;
        }
    }
}
