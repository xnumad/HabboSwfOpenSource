package com.sulake.habbo.avatar.events
{
    import flash.events.Event;

    public class AvatarUpdateEvent extends Event 
    {
        public static const AVATAR_FIGURE_UPDATED:String = "AVATAR_FIGURE_UPDATED";

        private var _figure:String;

        public function AvatarUpdateEvent(_figure:String, bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(AVATAR_FIGURE_UPDATED, bubbles, cancelable);
            this._figure = _figure;
        }

        public function get figure():String
        {
            return this._figure;
        }
    }
}
