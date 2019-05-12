package com.sulake.habbo.communication.messages.parser.groupforums
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_3372 extends _Str_2807 
    {
        private var _Str_6730:int;
        private var _Str_6541:int;
        private var _Str_9497:int;
        private var _Str_9468:int;
        private var _Str_17602:String;
        private var _Str_18223:String;
        private var _Str_17180:String;
        private var _Str_18661:String;
        private var _Str_21185:String;
        private var _Str_20626:Boolean;
        private var _Str_20847:Boolean;


        public static function _Str_4933(k:IMessageDataWrapper):_Str_3372
        {
            var _local_2:_Str_3372 = new (_Str_3372)();
            _Str_2807.fillFromMessage(_local_2, k);
            _local_2._Str_6730 = k.readInteger();
            _local_2._Str_6541 = k.readInteger();
            _local_2._Str_9497 = k.readInteger();
            _local_2._Str_9468 = k.readInteger();
            _local_2._Str_17602 = k.readString();
            _local_2._Str_18223 = k.readString();
            _local_2._Str_17180 = k.readString();
            _local_2._Str_18661 = k.readString();
            _local_2._Str_21185 = k.readString();
            _local_2._Str_20626 = k.readBoolean();
            _local_2._Str_20847 = k.readBoolean();
            return _local_2;
        }


        public function get _Str_24871():int
        {
            return this._Str_6730;
        }

        public function get _Str_25794():int
        {
            return this._Str_6541;
        }

        public function get _Str_24408():int
        {
            return this._Str_9497;
        }

        public function get _Str_24549():int
        {
            return this._Str_9468;
        }

        public function get _Str_22865():Boolean
        {
            return this._Str_17602.length == 0;
        }

        public function get _Str_21331():Boolean
        {
            return true;
        }

        public function get _Str_20636():Boolean
        {
            return this._Str_18223.length == 0;
        }

        public function get _Str_23163():Boolean
        {
            return this._Str_17180.length == 0;
        }

        public function get _Str_7246():Boolean
        {
            return this._Str_18661.length == 0;
        }

        public function get _Str_25616():Boolean
        {
            return this._Str_20626;
        }

        public function get _Str_7449():Boolean
        {
            return this._Str_20847;
        }

        public function get _Str_24689():String
        {
            return this._Str_17602;
        }

        public function get _Str_23527():String
        {
            return this._Str_18223;
        }

        public function get _Str_22973():String
        {
            return this._Str_17180;
        }

        public function get _Str_25440():String
        {
            return this._Str_18661;
        }

        public function get _Str_26416():String
        {
            return this._Str_21185;
        }
    }
}
