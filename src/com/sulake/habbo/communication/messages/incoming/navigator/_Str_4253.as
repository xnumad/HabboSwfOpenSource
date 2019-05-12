package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_4253 
    {
        private var _Str_2629:int;
        private var _Str_19340:String;
        private var _visible:Boolean;

        public function _Str_4253(k:IMessageDataWrapper)
        {
            this._Str_2629 = k.readInteger();
            this._Str_19340 = k.readString();
            this._visible = k.readBoolean();
        }

        public function get _Str_2712():int
        {
            return this._Str_2629;
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
