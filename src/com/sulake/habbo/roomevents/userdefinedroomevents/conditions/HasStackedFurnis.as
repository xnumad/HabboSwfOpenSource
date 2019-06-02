package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
    import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable;
    import com.sulake.core.window.components.IRadioButtonWindow;
    import com.sulake.core.window.components.ISelectorWindow;

    public class HasStackedFurnis extends WiredCondition 
    {
        override public function get code():int
        {
            return ConditionCodes.HAS_STACKED_FURNIS;
        }

        override public function get requiresFurni():int
        {
            return UserDefinedRoomEventsCtrl._Str_4873;
        }

        override public function readIntegerParamsFromForm(k:IWindowContainer):Array
        {
            var _local_2:Array = new Array();
            _local_2.push(this._Str_11170(k).getSelected().id);
            return _local_2;
        }

        override public function onEditStart(k:IWindowContainer, _arg_2:Triggerable):void
        {
            var _local_3:int = _arg_2.intData[0];
            this._Str_11170(k).setSelected(this._Str_16683(k, _local_3));
        }

        override public function get hasSpecialInputs():Boolean
        {
            return true;
        }

        private function _Str_16683(k:IWindowContainer, _arg_2:int):IRadioButtonWindow
        {
            return IRadioButtonWindow(k.findChildByName((("eval_" + _arg_2) + "_radio")));
        }

        private function _Str_11170(k:IWindowContainer):ISelectorWindow
        {
            return ISelectorWindow(k.findChildByName("eval_selector"));
        }
    }
}
