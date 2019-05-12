package com.sulake.habbo.communication.messages.incoming.callforhelp
{
    import com.sulake.habbo.communication.messages.incoming.moderation._Str_817;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_3509 implements _Str_817 
    {
        private var _name:String;
        private var _id:int;
        private var _Str_18308:String;

        public function _Str_3509(k:IMessageDataWrapper)
        {
            this._name = k.readString();
            this._id = k.readInteger();
            this._Str_18308 = k.readString();
            Logger.log(((((("READ CFH TOPIC NAME: " + this._name) + ", ID: ") + this._id) + ", CONSEQUENCE: ") + this._Str_18308));
        }

        public function get name():String
        {
            return this._name;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get _Str_26337():String
        {
            return this._Str_18308;
        }
    }
}
