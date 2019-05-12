package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
    import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
    import com.sulake.habbo.roomevents.userdefinedroomevents.common.SliderWindowController;
    import com.sulake.core.window.IWindowContainer;
    import flash.events.Event;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable;

    public class UserCountIn extends WiredCondition 
    {
        private var _roomEvents:HabboUserDefinedRoomEvents;
        private var _minSlider:SliderWindowController;
        private var _maxSlider:SliderWindowController;


        override public function get code():int
        {
            return ConditionCodes.USER_COUNT_IN;
        }

        override public function get negativeCode():int
        {
            return ConditionCodes.NOT_USER_COUNT_IN;
        }

        override public function readIntegerParamsFromForm(k:IWindowContainer):Array
        {
            var _local_2:Array = new Array();
            _local_2.push(this._minSlider.getValue());
            _local_2.push(this._maxSlider.getValue());
            return _local_2;
        }

        override public function onInit(k:IWindowContainer, _arg_2:HabboUserDefinedRoomEvents):void
        {
            this._roomEvents = _arg_2;
            this._minSlider = new SliderWindowController(_arg_2, this._Str_23213(k), _arg_2.assets, 1, 50, 1);
            this._minSlider.addEventListener(Event.CHANGE, this._Str_23138);
            this._minSlider._Str_2526(1);
            this._maxSlider = new SliderWindowController(_arg_2, this._Str_25609(k), _arg_2.assets, 1, 50, 1);
            this._maxSlider.addEventListener(Event.CHANGE, this._Str_25837);
            this._maxSlider._Str_2526(50);
        }

        override public function onEditStart(k:IWindowContainer, _arg_2:Triggerable):void
        {
            var _local_3:int = _arg_2.intData[0];
            var _local_4:int = _arg_2.intData[1];
            this._minSlider._Str_2526(_local_3);
            this._maxSlider._Str_2526(_local_4);
        }

        override public function get hasSpecialInputs():Boolean
        {
            return true;
        }

        private function _Str_23213(k:IWindowContainer):IWindowContainer
        {
            return k.findChildByName("min_slider_container") as IWindowContainer;
        }

        private function _Str_25609(k:IWindowContainer):IWindowContainer
        {
            return k.findChildByName("max_slider_container") as IWindowContainer;
        }

        private function _Str_23138(k:Event):void
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
                    this._roomEvents.localization.registerParameter("wiredfurni.params.usercountmin", "value", ("" + _local_4));
                }
            }
        }

        private function _Str_25837(k:Event):void
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
                    this._roomEvents.localization.registerParameter("wiredfurni.params.usercountmax", "value", ("" + _local_4));
                }
            }
        }
    }
}
