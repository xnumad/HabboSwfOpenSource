package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
    import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
    import com.sulake.habbo.roomevents.userdefinedroomevents.common.SliderWindowController;
    import com.sulake.core.window.IWindowContainer;
    import flash.events.Event;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable;
    import com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs.TriggerOnce;

    public class TimeElapsedMore extends WiredCondition 
    {
        private var _roomEvents:HabboUserDefinedRoomEvents;
        private var _slider:SliderWindowController;

        override public function get code():int
        {
            return ConditionCodes.TIME_ELAPSED_MORE;
        }

        override public function readIntegerParamsFromForm(k:IWindowContainer):Array
        {
            var _local_2:Array = new Array();
            var _local_3:int = this._slider.getValue();
            _local_2.push((_local_3 + 1));
            return _local_2;
        }

        override public function onInit(k:IWindowContainer, _arg_2:HabboUserDefinedRoomEvents):void
        {
            this._roomEvents = _arg_2;
            this._slider = new SliderWindowController(_arg_2, this._Str_2453(k), _arg_2.assets, 1, 1200, 1);
            this._slider._Str_2526(1);
            this._slider.addEventListener(Event.CHANGE, this.onSliderChange);
        }

        override public function onEditStart(k:IWindowContainer, _arg_2:Triggerable):void
        {
            var _local_3:int = (_arg_2.intData[0] - 1);
            this._slider._Str_2526(_local_3);
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
            var _local_5:String;
            if (k.type == Event.CHANGE)
            {
                _local_2 = (k.target as SliderWindowController);
                if (_local_2)
                {
                    _local_3 = _local_2.getValue();
                    _local_4 = int(_local_3);
                    _local_5 = TriggerOnce._Str_11919(_local_4);
                    this._roomEvents.localization.registerParameter("wiredfurni.params.allowafter", "seconds", _local_5);
                }
            }
        }
    }
}
