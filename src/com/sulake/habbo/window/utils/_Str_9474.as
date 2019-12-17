package com.sulake.habbo.window.utils
{
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.habbo.communication.messages.incoming.notifications._Str_8054;

    public class _Str_9474 
    {
        private var _habboWindowManagerComponent:HabboWindowManagerComponent;
        private var _Str_16606:_Str_8054;

        public function _Str_9474(k:HabboWindowManagerComponent)
        {
            this._habboWindowManagerComponent = k;
            if (this._habboWindowManagerComponent.communication != null)
            {
                this._Str_16606 = new _Str_8054(this._Str_23532);
                this._habboWindowManagerComponent.communication.addHabboConnectionMessageEvent(this._Str_16606);
            }
        }

        private function _Str_23532(k:_Str_8054):void
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
                this._habboWindowManagerComponent.communication.removeHabboConnectionMessageEvent(this._Str_16606);
            }
            this._habboWindowManagerComponent = null;
        }
    }
}
