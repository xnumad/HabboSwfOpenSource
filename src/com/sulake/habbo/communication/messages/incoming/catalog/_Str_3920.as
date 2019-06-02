package com.sulake.habbo.communication.messages.incoming.catalog
{
    import flash.utils.getTimer;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_3920 
    {
        public static const _Str_13638:int = 0;
        public static const _Str_15225:int = 1;
        public static const _Str_17904:int = 2;

        private var _type:int;
        private var _position:int;
        private var _Str_10488:String;
        private var _Str_21319:String;
        private var _Str_21451:String;
        private var _Str_2570:String;
        private var _Str_19890:int;
        private var _Str_4678:int;

        public function _Str_3920(k:IMessageDataWrapper)
        {
            if (!k)
            {
                return;
            }
            this._position = k.readInteger();
            this._Str_10488 = k.readString();
            this._Str_21319 = k.readString();
            this._type = k.readInteger();
            switch (this._type)
            {
                case _Str_13638:
                    this._Str_21451 = k.readString();
                    break;
                case _Str_17904:
                    this._Str_2570 = k.readString();
                    break;
                case _Str_15225:
                    this._Str_19890 = k.readInteger();
                    break;
            }
            var _local_2:int = k.readInteger();
            this._Str_4678 = ((_local_2 > 0) ? ((_local_2 * 1000) + getTimer()) : 0);
        }

        public function get position():int
        {
            return this._position;
        }

        public function get itemName():String
        {
            return this._Str_10488;
        }

        public function get _Str_15933():String
        {
            return this._Str_21319;
        }

        public function get _Str_17029():String
        {
            return this._Str_21451;
        }

        public function get _Str_26011():Boolean
        {
            return this._Str_4678 > 0;
        }

        public function get secondsToExpiration():int
        {
            return this._Str_4678 - getTimer();
        }

        public function get type():int
        {
            return this._type;
        }

        public function get productCode():String
        {
            return this._Str_2570;
        }

        public function get _Str_24645():int
        {
            return this._Str_19890;
        }
    }
}
