//com.sulake.habbo.communication.messages.incoming.recycler.RecyclerFinishedMessageEvent

package com.sulake.habbo.communication.messages.incoming.recycler{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.recycler.RecyclerFinishedMessageParser;

    [SecureSWF(rename="true")]
    public class RecyclerFinishedMessageEvent extends MessageEvent implements IMessageEvent {

        public static const FINISHED_OK:int;
        public static const FINISHED_FAIL:int;

        public function RecyclerFinishedMessageEvent(k:Function);

        public function getParser():RecyclerFinishedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.recycler

