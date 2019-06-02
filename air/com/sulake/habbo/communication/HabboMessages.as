//com.sulake.habbo.communication.HabboMessages

package com.sulake.habbo.communication{
    import com.sulake.core.communication.messages.IMessageConfiguration;
    import com.sulake.core.utils.Map;

    public class HabboMessages implements IMessageConfiguration {

        private static const _events:Map;
        private static const _composers:Map;

        public function HabboMessages();

        public function get events():Map;

        public function get composers():Map;


    }
}//package com.sulake.habbo.communication

