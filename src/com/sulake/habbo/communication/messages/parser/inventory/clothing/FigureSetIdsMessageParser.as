package com.sulake.habbo.communication.messages.parser.inventory.clothing
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import __AS3__.vec.*;

    public class FigureSetIdsMessageParser implements IMessageParser 
    {
        private var _figureSetIds:Vector.<int>;
        private var _boundFurnitureNames:Vector.<String>;


        public function flush():Boolean
        {
            this._figureSetIds = new Vector.<int>(0);
            this._boundFurnitureNames = new Vector.<String>(0);
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_2:int = k.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                this._figureSetIds.push(k.readInteger());
                _local_3++;
            }
            _local_2 = k.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                this._boundFurnitureNames.push(k.readString());
                _local_3++;
            }
            return true;
        }

        public function get _Str_23010():Vector.<int>
        {
            return this._figureSetIds;
        }

        public function get _parser9():Vector.<String>
        {
            return this._boundFurnitureNames;
        }
    }
}
