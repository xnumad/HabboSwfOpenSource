package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
    import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
    import com.sulake.habbo.roomevents.userdefinedroomevents.common.SliderWindowController;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable;
    import com.sulake.core.window.components.ITextFieldWindow;
    import flash.events.Event;

    public class MuteUser extends DefaultActionType 
    {
        private var _roomEvents:HabboUserDefinedRoomEvents;
        private var _slider:SliderWindowController;


        override public function get code():int
        {
            return ActionTypeCodes.MUTE_USER;
        }

        override public function readStringParamFromForm(k:IWindowContainer):String
        {
            var _local_2:String = this._Str_17881(k).text;
            return _local_2;
        }

        override public function readIntegerParamsFromForm(k:IWindowContainer):Array
        {
            var _local_2:Array = new Array();
            _local_2.push(this._slider.getValue());
            return _local_2;
        }

        override public function onEditStart(k:IWindowContainer, _arg_2:Triggerable):void
        {
            this._Str_17881(k).text = _arg_2.stringData;
            var _local_3:int = _arg_2.intData[0];
            this._slider._Str_2526(_local_3);
        }

        override public function get hasSpecialInputs():Boolean
        {
            return true;
        }

        private function _Str_17881(k:IWindowContainer):ITextFieldWindow
        {
            var _local_2:ITextFieldWindow = ITextFieldWindow(k.findChildByName("chat_message"));
            return _local_2;
        }

        override public function validate(k:IWindowContainer, _arg_2:HabboUserDefinedRoomEvents):String
        {
            var _local_4:String;
            var _local_3:int = 100;
            if (this._Str_17881(k).text.length > _local_3)
            {
                _local_4 = "wiredfurni.chatmsgtoolong";
                return _arg_2.localization.getLocalization(_local_4, _local_4);
            }
            return null;
        }

        override public function onInit(k:IWindowContainer, _arg_2:HabboUserDefinedRoomEvents):void
        {
            this._roomEvents = _arg_2;
            this._slider = new SliderWindowController(_arg_2, this._Str_25532(k), _arg_2.assets, 0, 10, 1);
            this._slider._Str_2526(1);
            this._slider.addEventListener(Event.CHANGE, this.onSliderChange);
        }

        private function _Str_25532(k:IWindowContainer):IWindowContainer
        {
            return k.findChildByName("slider_container") as IWindowContainer;
        }

        protected function onSliderChange(k:Event):void
        {
            var _local_2:SliderWindowController;
            var _local_3:Number;
            var _local_4:String;
            if (k.type == Event.CHANGE)
            {
                _local_2 = (k.target as SliderWindowController);
                if (_local_2)
                {
                    _local_3 = _local_2.getValue();
                    _local_4 = int(_local_3).toString();
                    this._roomEvents.localization.registerParameter("wiredfurni.params.length.minutes", "minutes", _local_4);
                }
            }
        }

        protected function get _Str_16492():HabboUserDefinedRoomEvents
        {
            return this._roomEvents;
        }

        public function get slider():SliderWindowController
        {
            return this._slider;
        }
    }
}
