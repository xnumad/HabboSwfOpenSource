package com.sulake.habbo.session.events
{
    import flash.events.Event;

    public class PerksUpdatedEvent extends Event 
    {
        public static const PERKS_UPDATED:String = "PUE_perks_updated";

        public function PerksUpdatedEvent()
        {
            super(PERKS_UPDATED);
        }
    }
}
