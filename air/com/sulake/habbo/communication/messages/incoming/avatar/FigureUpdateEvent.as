//com.sulake.habbo.communication.messages.incoming.avatar.FigureUpdateEvent

package com.sulake.habbo.communication.messages.incoming.avatar{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.avatar.FigureUpdateParser;

    [SecureSWF(rename="true")]
    public class FigureUpdateEvent extends MessageEvent implements IMessageEvent {

        public function FigureUpdateEvent(k:Function);

        private function getParser():FigureUpdateParser;

        public function get figure():String;

        public function get gender():String;


    }
}//package com.sulake.habbo.communication.messages.incoming.avatar

