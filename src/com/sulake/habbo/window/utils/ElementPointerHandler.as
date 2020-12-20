package com.sulake.habbo.window.utils
{
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.habbo.communication.messages.incoming.notifications.ElementPointerMessageEvent;

    public class ElementPointerHandler
    {
        private var _habboWindowManagerComponent:HabboWindowManagerComponent;
        private var _elementPointerMessageEvent:ElementPointerMessageEvent;

        public function ElementPointerHandler(k:HabboWindowManagerComponent)
        {
            this._habboWindowManagerComponent = k;
            if (this._habboWindowManagerComponent.communication != null)
            {
                this._elementPointerMessageEvent = new ElementPointerMessageEvent(this._Str_23532);
                this._habboWindowManagerComponent.communication.addHabboConnectionMessageEvent(this._elementPointerMessageEvent);
            }
        }

        private function _Str_23532(k:ElementPointerMessageEvent):void
        {
            var _local_2:String = k.getParser().key;
            if (((_local_2 == null) || (_local_2 == "")))
            {
                this._habboWindowManagerComponent.hideHint();
            }
            else
            {
                this._habboWindowManagerComponent.showHint(_local_2);
            }
        }

        public function dispose():void
        {
            if (this._habboWindowManagerComponent.communication != null)
            {
                this._habboWindowManagerComponent.communication.removeHabboConnectionMessageEvent(this._elementPointerMessageEvent);
            }
            this._habboWindowManagerComponent = null;
        }
    }
}
