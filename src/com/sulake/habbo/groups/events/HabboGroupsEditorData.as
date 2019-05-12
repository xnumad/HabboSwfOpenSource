package com.sulake.habbo.groups.events
{
    import flash.events.Event;

    public class HabboGroupsEditorData extends Event 
    {
        public static const HGE_EDIT_INFO:String = "HGE_EDIT_INFO";

        public function HabboGroupsEditorData(k:Boolean=false, _arg_2:Boolean=false)
        {
            super(HGE_EDIT_INFO, k, _arg_2);
        }
    }
}
