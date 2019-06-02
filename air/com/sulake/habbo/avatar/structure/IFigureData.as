//com.sulake.habbo.avatar.structure.IFigureData

package com.sulake.habbo.avatar.structure{
    import com.sulake.habbo.avatar.structure.figure.ISetType;
    import com.sulake.habbo.avatar.structure.figure.IPalette;

    public /*dynamic*/ interface IFigureData {

        function getSetType(k:String):ISetType;
        function getPalette(k:int):IPalette;

    }
}//package com.sulake.habbo.avatar.structure

