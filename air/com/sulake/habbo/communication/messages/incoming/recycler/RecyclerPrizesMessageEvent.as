//com.sulake.habbo.communication.messages.incoming.recycler.RecyclerPrizesMessageEvent

package com.sulake.habbo.communication.messages.incoming.recycler{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.recycler.RecyclerPrizesMessageParser;

    [SecureSWF(rename="true")]
    public class RecyclerPrizesMessageEvent extends MessageEvent implements IMessageEvent {

        public function RecyclerPrizesMessageEvent(k:Function);

        public function getParser():RecyclerPrizesMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.recycler

