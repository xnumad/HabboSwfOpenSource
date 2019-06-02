package com.sulake.habbo.inventory.events
{
    import flash.events.Event;

    public class HabboInventoryItemAddedEvent extends Event 
    {
        public static const HABBO_INVENTORY_ITEM_ADDED:String = "HABBO_INVENTORY_ITEM_ADDED";

        private var _classId:int;
        private var _stripId:int;
        private var _category:int;

        public function HabboInventoryItemAddedEvent(k:int, _arg_2:int, _arg_3:int, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super(HABBO_INVENTORY_ITEM_ADDED, _arg_4, _arg_5);
            this._classId = k;
            this._stripId = _arg_2;
            this._category = _arg_3;
        }

        public function get classId():int
        {
            return this._classId;
        }

        public function get _Str_17550():int
        {
            return this._stripId;
        }

        public function get category():int
        {
            return this._category;
        }
    }
}
