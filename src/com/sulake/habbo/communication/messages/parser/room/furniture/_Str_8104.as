package com.sulake.habbo.communication.messages.parser.room.furniture
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8104 implements IMessageParser 
    {
        private var _Str_2625:String;
        private var _Str_2825:int;
        private var _Str_2570:String;
        private var _Str_3054:int;
        private var _Str_3970:String;
        private var _Str_3224:Boolean;
        private var _Str_10229:String;


        public function get _Str_2887():String
        {
            return this._Str_2625;
        }

        public function get classId():int
        {
            return this._Str_2825;
        }

        public function get productCode():String
        {
            return this._Str_2570;
        }

        public function get placedItemId():int
        {
            return this._Str_3054;
        }

        public function get placedItemType():String
        {
            return this._Str_3970;
        }

        public function get _Str_4057():Boolean
        {
            return this._Str_3224;
        }

        public function get petFigureString():String
        {
            return this._Str_10229;
        }

        public function flush():Boolean
        {
            this._Str_2625 = "";
            this._Str_2825 = 0;
            this._Str_2570 = "";
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k == null)
            {
                return false;
            }
            this._Str_2625 = k.readString();
            this._Str_2825 = k.readInteger();
            this._Str_2570 = k.readString();
            this._Str_3054 = k.readInteger();
            this._Str_3970 = k.readString();
            this._Str_3224 = k.readBoolean();
            this._Str_10229 = k.readString();
            return true;
        }
    }
}
