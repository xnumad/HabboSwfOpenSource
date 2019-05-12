package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_3451 implements IDisposable 
    {
        private var _code:String;
        private var _Str_21922:String;
        private var _Str_10956:_Str_2370;
        private var _rooms:Array;
        private var _open:Boolean;
        private var _Str_20192:Boolean;
        private var _disposed:Boolean;

        public function _Str_3451(k:IMessageDataWrapper)
        {
            this._rooms = new Array();
            super();
            this._code = k.readString();
            this._Str_21922 = k.readString();
            var _local_2:int = k.readInteger();
            this._Str_10956 = new _Str_2370(k);
            var _local_3:int = 1;
            while (_local_3 < _local_2)
            {
                this._rooms.push(new _Str_2370(k));
                _local_3++;
            }
        }

        public function dispose():void
        {
            var k:_Str_2370;
            if (this._disposed)
            {
                return;
            }
            this._disposed = true;
            if (this._Str_10956)
            {
                this._Str_10956.dispose();
                this._Str_10956 = null;
            }
            for each (k in this.rooms)
            {
                k.dispose();
            }
            this._rooms = null;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get code():String
        {
            return this._code;
        }

        public function get _Str_23315():String
        {
            return this._Str_21922;
        }

        public function get rooms():Array
        {
            return this._rooms;
        }

        public function get open():Boolean
        {
            return this._open;
        }

        public function set open(k:Boolean):void
        {
            this._open = k;
        }

        public function _Str_16147():void
        {
            this._open = (!(this._open));
        }

        public function get _Str_7144():_Str_2370
        {
            return this._Str_10956;
        }

        public function get _Str_24011():Boolean
        {
            return this._Str_20192;
        }

        public function set _Str_24011(k:Boolean):void
        {
            this._Str_20192 = k;
        }
    }
}
