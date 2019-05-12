package com.sulake.habbo.avatar.common
{
    import com.sulake.core.window.IWindowContainer;

    public interface IAvatarEditorGridView 
    {
        function dispose():void;
        function get window():IWindowContainer;
        function initFromList(_arg_1:IAvatarEditorCategoryModel, _arg_2:String):void;
        function _Str_5614(_arg_1:int):void;
    }
}
