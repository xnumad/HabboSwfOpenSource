package com.sulake.habbo.ui.widget.events
{
    public class _Str_2693 extends RoomWidgetUpdateEvent 
    {
        public static const RWPLEE_SHOW_PLAYLIST_EDITOR:String = "RWPLEE_SHOW_PLAYLIST_EDITOR";
        public static const RWPLEE_HIDE_PLAYLIST_EDITOR:String = "RWPLEE_HIDE_PLAYLIST_EDITOR";
        public static const RWPLEE_INVENTORY_UPDATED:String = "RWPLEE_INVENTORY_UPDATED";
        public static const RWPLEE_SONG_DISK_INVENTORY_UPDATED:String = "RWPLEE_SONG_DISK_INVENTORY_UPDATED";
        public static const RWPLEE_PLAY_LIST_UPDATED:String = "RWPLEE_PLAY_LIST_UPDATED";
        public static const RWPLEE_PLAY_LIST_FULL:String = "RWPLEE_PLAY_LIST_FULL";

        private var _furniId:int;

        public function _Str_2693(k:String, _arg_2:int=-1, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(k, _arg_3, _arg_4);
            this._furniId = _arg_2;
        }

        public function get furniId():int
        {
            return this._furniId;
        }
    }
}
