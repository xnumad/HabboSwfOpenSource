package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7512 implements IMessageParser 
    {
        private var _Str_4489:String = null;
        private var _Str_4577:String = null;
        private var _Str_4496:String = null;
        private var _Str_18118:String = null;


        public function get _Str_5207():String
        {
            return this._Str_4489;
        }

        public function get _Str_5259():String
        {
            return this._Str_4577;
        }

        public function get _Str_5109():String
        {
            return this._Str_4496;
        }

        public function get _Str_25889():String
        {
            return this._Str_18118;
        }

        public function flush():Boolean
        {
            this._Str_4489 = null;
            this._Str_4577 = null;
            this._Str_4496 = null;
            this._Str_18118 = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:String = k.readString();
            var _local_3:String = k.readString();
            switch (_local_2)
            {
                case "floor":
                    this._Str_4489 = _local_3;
                    break;
                case "wallpaper":
                    this._Str_4577 = _local_3;
                    break;
                case "landscape":
                    this._Str_4496 = _local_3;
                    break;
                case "landscapeanim":
                    this._Str_18118 = _local_3;
                    break;
            }
            return true;
        }
    }
}
