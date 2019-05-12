package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable;
    import com.sulake.core.window.components.ITextFieldWindow;

    public class ActorIsWearingEffect extends WiredCondition 
    {
        override public function get code():int
        {
            return ConditionCodes.ACTOR_IS_WEARING_EFFECT;
        }

        override public function get negativeCode():int
        {
            return ConditionCodes.NOT_ACTOR_WEARING_EFFECT;
        }

        override public function readIntegerParamsFromForm(k:IWindowContainer):Array
        {
            var _local_2:Array = [];
            _local_2.push(int(this.getSpecialInputTextField(k).text));
            return _local_2;
        }

        override public function onEditStart(k:IWindowContainer, _arg_2:Triggerable):void
        {
            this.getSpecialInputTextField(k).text = _arg_2.intData[0];
        }

        override public function get hasSpecialInputs():Boolean
        {
            return true;
        }

        private function getSpecialInputTextField(k:IWindowContainer):ITextFieldWindow
        {
            var _local_2:ITextFieldWindow = ITextFieldWindow(k.findChildByName("effect_id"));
            return _local_2;
        }
    }
}
