package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window.IWidget;

    public interface IAvatarImageWidget extends IWidget
    {
        function get figure():String;
        function set figure(_arg_1:String):void;
        function get scale():String;
        function set scale(_arg_1:String):void;
        function get onlyHead():Boolean;
        function set onlyHead(_arg_1:Boolean):void;
        function get _Str_13833():Boolean;
        function set _Str_13833(_arg_1:Boolean):void;
        function get direction():int;
        function set direction(_arg_1:int):void;
        function get userId():int;
        function set userId(_arg_1:int):void;
    }
}
