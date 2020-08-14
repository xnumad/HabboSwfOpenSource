package com.sulake.habbo.communication.messages.parser.room.furniture
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetFigureData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class OpenPetPackageRequestedMessageParser implements IMessageParser
    {
        private var _objectId:int = -1;
        private var _figureData:PetFigureData;


        public function get objectId():int
        {
            return this._objectId;
        }

        public function get figureData():PetFigureData
        {
            return this._figureData;
        }

        public function flush():Boolean
        {
            this._objectId = -1;
            this._figureData = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k == null)
            {
                return false;
            }
            this._objectId = k.readInteger();
            if (!k.bytesAvailable)
            {
                return true;
            }
            this._figureData = new PetFigureData(k);
            return true;
        }
    }
}
