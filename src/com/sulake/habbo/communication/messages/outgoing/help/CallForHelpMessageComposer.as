package com.sulake.habbo.communication.messages.outgoing.help
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class CallForHelpMessageComposer implements IMessageComposer, IDisposable
    {
        private var messageArray:Array;

        public function CallForHelpMessageComposer(k:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:Array)
        {
            this.messageArray = new Array();
            super();
            this.messageArray.push(k);
            this.messageArray.push(_arg_2);
            this.messageArray.push(_arg_3);
            this.messageArray.push(_arg_4);
            this.messageArray.push((_arg_5.length / 2));
            this.messageArray = this.messageArray.concat(_arg_5);
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
