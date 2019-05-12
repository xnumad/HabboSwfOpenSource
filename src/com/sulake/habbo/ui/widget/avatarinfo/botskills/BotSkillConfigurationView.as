package com.sulake.habbo.ui.widget.avatarinfo.botskills
{
    import com.sulake.core.runtime.IDisposable;
    import flash.geom.Point;

    public interface BotSkillConfigurationView extends IDisposable 
    {
        function open(_arg_1:int, _arg_2:Point=null):void;
        function close():void;
        function parseConfiguration(_arg_1:String):void;
    }
}
