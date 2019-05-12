package com.sulake.habbo.inventory.events
{
    import flash.events.Event;
    import flash.utils.Dictionary;

    public class HabboUnseenItemsUpdatedEvent extends Event 
    {
        public static const HUIUE_UNSEEN_ITEMS_CHANGED:String = "HUIUE_UNSEEN_ITEMS_CHANGED";

        private var _inventoryCount:int;
        private var _categoryCount:Dictionary;

        public function HabboUnseenItemsUpdatedEvent(k:Boolean=false, _arg_2:Boolean=false)
        {
            super(HUIUE_UNSEEN_ITEMS_CHANGED);
            this._categoryCount = new Dictionary();
        }

        public function _Str_23396(k:int, _arg_2:int):void
        {
            this._categoryCount[k.toString()] = _arg_2;
        }

        public function _Str_25582(k:int):int
        {
            return this._categoryCount[k.toString()];
        }

        public function set _Str_13996(k:int):void
        {
            this._inventoryCount = k;
        }

        public function get _Str_13996():int
        {
            return this._inventoryCount;
        }
    }
}
