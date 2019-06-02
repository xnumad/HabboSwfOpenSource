//com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.TriggerDefinition

package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class TriggerDefinition extends Triggerable {

        private var _triggerConf:int;
        private var _conflictingActions:Array;

        public function TriggerDefinition(k:IMessageDataWrapper);

        public function get triggerConf():int;

        override public function get code():int;

        public function get conflictingActions():Array;


    }
}//package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents

