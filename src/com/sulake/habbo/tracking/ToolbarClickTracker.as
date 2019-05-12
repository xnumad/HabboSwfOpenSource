package com.sulake.habbo.tracking
{
    public class ToolbarClickTracker 
    {
        private var _tracking:HabboTracking;
        private var _eventCount:int = 0;

        public function ToolbarClickTracker(k:HabboTracking)
        {
            this._tracking = k;
        }

        public function track(k:String):void
        {
            if (!this._tracking.getBoolean("toolbar.tracking.enabled"))
            {
                return;
            }
            this._eventCount++;
            if (this._eventCount <= this._tracking.getInteger("toolbar.tracking.max.events", 100))
            {
                this._tracking.trackGoogle("toolbar", k);
            }
        }
    }
}
