package com.sulake.habbo.communication.messages.outgoing.moderator
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class ModBanMessageComposer implements IMessageComposer, IDisposable
    {
        public static const NO_ISSUE_ID:int = -1;

        private var messageArray:Array;

        public function ModBanMessageComposer(k:int, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:Boolean, _arg_6:int)
        {
            this.messageArray = new Array();
            super();
            this.messageArray.push(k);
            this.messageArray.push(_arg_2);
            this.messageArray.push(_arg_3);
            this.messageArray.push(_arg_4);
            this.messageArray.push(_arg_5);
            if (_arg_6 != NO_ISSUE_ID)
            {
                this.messageArray.push(_arg_6);
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
