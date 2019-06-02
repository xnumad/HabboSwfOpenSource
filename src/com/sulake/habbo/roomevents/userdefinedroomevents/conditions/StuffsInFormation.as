package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
    import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
    import com.sulake.habbo.roomevents.userdefinedroomevents.common.SliderWindowController;
    import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
    import com.sulake.core.window.IWindowContainer;
    import flash.events.Event;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable;
    import com.sulake.core.window.components.IRadioButtonWindow;
    import com.sulake.core.window.components.ISelectorWindow;

    public class StuffsInFormation extends WiredCondition 
    {
        private var _roomEvents:HabboUserDefinedRoomEvents;
        private var _slider:SliderWindowController;


        override public function get code():int
        {
            return ConditionCodes.STUFFS_IN_FORMATION;
        }

        override public function get negativeCode():int
        {
            return ConditionCodes.NOT_STUFFS_IN_FORMATION;
        }

        override public function get requiresFurni():int
        {
            return UserDefinedRoomEventsCtrl._Str_4873;
        }

        override public function readIntegerParamsFromForm(k:IWindowContainer):Array
        {
            var _local_2:Array = new Array();
            _local_2.push(int(this._slider.getValue()));
            _local_2.push(this._Str_21596(k).getSelected().id);
            return _local_2;
        }

        override public function onInit(k:IWindowContainer, _arg_2:HabboUserDefinedRoomEvents):void
        {
            this._roomEvents = _arg_2;
            this._slider = new SliderWindowController(_arg_2, this._Str_2453(k), _arg_2.assets, 2, 10, 1);
            this._slider._Str_2526(3);
            this._slider.addEventListener(Event.CHANGE, this.onSliderChange);
            _arg_2.refreshButton(k, "move_diag", true, null, 0);
            _arg_2.refreshButton(k, "move_vrt", true, null, 0);
        }

        override public function onEditStart(k:IWindowContainer, _arg_2:Triggerable):void
        {
            this._slider._Str_2526(_arg_2.intData[0]);
            var _local_3:int = _arg_2.intData[1];
            this._Str_21596(k).setSelected(this._Str_24795(k, _local_3));
        }

        override public function get hasSpecialInputs():Boolean
        {
            return true;
        }

        private function _Str_2453(k:IWindowContainer):IWindowContainer
        {
            return k.findChildByName("slider_container") as IWindowContainer;
        }

        private function onSliderChange(k:Event):void
        {
            var _local_2:SliderWindowController;
            var _local_3:Number;
            var _local_4:int;
            if (k.type == Event.CHANGE)
            {
                _local_2 = (k.target as SliderWindowController);
                if (_local_2)
                {
                    _local_3 = _local_2.getValue();
                    _local_4 = int(_local_3);
                    this._roomEvents.localization.registerParameter("wiredfurni.params.requiredformationsize", "furnis", ("" + _local_4));
                }
            }
        }

        private function _Str_24795(k:IWindowContainer, _arg_2:int):IRadioButtonWindow
        {
            return IRadioButtonWindow(k.findChildByName((("formation_" + _arg_2) + "_radio")));
        }

        private function _Str_21596(k:IWindowContainer):ISelectorWindow
        {
            return ISelectorWindow(k.findChildByName("formation_selector"));
        }
    }
}
