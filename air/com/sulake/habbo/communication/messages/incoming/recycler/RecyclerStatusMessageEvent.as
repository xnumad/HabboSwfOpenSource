//com.sulake.habbo.communication.messages.incoming.recycler.RecyclerStatusMessageEvent

package com.sulake.habbo.communication.messages.incoming.recycler{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.recycler.RecyclerStatusMessageParser;

    [SecureSWF(rename="true")]
    public class RecyclerStatusMessageEvent extends MessageEvent implements IMessageEvent {

        public static const SYSTEM_STATUS_ENABLED:int;
        public static const SYSTEM_STATUS_DISABLED:int;
        public static const SYSTEM_STATUS_TIMEOUT:int;

        public function RecyclerStatusMessageEvent(k:Function);

        public function getParser():RecyclerStatusMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.recycler

