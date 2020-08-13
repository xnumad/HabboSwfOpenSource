package com.sulake.habbo.communication.messages.outgoing.advertisement
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class InterstitialShownMessageComposer implements IMessageComposer
    {
        private var _data:Array;

        public function InterstitialShownMessageComposer()
        {
            this._data = [];
            super();
        }

        public function dispose():void
        {
            this._data = null;
        }

        public function getMessageArray():Array
        {
            return this._data;
        }
    }
}
