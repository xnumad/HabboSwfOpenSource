package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class EventCategory
    {
        private var _categoryId:int;
        private var _Str_19340:String;
        private var _visible:Boolean;

        public function EventCategory(k:IMessageDataWrapper)
        {
            this._categoryId = k.readInteger();
            this._Str_19340 = k.readString();
            this._visible = k.readBoolean();
        }

        public function get categoryId():int
        {
            return this._categoryId;
        }

        public function get _Str_26101():String
        {
            return this._Str_19340;
        }

        public function get visible():Boolean
        {
            return this._visible;
        }
    }
}
