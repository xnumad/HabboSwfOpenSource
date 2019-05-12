package com.sulake.habbo.communication.messages.outgoing.camera.json
{
    public class JsonTextureColumnData 
    {
        private var _assetNames:Array;

        public function JsonTextureColumnData()
        {
            this._assetNames = new Array();
            super();
        }

        public function addAssetName(k:String):void
        {
            this._assetNames.push(k);
        }

        public function get assetNames():Array
        {
            return this._assetNames;
        }
    }
}
