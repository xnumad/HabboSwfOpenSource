package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
    import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
    import com.sulake.habbo.roomevents.userdefinedroomevents.common.SliderWindowController;
    import com.sulake.core.window.IWindowContainer;
    import flash.events.Event;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable;

    public class GiveScore extends DefaultActionType 
    {
        private var _roomEvents:HabboUserDefinedRoomEvents;
        private var _slider:SliderWindowController;
        private var _counterSlider:SliderWindowController;


        override public function get code():int
        {
            return ActionTypeCodes.GIVE_SCORE;
        }

        override public function readIntegerParamsFromForm(k:IWindowContainer):Array
        {
            var _local_2:Array = new Array();
            _local_2.push(this._slider.getValue());
            _local_2.push(this._counterSlider.getValue());
            return _local_2;
        }

        override public function onInit(k:IWindowContainer, _arg_2:HabboUserDefinedRoomEvents):void
        {
            this._roomEvents = _arg_2;
            this._slider = new SliderWindowController(_arg_2, this._Str_2453(k), _arg_2.assets, 1, 100, 1);
            this._slider.addEventListener(Event.CHANGE, this.onSliderChange);
            this._slider._Str_2526(1);
            this._counterSlider = new SliderWindowController(_arg_2, this._Str_22476(k), _arg_2.assets, 1, 10, 1);
            this._counterSlider.addEventListener(Event.CHANGE, this._Str_24911);
            this._counterSlider._Str_2526(1);
        }

        override public function onEditStart(k:IWindowContainer, _arg_2:Triggerable):void
        {
            var _local_3:int = _arg_2.intData[0];
            var _local_4:int = _arg_2.intData[1];
            this._slider._Str_2526(_local_3);
            this._counterSlider._Str_2526(_local_4);
        }

        override public function get hasSpecialInputs():Boolean
        {
            return true;
        }

        private function _Str_2453(k:IWindowContainer):IWindowContainer
        {
            return k.findChildByName("slider_container") as IWindowContainer;
        }

        private function _Str_22476(k:IWindowContainer):IWindowContainer
        {
            return k.findChildByName("counter_slider_container") as IWindowContainer;
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
                    this._roomEvents.localization.registerParameter("wiredfurni.params.setpoints", "points", ("" + _local_4));
                }
            }
        }

        private function _Str_24911(k:Event):void
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
                    this._roomEvents.localization.registerParameter("wiredfurni.params.settimesingame", "times", ("" + _local_4));
                }
            }
        }
    }
}
