package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ConditionDefinition extends Triggerable 
    {
        private var _type:int;

        public function ConditionDefinition(k:IMessageDataWrapper)
        {
            super(k);
            this._type = k.readInteger();
        }

        public function get type():int
        {
            return this._type;
        }

        override public function get code():int
        {
            return this._type;
        }
    }
}
