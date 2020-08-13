package com.sulake.habbo.communication.messages.outgoing.crafting
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class CraftComposer implements IMessageComposer, IDisposable
    {
        private var messageArray:Array;

        public function CraftComposer(k:int, _arg_2:String)
        {
            this.messageArray = new Array();
            super();
            this.messageArray.push(k);
            this.messageArray.push(_arg_2);
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
