package com.sulake.habbo.communication.messages.parser.room.furniture
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetFigureData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7736 implements IMessageParser 
    {
        private var _Str_2319:int = -1;
        private var _figureData:PetFigureData;


        public function get _Str_1577():int
        {
            return this._Str_2319;
        }

        public function get figureData():PetFigureData
        {
            return this._figureData;
        }

        public function flush():Boolean
        {
            this._Str_2319 = -1;
            this._figureData = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k == null)
            {
                return false;
            }
            this._Str_2319 = k.readInteger();
            if (!k.bytesAvailable)
            {
                return true;
            }
            this._figureData = new PetFigureData(k);
            return true;
        }
    }
}
