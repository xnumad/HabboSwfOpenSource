package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
    import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable;
    import com.sulake.core.window.components.ICheckBoxWindow;

    public class SetFurniStateTo extends DefaultActionType 
    {
        override public function get code():int
        {
            return ActionTypeCodes.SET_FURNI_STATE;
        }

        override public function get requiresFurni():int
        {
            return UserDefinedRoomEventsCtrl._Str_4873;
        }

        override public function get hasStateSnapshot():Boolean
        {
            return true;
        }

        override public function onEditStart(k:IWindowContainer, _arg_2:Triggerable):void
        {
            this.select(this._Str_10847(k), _arg_2.getBoolean(0));
            this.select(this._Str_10700(k), _arg_2.getBoolean(1));
            this.select(this._Str_10629(k), _arg_2.getBoolean(2));
        }

        private function select(k:ICheckBoxWindow, _arg_2:Boolean):void
        {
            if (_arg_2)
            {
                k.select();
            }
            else
            {
                k.unselect();
            }
        }

        override public function readIntegerParamsFromForm(k:IWindowContainer):Array
        {
            var _local_2:Array = new Array();
            _local_2.push(this._Str_7329(this._Str_10847(k)));
            _local_2.push(this._Str_7329(this._Str_10700(k)));
            _local_2.push(this._Str_7329(this._Str_10629(k)));
            return _local_2;
        }

        private function _Str_7329(k:ICheckBoxWindow):int
        {
            return (k._Str_2365) ? 1 : 0;
        }

        override public function get hasSpecialInputs():Boolean
        {
            return true;
        }

        private function _Str_10847(k:IWindowContainer):ICheckBoxWindow
        {
            return ICheckBoxWindow(k.findChildByName("include_state_checkbox"));
        }

        private function _Str_10700(k:IWindowContainer):ICheckBoxWindow
        {
            return ICheckBoxWindow(k.findChildByName("include_rotation_checkbox"));
        }

        private function _Str_10629(k:IWindowContainer):ICheckBoxWindow
        {
            return ICheckBoxWindow(k.findChildByName("include_location_checkbox"));
        }
    }
}
