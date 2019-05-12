package com.sulake.habbo.catalog.targetedoffers.data
{
    public class HabboMallOffer 
    {
        private var _targetedOfferId:int;
        private var _identifier:String;
        private var _title:String;
        private var _highlight:String;
        private var _description:String;
        private var _imageUrl:String;
        private var _smallImageUrl:String;
        private var _trackingState:int;

        public function HabboMallOffer(k:Object)
        {
            this._targetedOfferId = parseInt(k.targetedOfferId);
            this._identifier = k.identifier;
            this._title = k.header;
            this._highlight = k.highlight;
            this._description = k.description;
            this._imageUrl = k.imageUrl;
            this._smallImageUrl = k.smallImageUrl;
            this._trackingState = parseInt(k.trackingStateCode);
        }

        public function get targetedOfferId():int
        {
            return this._targetedOfferId;
        }

        public function get identifier():String
        {
            return this._identifier;
        }

        public function get title():String
        {
            return this._title;
        }

        public function get highlight():String
        {
            return this._highlight;
        }

        public function get description():String
        {
            return this._description;
        }

        public function get imageUrl():String
        {
            return this._imageUrl;
        }

        public function get smallImageUrl():String
        {
            return this._smallImageUrl;
        }

        public function get _Str_11180():int
        {
            return this._trackingState;
        }
    }
}
