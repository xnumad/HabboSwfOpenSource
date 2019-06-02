//com.sulake.habbo.communication.messages.parser.notifications.NotificationDialogMessageParser

package com.sulake.habbo.communication.messages.parser.notifications{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class NotificationDialogMessageParser implements IMessageParser {

        private var _type:String;
        private var _parameters:Map;

        public function NotificationDialogMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get type():String;

        public function get parameters():Map;


    }
}//package com.sulake.habbo.communication.messages.parser.notifications

