package com.sulake.habbo.sound
{
    import com.sulake.core.runtime.IUnknown;
    import flash.events.IEventDispatcher;

    public interface IHabboSoundManager extends IUnknown 
    {
        function set genericVolume(_arg_1:Number):void;
        function set traxVolume(_arg_1:Number):void;
        function set furniVolume(_arg_1:Number):void;
        function get genericVolume():Number;
        function get traxVolume():Number;
        function get furniVolume():Number;
        function get musicController():IHabboMusicController;
        function playSound(_arg_1:String, _arg_2:int=0):void;
        function stopSound(_arg_1:String):void;
        function playSoundAtPitch(_arg_1:String, _arg_2:Number):IHabboSound;
        function loadTraxSong(_arg_1:int, _arg_2:String):IHabboSound;
        function mute(_arg_1:Boolean):void;
        function previewVolume(_arg_1:Number, _arg_2:Number, _arg_3:Number):void;
        function get events():IEventDispatcher;
    }
}
