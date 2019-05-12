package com.sulake.bootstrap
{
    import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;

    public class HabboUserDefinedRoomEventsBootstrap extends HabboUserDefinedRoomEvents 
    {
        public function HabboUserDefinedRoomEventsBootstrap(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            super(k, _arg_2, _arg_3);
        }
    }
}
