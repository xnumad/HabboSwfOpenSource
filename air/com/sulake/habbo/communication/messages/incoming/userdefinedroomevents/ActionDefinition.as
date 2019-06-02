//com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.ActionDefinition

package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ActionDefinition extends Triggerable {

        private var _type:int;
        private var _delayInPulses:int;
        private var _conflictingTriggers:Array;

        public function ActionDefinition(k:IMessageDataWrapper);

        public function get type():int;

        override public function get code():int;

        public function get delayInPulses():int;

        public function get conflictingTriggers():Array;


    }
}//package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents

