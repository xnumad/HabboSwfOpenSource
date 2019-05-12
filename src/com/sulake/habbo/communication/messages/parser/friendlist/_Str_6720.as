package com.sulake.habbo.communication.messages.parser.friendlist
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.friendlist.FriendParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6720 implements IMessageParser 
    {
        protected var _Str_6580:int;
        protected var _Str_6945:int;
        private var _Str_14849:Array;


        public function get _Str_7430():int
        {
            return this._Str_6580;
        }

        public function get _Str_9600():int
        {
            return this._Str_6945;
        }

        public function get _Str_16756():Array
        {
            return this._Str_14849;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_6580 = k.readInteger();
            this._Str_6945 = k.readInteger();
            this._Str_14849 = new Array();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._Str_14849.push(new FriendParser(k));
                _local_3++;
            }
            return true;
        }

        public function flush():Boolean
        {
            this._Str_14849 = new Array();
            return true;
        }
    }
}
