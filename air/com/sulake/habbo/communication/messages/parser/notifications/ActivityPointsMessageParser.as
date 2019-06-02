//com.sulake.habbo.communication.messages.parser.notifications.ActivityPointsMessageParser

package com.sulake.habbo.communication.messages.parser.notifications{
    import com.sulake.core.communication.messages.IMessageParser;
    import flash.utils.Dictionary;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ActivityPointsMessageParser implements IMessageParser {

        private var _points:Dictionary;

        public function ActivityPointsMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get points():Dictionary;


    }
}//package com.sulake.habbo.communication.messages.parser.notifications

