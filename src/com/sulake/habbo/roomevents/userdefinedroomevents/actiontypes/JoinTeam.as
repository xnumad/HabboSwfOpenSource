package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable;
    import com.sulake.core.window.components.IRadioButtonWindow;
    import com.sulake.core.window.components.ISelectorWindow;

    public class JoinTeam extends DefaultActionType 
    {


        override public function get code():int
        {
            return ActionTypeCodes.JOIN_TEAM;
        }

        override public function onEditStart(k:IWindowContainer, _arg_2:Triggerable):void
        {
            var _local_3:int = _arg_2.intData[0];
            this._Str_6616(k).setSelected(this._Str_9779(k, _local_3));
        }

        override public function readIntegerParamsFromForm(k:IWindowContainer):Array
        {
            var _local_2:Array = new Array();
            _local_2.push(this._Str_6616(k).getSelected().id);
            return _local_2;
        }

        override public function get hasSpecialInputs():Boolean
        {
            return true;
        }

        private function _Str_9779(k:IWindowContainer, _arg_2:int):IRadioButtonWindow
        {
            return IRadioButtonWindow(k.findChildByName((("team_" + _arg_2) + "_radio")));
        }

        private function _Str_6616(k:IWindowContainer):ISelectorWindow
        {
            return ISelectorWindow(k.findChildByName("team_selector"));
        }
    }
}
