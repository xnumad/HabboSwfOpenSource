//com.sulake.habbo.communication.messages.incoming.room.engine.SlideObjectBundleMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.engine{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.SlideObjectBundleMessageParser;

    [SecureSWF(rename="true")]
    public class SlideObjectBundleMessageEvent extends MessageEvent implements IMessageEvent {

        public function SlideObjectBundleMessageEvent(k:Function);

        public function getParser():SlideObjectBundleMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.engine

