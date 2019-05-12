package com.sulake.habbo.inventory.events
{
    import flash.events.Event;

    public class HabboInventoryHabboClubEvent extends Event 
    {
        public static const HIHCE_HABBO_CLUB_CHANGED:String = "HIHCE_HABBO_CLUB_CHANGED";

        public function HabboInventoryHabboClubEvent(k:Boolean=false, _arg_2:Boolean=false)
        {
            super(HIHCE_HABBO_CLUB_CHANGED, k, _arg_2);
        }
    }
}
