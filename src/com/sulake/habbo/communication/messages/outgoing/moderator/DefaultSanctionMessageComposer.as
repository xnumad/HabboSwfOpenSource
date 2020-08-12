package com.sulake.habbo.communication.messages.outgoing.moderator
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class DefaultSanctionMessageComposer implements IMessageComposer, IDisposable
    {
        private var messageArray:Array;

        public function DefaultSanctionMessageComposer(k:int, _arg_2:int, _arg_3:String, _arg_4:int)
        {
            this.messageArray = new Array();
            super();
            this.messageArray.push(k);
            this.messageArray.push(_arg_2);
            this.messageArray.push(_arg_3);
            if (_arg_4 != ModBanMessageComposer.NO_ISSUE_ID)
            {
                this.messageArray.push(_arg_4);
            }
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
