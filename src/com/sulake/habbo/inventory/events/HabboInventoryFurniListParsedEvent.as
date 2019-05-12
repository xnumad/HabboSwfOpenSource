package com.sulake.habbo.inventory.events
{
    import flash.events.Event;

    public class HabboInventoryFurniListParsedEvent extends Event 
    {
        public static const HFLPE_FURNI_LIST_PARSED:String = "HFLPE_FURNI_LIST_PARSED";

        private var _category:String;

        public function HabboInventoryFurniListParsedEvent(k:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(HFLPE_FURNI_LIST_PARSED);
            this._category = k;
        }

        public function get category():String
        {
            return this._category;
        }
    }
}
