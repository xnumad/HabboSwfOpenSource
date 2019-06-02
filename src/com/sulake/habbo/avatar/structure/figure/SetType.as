package com.sulake.habbo.avatar.structure.figure
{
    import com.sulake.core.utils.Map;
    import flash.utils.Dictionary;

    public class SetType implements ISetType 
    {
        private var _partSets:Map;
        private var _type:String;
        private var _paletteID:int;
        private var _isMandatory:Dictionary;

        public function SetType(k:XML)
        {
            this._type = String(k.@type);
            this._paletteID = parseInt(k.@paletteid);
            this._isMandatory = new Dictionary();
            this._isMandatory["F"] = new Array();
            this._isMandatory["M"] = new Array();
            this._isMandatory["F"][0] = Boolean(parseInt(k.@mand_f_0));
            this._isMandatory["F"][1] = Boolean(parseInt(k.@mand_f_1));
            this._isMandatory["M"][0] = Boolean(parseInt(k.@mand_m_0));
            this._isMandatory["M"][1] = Boolean(parseInt(k.@mand_m_1));
            this._partSets = new Map();
            this._Str_2015(k);
        }

        public function dispose():void
        {
            var k:FigurePartSet;
            for each (k in this._partSets.getValues())
            {
                k.dispose();
            }
            this._partSets.dispose();
            this._partSets = null;
        }

        public function cleanUp(k:XML):void
        {
            var _local_2:XML;
            var _local_3:String;
            var _local_4:FigurePartSet;
            for each (_local_2 in k["set"])
            {
                _local_3 = String(_local_2.@id);
                _local_4 = this._partSets.getValue(_local_3);
                if (_local_4 != null)
                {
                    _local_4.dispose();
                    this._partSets.remove(_local_3);
                }
            }
        }

        public function _Str_2015(k:XML):void
        {
            var _local_2:XML;
            for each (_local_2 in k["set"])
            {
                this._partSets.add(String(_local_2.@id), new FigurePartSet(_local_2, this._type));
            }
        }

        public function _Str_2264(k:String):IFigurePartSet
        {
            var _local_4:IFigurePartSet;
            var _local_2:Array = this._partSets.getKeys();
            var _local_3:int = (_local_2.length - 1);
            while (_local_3 >= 0)
            {
                _local_4 = this._partSets.getValue(_local_2[_local_3]);
                if ((((_local_4) && (_local_4.clubLevel == 0)) && ((_local_4.gender == k) || (_local_4.gender == "U"))))
                {
                    return _local_4;
                }
                _local_3--;
            }
            return null;
        }

        public function _Str_1020(k:int):IFigurePartSet
        {
            return this._partSets.getValue(String(k));
        }

        public function get type():String
        {
            return this._type;
        }

        public function get _Str_734():int
        {
            return this._paletteID;
        }

        public function _Str_895(k:String, _arg_2:int):Boolean
        {
            return this._isMandatory[k.toUpperCase()][Math.min(_arg_2, 1)];
        }

        public function _Str_1002(k:String):int
        {
            var _local_2:Array = this._isMandatory[k.toUpperCase()];
            return _local_2.indexOf(false);
        }

        public function get _Str_710():Map
        {
            return this._partSets;
        }
    }
}
