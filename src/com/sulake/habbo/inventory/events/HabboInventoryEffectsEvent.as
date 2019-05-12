package com.sulake.habbo.inventory.events
{
    import flash.events.Event;

    public class HabboInventoryEffectsEvent extends Event 
    {
        public static const HIEE_EFFECTS_CHANGED:String = "HIEE_EFFECTS_CHANGED";

        private var _effects:Array;

        public function HabboInventoryEffectsEvent(k:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(k, _arg_2, _arg_3);
        }
    }
}
