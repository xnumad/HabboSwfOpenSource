package com.sulake.habbo.moderation
{
    import flash.utils.Dictionary;

    public interface IChatLogListener 
    {
        function onChatlog(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:Array, _arg_5:Dictionary):void;
    }
}
