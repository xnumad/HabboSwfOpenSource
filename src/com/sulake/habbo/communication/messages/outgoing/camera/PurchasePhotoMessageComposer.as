package com.sulake.habbo.communication.messages.outgoing.camera
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class PurchasePhotoMessageComposer implements IMessageComposer 
    {
        private var _data:Array;

        public function PurchasePhotoMessageComposer(PhotoId:String)
        {
            this._data = [];
            super();

            this._data.push(PhotoId);
        }

        public function getMessageArray():Array
        {
            return this._data;
        }

        public function dispose():void
        {
            this._data = [];
        }
    }
}
