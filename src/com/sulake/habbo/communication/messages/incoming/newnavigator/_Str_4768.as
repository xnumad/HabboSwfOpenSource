package com.sulake.habbo.communication.messages.incoming.newnavigator
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_4768 
    {
        private var _flatId:int;
        private var _Str_20569:int;
        private var _image:String;
        private var _caption:String;

        public function _Str_4768(k:IMessageDataWrapper)
        {
            this._flatId = k.readInteger();
            this._Str_20569 = k.readInteger();
            this._image = k.readString();
            this._caption = k.readString();
        }

        public function get flatId():int
        {
            return this._flatId;
        }

        public function get _Str_26306():int
        {
            return this._Str_20569;
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
