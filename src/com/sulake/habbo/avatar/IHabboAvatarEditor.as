package com.sulake.habbo.avatar
{
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.IWindowContainer;
    import flash.events.IEventDispatcher;

    public interface IHabboAvatarEditor extends IUnknown 
    {
        function openEditor(_arg_1:uint, _arg_2:_Str_5523, _arg_3:Array=null, _arg_4:Boolean=false, _arg_5:String=null, _arg_6:String="generic"):IFrameWindow;
        function _Str_24938(_arg_1:uint, _arg_2:IWindowContainer, _arg_3:_Str_5523=null, _arg_4:Array=null, _arg_5:Boolean=false, _arg_6:Boolean=false):Boolean;
        function loadAvatarInEditor(_arg_1:uint, _arg_2:String, _arg_3:String, _arg_4:int=0):void;
        function loadOwnAvatarInEditor(_arg_1:uint):void;
        function get events():IEventDispatcher;
        function close(_arg_1:uint):void;
    }
}
