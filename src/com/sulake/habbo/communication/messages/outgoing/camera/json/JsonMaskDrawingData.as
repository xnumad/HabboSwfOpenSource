package com.sulake.habbo.communication.messages.outgoing.camera.json
{
    public class JsonMaskDrawingData 
    {
        private var _name:String;
        private var _location:JsonPoint;
        private var _flipH:Boolean;
        private var _flipV:Boolean;

        public function JsonMaskDrawingData(k:String, _arg_2:JsonPoint, _arg_3:Boolean, _arg_4:Boolean)
        {
            this._name = k;
            this._location = _arg_2;
            this._flipH = _arg_3;
            this._flipV = _arg_4;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get location():JsonPoint
        {
            return this._location;
        }

        public function get flipH():Boolean
        {
            return this._flipH;
        }

        public function get flipV():Boolean
        {
            return this._flipV;
        }
    }
}
