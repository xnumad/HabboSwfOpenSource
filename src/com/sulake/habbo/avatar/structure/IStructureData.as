package com.sulake.habbo.avatar.structure
{
    import com.sulake.habbo.avatar.structure.figure.ISetType;
    import com.sulake.habbo.avatar.structure.figure.IPalette;
    import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;

    public interface IStructureData 
    {
        function _Str_740(_arg_1:String):ISetType;
        function getPalette(_arg_1:int):IPalette;
        function _Str_938(_arg_1:int):IFigurePartSet;
    }
}
