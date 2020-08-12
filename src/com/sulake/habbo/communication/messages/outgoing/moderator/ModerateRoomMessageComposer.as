package com.sulake.habbo.communication.messages.outgoing.moderator
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class ModerateRoomMessageComposer implements IMessageComposer, IDisposable
    {
        private var messageArray:Array;

        public function ModerateRoomMessageComposer(k:int, _arg_2:Boolean, _arg_3:Boolean, _arg_4:Boolean)
        {
            this.messageArray = new Array();
            super();
            this.messageArray.push(k);
            this.messageArray.push(((_arg_2) ? 1 : 0));
            this.messageArray.push(((_arg_3) ? 1 : 0));
            this.messageArray.push(((_arg_4) ? 1 : 0));
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
