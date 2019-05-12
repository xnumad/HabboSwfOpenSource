package com.sulake.habbo.sound.events
{
    import flash.events.Event;

    public class SongDiskInventoryReceivedEvent extends Event 
    {
        public static const SDIR_SONG_DISK_INVENTORY_RECEIVENT_EVENT:String = "SDIR_SONG_DISK_INVENTORY_RECEIVENT_EVENT";

        public function SongDiskInventoryReceivedEvent(k:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(k, _arg_2, _arg_3);
        }
    }
}
