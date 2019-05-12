package com.sulake.habbo.communication.messages.parser.notifications
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetFigureData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7160 implements IMessageParser 
    {
        private var _Str_2388:int;
        private var _petName:String;
        private var _level:int;
        private var _figureData:PetFigureData;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_2388 = k.readInteger();
            this._petName = k.readString();
            this._level = k.readInteger();
            this._figureData = new PetFigureData(k);
            return true;
        }

        public function get _Str_2508():int
        {
            return this._Str_2388;
        }

        public function get petName():String
        {
            return this._petName;
        }

        public function get level():int
        {
            return this._level;
        }

        public function get figureData():PetFigureData
        {
            return this._figureData;
        }
    }
}
