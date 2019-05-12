package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable;
    import com.sulake.core.window.components.ITextFieldWindow;

    public class ActorWearsBadge extends WiredCondition 
    {
        override public function get code():int
        {
            return ConditionCodes.ACTOR_IS_WEARING_BADGE;
        }

        override public function get negativeCode():int
        {
            return ConditionCodes.NOT_ACTOR_WEARS_BADGE;
        }

        override public function readStringParamFromForm(k:IWindowContainer):String
        {
            var _local_2:String = this._Str_2453(k).text;
            return _local_2;
        }

        override public function onEditStart(k:IWindowContainer, _arg_2:Triggerable):void
        {
            this._Str_2453(k).text = _arg_2.stringData;
        }

        override public function get hasSpecialInputs():Boolean
        {
            return true;
        }

        private function _Str_2453(k:IWindowContainer):ITextFieldWindow
        {
            var _local_2:ITextFieldWindow = ITextFieldWindow(k.findChildByName("badge_code"));
            return _local_2;
        }
    }
}
