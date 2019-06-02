//com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.ConditionDefinition

package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ConditionDefinition extends Triggerable {

        private var _type:int;

        public function ConditionDefinition(k:IMessageDataWrapper);

        public function get type():int;

        override public function get code():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents

