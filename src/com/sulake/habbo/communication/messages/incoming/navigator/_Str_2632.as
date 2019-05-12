package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_2632 implements IDisposable 
    {
        public static const _Str_14955:int = 1;
        public static const _Str_12025:int = 2;
        public static const _Str_16098:int = 4;

        private var _index:int;
        private var _Str_20260:String;
        private var _Str_21337:String;
        private var _Str_21113:Boolean;
        private var _picText:String;
        private var _Str_6192:String;
        private var _Str_22099:int;
        private var _userCount:int;
        private var _type:int;
        private var _tag:String;
        private var _Str_2567:_Str_2370;
        private var _open:Boolean;
        private var _disposed:Boolean;

        public function _Str_2632(k:IMessageDataWrapper)
        {
            this._index = k.readInteger();
            this._Str_20260 = k.readString();
            this._Str_21337 = k.readString();
            this._Str_21113 = (k.readInteger() == 1);
            this._picText = k.readString();
            this._Str_6192 = k.readString();
            this._Str_22099 = k.readInteger();
            this._userCount = k.readInteger();
            this._type = k.readInteger();
            if (this._type == _Str_14955)
            {
                this._tag = k.readString();
            }
            else
            {
                if (this._type == _Str_12025)
                {
                    this._Str_2567 = new _Str_2370(k);
                }
                else
                {
                    this._open = k.readBoolean();
                }
            }
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this._disposed = true;
            if (this._Str_2567 != null)
            {
                this._Str_2567.dispose();
                this._Str_2567 = null;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get type():int
        {
            return this._type;
        }

        public function get index():int
        {
            return this._index;
        }

        public function get _Str_9428():String
        {
            return this._Str_20260;
        }

        public function get _Str_22426():String
        {
            return this._Str_21337;
        }

        public function get _Str_5386():Boolean
        {
            return this._Str_21113;
        }

        public function get picText():String
        {
            return this._picText;
        }

        public function get _Str_10304():String
        {
            return this._Str_6192;
        }

        public function get _Str_22186():int
        {
            return this._Str_22099;
        }

        public function get tag():String
        {
            return this._tag;
        }

        public function get userCount():int
        {
            return this._userCount;
        }

        public function get _Str_5019():_Str_2370
        {
            return this._Str_2567;
        }

        public function get open():Boolean
        {
            return this._open;
        }

        public function _Str_16147():void
        {
            this._open = (!(this._open));
        }

        public function get _Str_23003():int
        {
            if (this.type == _Str_14955)
            {
                return 0;
            }
            if (this.type == _Str_12025)
            {
                return this._Str_2567._Str_9029;
            }
            return 0;
        }
    }
}
