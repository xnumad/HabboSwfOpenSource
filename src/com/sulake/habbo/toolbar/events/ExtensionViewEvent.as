package com.sulake.habbo.toolbar.events
{
    import flash.events.Event;

    public class ExtensionViewEvent extends Event 
    {
        public static const EVE_EXTENSION_VIEW_RESIZED:String = "EVE_EXTENSION_VIEW_RESIZED";

        public function ExtensionViewEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(type, bubbles, cancelable);
        }
    }
}
