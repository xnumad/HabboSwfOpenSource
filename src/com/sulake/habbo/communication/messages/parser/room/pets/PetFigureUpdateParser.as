package com.sulake.habbo.communication.messages.parser.room.pets
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetFigureData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PetFigureUpdateParser implements IMessageParser 
    {
        private var _Str_2775:int;
        private var _Str_2388:int;
        private var _figureData:PetFigureData;
        private var _Str_6842:Boolean;
        private var _Str_3253:Boolean;


        public function get roomIndex():int
        {
            return this._Str_2775;
        }

        public function get _Str_2508():int
        {
            return this._Str_2388;
        }

        public function get figureData():PetFigureData
        {
            return this._figureData;
        }

        public function get _Str_4799():Boolean
        {
            return this._Str_6842;
        }

        public function get isRiding():Boolean
        {
            return this._Str_3253;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_2775 = k.readInteger();
            this._Str_2388 = k.readInteger();
            this._figureData = new PetFigureData(k);
            this._Str_6842 = k.readBoolean();
            this._Str_3253 = k.readBoolean();
            return true;
        }
    }
}
