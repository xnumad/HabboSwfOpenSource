package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_5224 implements IDisposable 
    {
        private var _Str_6284:int;
        private var _Str_7862:int;
        private var _Str_2549:Array;
        private var _disposed:Boolean;

        public function _Str_5224(k:IMessageDataWrapper)
        {
            var _local_4:_Str_3666;
            this._Str_2549 = new Array();
            super();
            if (k == null)
            {
                return;
            }
            this._Str_6284 = k.readInteger();
            this._Str_7862 = k.readInteger();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = new _Str_3666();
                _local_4._Str_12651 = k.readInteger();
                _local_4._Str_13964 = k.readInteger();
                this._Str_2549.push(_local_4);
                _local_3++;
            }
            if (this._Str_6284 == 0)
            {
                this.setDefaults();
            }
        }

        public function setDefaults():void
        {
            this._Str_6284 = 1;
            this._Str_7862 = 0;
            var k:_Str_3666 = new _Str_3666();
            k._Str_12651 = 4;
            k._Str_13964 = 1;
            this._Str_2549.push(k);
        }

        public function _Str_20539():_Str_5224
        {
            var _local_2:_Str_3666;
            var k:_Str_5224 = new _Str_5224(null);
            k._Str_6284 = this._Str_6284;
            k._Str_7862 = this._Str_7862;
            for each (_local_2 in this._Str_2549)
            {
                k._Str_2549.push(_local_2._Str_20539());
            }
            return k;
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this._disposed = true;
            this._Str_2549 = null;
        }

        public function _Str_22978():String
        {
            var _local_2:_Str_3666;
            var k:* = (this._Str_7862 + ";");
            k = (k + (this._Str_6284 + ";"));
            for each (_local_2 in this._Str_2549)
            {
                k = (k + (((_local_2._Str_13964 + ",") + _local_2._Str_12651) + ";"));
            }
            return k;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get _Str_22663():int
        {
            return this._Str_6284;
        }

        public function get _Str_25765():int
        {
            return this._Str_7862;
        }

        public function get _Str_26098():Array
        {
            return this._Str_2549;
        }

        public function set _Str_22663(k:int):void
        {
            this._Str_6284 = k;
        }

        public function set _Str_25765(k:int):void
        {
            this._Str_7862 = k;
        }
    }
}
