package com.sulake.habbo.avatar.structure
{
    import flash.utils.Dictionary;
    import com.sulake.habbo.avatar.structure.figure.Palette;
    import com.sulake.habbo.avatar.structure.figure.SetType;
    import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
    import com.sulake.habbo.avatar.structure.figure.ISetType;
    import com.sulake.habbo.avatar.structure.figure.IPalette;
    import com.sulake.habbo.avatar.structure.figure.*;

    public class FigureSetData implements IFigureSetData, IStructureData 
    {
        private var _palettes:Dictionary;
        private var _setTypes:Dictionary;

        public function FigureSetData()
        {
            this._palettes = new Dictionary();
            this._setTypes = new Dictionary();
        }

        public function dispose():void
        {
        }

        public function parse(k:XML):Boolean
        {
            var _local_2:XML;
            var _local_3:XML;
            if (k == null)
            {
                return false;
            }
            for each (_local_2 in k.colors.palette)
            {
                this._palettes[String(_local_2.@id)] = new Palette(_local_2);
            }
            for each (_local_3 in k.sets.settype)
            {
                this._setTypes[String(_local_3.@type)] = new SetType(_local_3);
            }
            return true;
        }

        public function _Str_1133(k:XML):void
        {
            var _local_2:XML;
            var _local_3:SetType;
            for each (_local_2 in k.sets.settype)
            {
                _local_3 = this._setTypes[String(_local_2.@type)];
                if (_local_3 != null)
                {
                    _local_3.cleanUp(_local_2);
                }
                else
                {
                    this._setTypes[String(_local_2.@type)] = new SetType(_local_2);
                }
            }
            this._Str_1017(k);
        }

        public function _Str_1017(k:XML):Boolean
        {
            var _local_2:XML;
            var _local_3:XML;
            var _local_4:Palette;
            var _local_5:SetType;
            if (k == null)
            {
                return false;
            }
            for each (_local_2 in k.colors.palette)
            {
                _local_4 = this._palettes[String(_local_2.@id)];
                if (_local_4 == null)
                {
                    this._palettes[String(_local_2.@id)] = new Palette(_local_2);
                }
                else
                {
                    _local_4._Str_2015(_local_2);
                }
            }
            for each (_local_3 in k.sets.settype)
            {
                _local_5 = this._setTypes[String(_local_3.@type)];
                if (_local_5 == null)
                {
                    this._setTypes[String(_local_3.@type)] = new SetType(_local_3);
                }
                else
                {
                    _local_5._Str_2015(_local_3);
                }
            }
            return false;
        }

        public function getMandatorySetTypeIds(k:String, _arg_2:int):Array
        {
            var _local_4:SetType;
            var _local_3:Array = new Array();
            for each (_local_4 in this._setTypes)
            {
                if (((_local_4) && (_local_4._Str_895(k, _arg_2))))
                {
                    _local_3.push(_local_4.type);
                }
            }
            return _local_3;
        }

        public function _Str_2264(k:String, _arg_2:String):IFigurePartSet
        {
            var _local_3:SetType = (this._setTypes[k] as SetType);
            if (_local_3)
            {
                return _local_3._Str_2264(_arg_2);
            }
            return null;
        }

        public function _Str_740(k:String):ISetType
        {
            return this._setTypes[k];
        }

        public function getPalette(k:int):IPalette
        {
            return this._palettes[String(k)];
        }

        public function _Str_938(k:int):IFigurePartSet
        {
            var _local_2:SetType;
            var _local_3:IFigurePartSet;
            for each (_local_2 in this._setTypes)
            {
                _local_3 = _local_2._Str_1020(k);
                if (_local_3 != null)
                {
                    return _local_3;
                }
            }
            return null;
        }
    }
}
