package com.sulake.habbo.communication.messages.parser.inventory.furni
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.inventory.furni.FurniData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import __AS3__.vec.*;

    public class FurniListAddOrUpdateParser implements IMessageParser 
    {
        protected var _furniList:Vector.<FurniData>;


        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._furniList = new Vector.<FurniData>(0);
			this._furniList.push(new FurniData(k));
            return true;
        }

        public function flush():Boolean
        {
            this._furniList = null;
            return true;
        }

        public function getFurni():Vector.<FurniData>
        {
            return this._furniList;
        }
    }
}
