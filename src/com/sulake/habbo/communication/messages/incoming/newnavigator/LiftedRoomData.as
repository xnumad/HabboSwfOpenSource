package com.sulake.habbo.communication.messages.incoming.newnavigator
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class LiftedRoomData
    {
        private var _flatId:int;
        private var _areaId:int;
        private var _image:String;
        private var _caption:String;

        public function LiftedRoomData(k:IMessageDataWrapper)
        {
            this._flatId = k.readInteger();
            this._areaId = k.readInteger();
            this._image = k.readString();
            this._caption = k.readString();
        }

        public function get flatId():int
        {
            return this._flatId;
        }

        public function get areaId():int
        {
            return this._areaId;
        }

        public function get image():String
        {
            return this._image;
        }

        public function get caption():String
        {
            return this._caption;
        }
    }
}
