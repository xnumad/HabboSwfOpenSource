package com.sulake.habbo.avatar.common
{
    import com.sulake.habbo.avatar.HabboAvatarEditor;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.inventory.IHabboInventory;

    public interface IAvatarEditorCategoryModel 
    {
        function dispose():void;
        function reset():void;
        function get controller():HabboAvatarEditor;
        function getWindowContainer():IWindow;
        function switchCategory(_arg_1:String=""):void;
        function getCategoryData(_arg_1:String):CategoryData;
        function selectPart(_arg_1:String, _arg_2:int):void;
        function selectColor(_arg_1:String, _arg_2:int, _arg_3:int):void;
        function _Str_20411(_arg_1:int):Boolean;
        function _Str_7960(_arg_1:IHabboInventory):Boolean;
        function _Str_15298(_arg_1:int):Boolean;
        function _Str_8360():Boolean;
    }
}
