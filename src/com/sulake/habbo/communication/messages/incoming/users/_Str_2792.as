package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_2792 
    {
        private var _id:int;
        private var _color:uint;

        public function _Str_2792(k:IMessageDataWrapper)
        {
            this._id = k.readInteger();
            this._color = parseInt(k.readString(), 16);
        }

        public function get id():int
        {
            return this._id;
        }

        public function get color():uint
        {
            return this._color;
        }

        public function get red():int
        {
            return (this._color >> 16) & 0xFF;
        }

        public function get green():int
        {
            return (this._color >> 8) & 0xFF;
        }

        public function get blue():int
        {
            return (this._color >> 0) & 0xFF;
        }
    }
}
