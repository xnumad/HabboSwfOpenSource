//com.sulake.habbo.avatar.structure.FigureData

package com.sulake.habbo.avatar.structure{
    import flash.utils.Dictionary;
    import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
    import com.sulake.habbo.avatar.structure.figure.ISetType;
    import com.sulake.habbo.avatar.structure.figure.IPalette;

    public class FigureData implements IStructureData, IFigureData {

        private var _palettes:Dictionary;
        private var _setTypes:Dictionary;

        public function FigureData();

        public function dispose():void;

        public function parse(k:XML):Boolean;

        public function injectXML(k:XML):void;

        public function appendXML(k:XML):Boolean;

        public function getMandatorySetTypeIds(k:String, _arg_2:int):Array;

        public function getDefaultPartSet(k:String, _arg_2:String):IFigurePartSet;

        public function getSetType(k:String):ISetType;

        public function getPalette(k:int):IPalette;


    }
}//package com.sulake.habbo.avatar.structure

