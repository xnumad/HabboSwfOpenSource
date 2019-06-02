//com.sulake.habbo.communication.messages.outgoing.recycler.RecycleItemsMessageComposer

package com.sulake.habbo.communication.messages.outgoing.recycler{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class RecycleItemsMessageComposer implements IMessageComposer {

        private var _messageData:Array;

        public function RecycleItemsMessageComposer(k:Array);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.recycler

