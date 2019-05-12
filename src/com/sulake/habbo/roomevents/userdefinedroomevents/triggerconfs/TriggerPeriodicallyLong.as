package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs
{
    import com.sulake.habbo.roomevents.userdefinedroomevents.common.SliderWindowController;
    import flash.events.Event;
    import com.sulake.habbo.utils.FriendlyTime;

    public class TriggerPeriodicallyLong extends TriggerPeriodically 
    {


        override public function get code():int
        {
            return WiredTriggerType.TRIGGER_PERIODICALLY_LONG;
        }

        override protected function onSliderChange(k:Event):void
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
                    _local_4 = FriendlyTime.format(_Str_16492.localization, (_local_3 * 5));
                    _Str_16492.localization.registerParameter("wiredfurni.params.setlongtime", "time", _local_4);
                }
            }
        }
    }
}
