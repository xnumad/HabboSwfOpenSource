package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.components.IRadioButtonWindow;
    import com.sulake.core.window.components.ISelectorWindow;

    public class AvatarEnterRoom extends WiredTrigger 
    {
        private var _cont:IWindowContainer;


        override public function get code():int
        {
            return WiredTriggerType.AVATAR_ENTERS_ROOM;
        }

        override public function readStringParamFromForm(k:IWindowContainer):String
        {
            var _local_2:String = this._Str_2453().text;
            return (this._Str_14247()._Str_2365) ? _local_2 : "";
        }

        override public function onInit(k:IWindowContainer, _arg_2:HabboUserDefinedRoomEvents):void
        {
            this._cont = k;
            this._Str_14247().addEventListener(WindowEvent.WINDOW_EVENT_SELECT, this._Str_22463);
            this._Str_14247().addEventListener(WindowEvent.WINDOW_EVENT_UNSELECT, this._Str_24589);
        }

        override public function onEditStart(k:IWindowContainer, _arg_2:Triggerable):void
        {
            if (_arg_2.stringData != "")
            {
                this._Str_4281().setSelected(this._Str_14247());
                this._Str_2453().text = _arg_2.stringData;
                this._Str_2453().visible = true;
            }
            else
            {
                this._Str_4281().setSelected(this._Str_16153());
                this._Str_2453().text = "";
                this._Str_2453().visible = false;
            }
        }

        override public function get hasSpecialInputs():Boolean
        {
            return true;
        }

        private function _Str_2453():ITextFieldWindow
        {
            return ITextFieldWindow(this._cont.findChildByName("avatar_name_txt"));
        }

        private function _Str_14247():IRadioButtonWindow
        {
            return IRadioButtonWindow(this._cont.findChildByName("certain_avatar_radio"));
        }

        private function _Str_16153():IRadioButtonWindow
        {
            return IRadioButtonWindow(this._cont.findChildByName("any_avatar_radio"));
        }

        private function _Str_4281():ISelectorWindow
        {
            return ISelectorWindow(this._cont.findChildByName("avatar_radio"));
        }

        private function _Str_22463(k:WindowEvent):void
        {
            this._Str_2453().visible = true;
        }

        private function _Str_24589(k:WindowEvent):void
        {
            this._Str_2453().text = "";
            this._Str_2453().visible = false;
        }
    }
}
