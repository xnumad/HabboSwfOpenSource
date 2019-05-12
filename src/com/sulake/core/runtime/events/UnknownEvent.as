package com.sulake.core.runtime.events
{
    import flash.events.Event;
    import com.sulake.core.runtime.IUnknown;

    public class UnknownEvent extends Event 
    {
        public var unknown:IUnknown;

        public function UnknownEvent(type:String, unknown:IUnknown)
        {
            this.unknown = unknown;
            super(type);
        }
    }
}
