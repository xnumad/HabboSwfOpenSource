package com.sulake.habbo.communication.messages.outgoing.help
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class CallForHelpFromIMMessageComposer implements IMessageComposer, IDisposable
    {
        private var messageArray:Array;

        public function CallForHelpFromIMMessageComposer(k:String, _arg_2:int, _arg_3:int, _arg_4:Array)
        {
            this.messageArray = new Array();
            super();
            this.messageArray.push(k);
            this.messageArray.push(_arg_2);
            this.messageArray.push(_arg_3);
            this.messageArray.push((_arg_4.length / 2));
            this.messageArray = this.messageArray.concat(_arg_4);
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
