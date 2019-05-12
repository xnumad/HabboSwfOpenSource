package com.sulake.habbo.communication.messages.parser.moderation
{
    import com.sulake.core.runtime.IDisposable;
    import flash.utils.getTimer;

    public class _Str_2484 implements IDisposable 
    {
        public static const _Str_5035:int = 1;
        public static const _Str_8056:int = 2;
        public static const _Str_17136:int = 3;

        private var _Str_6036:int;
        private var _state:int;
        private var _Str_2629:int;
        private var _Str_21044:int;
        private var _issueAgeInMilliseconds:Number;
        private var _priority:int;
        private var _Str_9559:int;
        private var _Str_21130:int;
        private var _Str_19722:String;
        private var _Str_2797:int;
        private var _Str_5502:String;
        private var _Str_9859:int;
        private var _Str_21393:String;
        private var _message:String;
        private var _Str_10679:int;
        private var _Str_15205:Array;
        private var _disposed:Boolean = false;
        private var _Str_19084:Number;

        public function _Str_2484(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:Number, _arg_6:int, _arg_7:int, _arg_8:int, _arg_9:String, _arg_10:int, _arg_11:String, _arg_12:int, _arg_13:String, _arg_14:String, _arg_15:int, _arg_16:Array)
        {
            this._Str_6036 = k;
            this._state = _arg_2;
            this._Str_2629 = _arg_3;
            this._Str_21044 = _arg_4;
            this._issueAgeInMilliseconds = _arg_5;
            this._priority = _arg_6;
            this._Str_9559 = _arg_7;
            this._Str_21130 = _arg_8;
            this._Str_19722 = _arg_9;
            this._Str_2797 = _arg_10;
            this._Str_5502 = _arg_11;
            this._Str_9859 = _arg_12;
            this._Str_21393 = _arg_13;
            this._message = _arg_14;
            this._Str_10679 = _arg_15;
            this._Str_15205 = _arg_16;
            this._Str_19084 = getTimer();
        }

        public function get _Str_2869():int
        {
            return this._Str_6036;
        }

        public function get state():int
        {
            return this._state;
        }

        public function get _Str_2712():int
        {
            return this._Str_2629;
        }

        public function get _Str_7437():int
        {
            return this._Str_21044;
        }

        public function get issueAgeInMilliseconds():Number
        {
            return this._issueAgeInMilliseconds;
        }

        public function get priority():int
        {
            return this._priority;
        }

        public function get _Str_16842():int
        {
            return this._Str_9559;
        }

        public function get _Str_19929():int
        {
            return this._Str_21130;
        }

        public function get _Str_19615():String
        {
            return this._Str_19722;
        }

        public function get _Str_2662():int
        {
            return this._Str_2797;
        }

        public function get _Str_5842():String
        {
            return this._Str_5502;
        }

        public function get _Str_5547():int
        {
            return this._Str_9859;
        }

        public function get _Str_22164():String
        {
            return this._Str_21393;
        }

        public function get message():String
        {
            return this._message;
        }

        public function get _Str_20325():int
        {
            return this._Str_10679;
        }

        public function get _Str_26050():Array
        {
            return this._Str_15205;
        }

        public function dispose():void
        {
            var k:_Str_8176;
            if (this.disposed)
            {
                return;
            }
            for each (k in this._Str_15205)
            {
                k.dispose();
            }
            this._Str_15205 = [];
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function _Str_15885(k:int):String
        {
            var _local_2:int = (((this._issueAgeInMilliseconds + k) - this._Str_19084) / 1000);
            var _local_3:int = (_local_2 / 60);
            var _local_4:int = (_local_3 % 60);
            var _local_5:int = (_local_3 / 60);
            var _local_6:String = (((_local_4 < 10) ? "0" : "") + _local_4);
            var _local_7:String = (((_local_5 < 10) ? "0" : "") + _local_5);
            return (_local_7 + ":") + _local_6;
        }
    }
}
