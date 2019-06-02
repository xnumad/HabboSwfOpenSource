//com.sulake.habbo.communication.messages.outgoing.recycler.GetRecyclerStatusMessageComposer

package com.sulake.habbo.communication.messages.outgoing.recycler{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetRecyclerStatusMessageComposer implements IMessageComposer {

        public function GetRecyclerStatusMessageComposer();

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.recycler

